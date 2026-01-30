import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/operation.dart';
import 'berth_api_provider.dart';

class OperationsService {
  final BerthApiProvider _berthApiProvider;
  WebSocketChannel? _channel;
  StreamController<StreamMessage>? _messageController;
  StreamController<bool>? _connectionController;
  StreamController<String>? _errorController;
  
  bool _isConnected = false;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 3;
  Timer? _reconnectTimer;
  Timer? _pingTimer;

  OperationsService(this._berthApiProvider) {
    _messageController = StreamController<StreamMessage>.broadcast();
    _connectionController = StreamController<bool>.broadcast();
    _errorController = StreamController<String>.broadcast();
  }

  Stream<StreamMessage> get messages => _messageController?.stream ?? const Stream.empty();
  Stream<bool> get connectionStatus => _connectionController?.stream ?? const Stream.empty();
  Stream<String> get errors => _errorController?.stream ?? const Stream.empty();

  bool get isConnected => _isConnected;

  Future<void> connect(int serverId, String stackName, {String? operationId}) async {
    await disconnect();

    try {
      final token = _berthApiProvider.authToken;
      if (token == null) {
        throw Exception('No authentication token available');
      }

      final baseUrl = _berthApiProvider.baseUrl;

      String wsUrl = baseUrl.replaceFirst('http://', 'ws://').replaceFirst('https://', 'wss://');

      String path = '/ws/api/servers/$serverId/stacks/${Uri.encodeComponent(stackName)}/operations';
      if (operationId != null) {
        path += '/$operationId';
      }

      final uri = Uri.parse('$wsUrl$path');

      final headers = <String, String>{
        'Authorization': 'Bearer $token',
      };

      if (_berthApiProvider.skipSslVerification) {
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

      if (_connectionController?.isClosed == false) {
        _connectionController!.add(false); 
      }

      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnected,
      );

      
      _startPingTimer();
      
      _isConnected = true;
      _reconnectAttempts = 0;
      if (_connectionController?.isClosed == false) {
        _connectionController!.add(true);
      }

    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> disconnect() async {
    _stopPingTimer();
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    
    if (_channel != null) {
      await _channel!.sink.close(status.goingAway);
      _channel = null;
    }

    _isConnected = false;
    
    
    if (_connectionController?.isClosed == false) {
      _connectionController?.add(false);
    }
  }

  Future<void> startOperation(OperationRequest request) async {
    if (!_isConnected || _channel == null) {
      throw Exception('Not connected to operations service');
    }

    final message = OperationWebSocketMessage(
      type: 'operation_request',
      data: request.toJson(),
    );

    _channel!.sink.add(jsonEncode(message.toJson()));
  }

  void _handleMessage(dynamic data) {
    try {
      final Map<String, dynamic> json = jsonDecode(data as String);
      
      
      if (_errorController?.isClosed == true || _messageController?.isClosed == true) {
        return;
      }
      
      
      if (json['type'] == 'error') {
        final error = json['error'] ?? 'Unknown error occurred';
        if (_errorController?.isClosed == false) {
          _errorController?.add(error);
        }
        return;
      }

      
      final streamMessage = StreamMessage.fromJson(json);
      if (_messageController?.isClosed == false) {
        _messageController?.add(streamMessage);
      }

    } catch (e) {
      if (_errorController?.isClosed == false) {
        _errorController?.add('Failed to parse message: $e');
      }
    }
  }

  void _handleError(dynamic error) {
    _isConnected = false;
    if (_connectionController?.isClosed == false) {
      _connectionController?.add(false);
    }
    if (_errorController?.isClosed == false) {
      _errorController?.add(error.toString());
    }

    
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnect();
    }
  }

  void _handleDisconnected() {
    _isConnected = false;
    if (_connectionController?.isClosed == false) {
      _connectionController?.add(false);
    }
    
    
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    _reconnectAttempts++;
    final delay = Duration(seconds: _reconnectAttempts * 2);
    
    _reconnectTimer = Timer(delay, () {
      
      
      if (_errorController?.isClosed == false) {
        _errorController?.add('Connection lost. Please reconnect manually.');
      }
    });
  }

  void _startPingTimer() {
    _stopPingTimer();
    _pingTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_isConnected && _channel != null) {
        
        
      } else {
        timer.cancel();
      }
    });
  }

  void _stopPingTimer() {
    _pingTimer?.cancel();
    _pingTimer = null;
  }

  void dispose() {
    disconnect();
    
    
    _messageController?.close();
    _connectionController?.close();
    _errorController?.close();
  }

  static List<OperationPreset> getDefaultPresets() {
    return [
      const OperationPreset(
        id: 'up',
        name: 'Start Stack',
        description: 'Start all services in the stack',
        command: 'up',
        options: [],
        icon: 'play_arrow',
        variant: OperationVariant.success,
      ),
      const OperationPreset(
        id: 'up-build',
        name: 'Start & Build',
        description: 'Build and start all services',
        command: 'up',
        options: ['--build'],
        icon: 'build',
        variant: OperationVariant.primary,
      ),
      const OperationPreset(
        id: 'down',
        name: 'Stop Stack',
        description: 'Stop and remove all containers',
        command: 'down',
        icon: 'stop',
        variant: OperationVariant.danger,
      ),
      const OperationPreset(
        id: 'restart',
        name: 'Restart Stack',
        description: 'Restart all services',
        command: 'restart',
        icon: 'refresh',
        variant: OperationVariant.warning,
      ),
      const OperationPreset(
        id: 'pull',
        name: 'Pull Images',
        description: 'Pull latest images for all services',
        command: 'pull',
        icon: 'download',
        variant: OperationVariant.secondary,
      ),
      const OperationPreset(
        id: 'stop',
        name: 'Stop Services',
        description: 'Stop running containers without removing them',
        command: 'stop',
        icon: 'pause',
        variant: OperationVariant.warning,
      ),
      const OperationPreset(
        id: 'start',
        name: 'Start Services',
        description: 'Start stopped containers',
        command: 'start',
        icon: 'play_circle',
        variant: OperationVariant.success,
      ),
    ];
  }
}