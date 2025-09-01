import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/websocket_message.dart';
import 'api_client.dart';
import 'config_service.dart';

class WebSocketService {
  final ApiClient _apiClient;
  final ConfigService _configService;
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>>? _messageController;
  Timer? _reconnectTimer;
  Timer? _heartbeatTimer;
  bool _isConnecting = false;
  bool _shouldReconnect = true;
  WebSocketConnectionStatus _status = WebSocketConnectionStatus.disconnected;
  
  final Set<String> _subscriptions = <String>{};
  final int _reconnectInterval = 3000; 
  final int _heartbeatInterval = 30000; 
  
  final StreamController<WebSocketConnectionStatus> _statusController = 
      StreamController<WebSocketConnectionStatus>.broadcast();

  WebSocketService(this._apiClient, this._configService);

  WebSocketConnectionStatus get connectionStatus => _status;
  bool get isConnected => _status == WebSocketConnectionStatus.connected;

  Stream<Map<String, dynamic>>? get messageStream => _messageController?.stream;
  Stream<WebSocketConnectionStatus> get connectionStatusStream => _statusController.stream;

  Future<bool> connect(String endpoint) async {
    if (_isConnecting || isConnected) {
      return isConnected;
    }

    _isConnecting = true;
    _setStatus(WebSocketConnectionStatus.connecting);

    try {
      final baseUrl = _apiClient.baseUrl;
      final wsUrl = baseUrl.replaceFirst('http', 'ws');
      final uri = Uri.parse('$wsUrl$endpoint');
      
      
      final token = _apiClient.authToken;
      final Map<String, String> headers = {};
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      if (_configService.skipSslVerification) {
        final webSocket = await WebSocket.connect(
          uri.toString(),
          headers: headers,
          customClient: HttpClient()..badCertificateCallback = (cert, host, port) => true,
        );
        _channel = IOWebSocketChannel(webSocket);
      } else {
        _channel = IOWebSocketChannel.connect(
          uri,
          headers: headers,
        );
      }

      _messageController = StreamController<Map<String, dynamic>>.broadcast();

      await _channel!.ready;
      _setStatus(WebSocketConnectionStatus.connected);
      _isConnecting = false;
      _lastEndpoint = endpoint;

      
      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnection,
      );

      
      _startHeartbeat();

      
      _resubscribe();

      return true;
    } catch (e) {
      _isConnecting = false;
      _setStatus(WebSocketConnectionStatus.error);
      _scheduleReconnect(endpoint);
      return false;
    }
  }

  void _handleMessage(dynamic message) {
    try {
      final Map<String, dynamic> data = json.decode(message.toString());
      _messageController?.add(data);
    } catch (e) {
      // Ignore
    }
  }

  void _handleError(dynamic error) {
    _setStatus(WebSocketConnectionStatus.error);
  }

  void _handleDisconnection() {
    _setStatus(WebSocketConnectionStatus.disconnected);
    _stopHeartbeat();
    
    if (_shouldReconnect) {
      _scheduleReconnect(_lastEndpoint);
    }
  }

  String? _lastEndpoint;
  
  void _scheduleReconnect(String? endpoint) {
    if (!_shouldReconnect || endpoint == null) {
      return;
    }
    
    _lastEndpoint = endpoint;
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(milliseconds: _reconnectInterval), () {
      if (_shouldReconnect) {
        connect(endpoint);
      }
    });
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(
      Duration(milliseconds: _heartbeatInterval), 
      (timer) {
        if (isConnected) {
          if (!_sendMessage({'type': 'ping'})) {
_handleDisconnection();
          }
        }
      },
    );
  }

  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  void _setStatus(WebSocketConnectionStatus status) {
    if (_status != status) {
      _status = status;
      _statusController.add(status);
    }
  }

  bool subscribe(String resource, int serverId, [String? stackName]) {    
    if (!isConnected) {
      return false;
    }

    final message = SubscribeMessage(
      resource: resource,
      serverId: serverId,
      stackName: stackName,
    );
    
    final subscriptionKey = _getSubscriptionKey(resource, serverId, stackName);
    if (_sendMessage(message.toJson())) {
      _subscriptions.add(subscriptionKey);
      return true;
    }
    return false;
  }

  bool unsubscribe(String resource, int serverId, [String? stackName]) {
    if (!isConnected) return false;

    final message = UnsubscribeMessage(
      resource: resource,
      serverId: serverId,
      stackName: stackName,
    );

    final subscriptionKey = _getSubscriptionKey(resource, serverId, stackName);
    if (_sendMessage(message.toJson())) {
      _subscriptions.remove(subscriptionKey);
      return true;
    }
    return false;
  }

  String _getSubscriptionKey(String resource, int serverId, String? stackName) {
    return stackName != null
        ? '$resource:$serverId:$stackName'
        : '$resource:$serverId';
  }

  void _resubscribe() {
    final subscriptions = List<String>.from(_subscriptions);
    _subscriptions.clear();
    
    for (final subscription in subscriptions) {
      final parts = subscription.split(':');
      if (parts.length >= 2) {
        final resource = parts[0];
        final serverId = int.tryParse(parts[1]);
        final stackName = parts.length > 2 ? parts[2] : null;
        
        if (serverId != null) {
          subscribe(resource, serverId, stackName);
        }
      }
    }
  }

  bool _sendMessage(Map<String, dynamic> message) {
    if (!isConnected || _channel == null) return false;

    try {
      _channel!.sink.add(json.encode(message));
      return true;
    } catch (e) {
_setStatus(WebSocketConnectionStatus.error);
      return false;
    }
  }

  void disconnect() {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _stopHeartbeat();
    _channel?.sink.close(status.goingAway);
    _messageController?.close();
    _subscriptions.clear();
    _setStatus(WebSocketConnectionStatus.disconnected);
  }

  void dispose() {
    disconnect();
    _statusController.close();
  }
}