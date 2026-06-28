import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/websocket_message.dart';
import 'berth_api_provider.dart';

class WebSocketService {
  final BerthApiProvider _berthApiProvider;
  WebSocketChannel? _channel;
  Timer? _reconnectTimer;
  bool _isConnecting = false;
  bool _shouldReconnect = true;
  String? _endpoint;
  WebSocketConnectionStatus _status = WebSocketConnectionStatus.disconnected;

  static const int _reconnectInterval = 3000;

  final StreamController<Map<String, dynamic>> _messageController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<WebSocketConnectionStatus> _statusController =
      StreamController<WebSocketConnectionStatus>.broadcast();

  WebSocketService(this._berthApiProvider);

  WebSocketConnectionStatus get connectionStatus => _status;
  bool get isConnected => _status == WebSocketConnectionStatus.connected;

  Stream<Map<String, dynamic>> get messageStream => _messageController.stream;
  Stream<WebSocketConnectionStatus> get connectionStatusStream => _statusController.stream;

  Future<bool> connect(String endpoint) async {
    if (_isConnecting || isConnected) {
      return isConnected;
    }

    _endpoint = endpoint;
    _isConnecting = true;
    _setStatus(WebSocketConnectionStatus.connecting);

    try {
      final baseUrl = _berthApiProvider.baseUrl;
      final wsUrl = baseUrl.replaceFirst('http', 'ws');
      final uri = Uri.parse('$wsUrl$endpoint');

      final token = _berthApiProvider.authToken;
      final Map<String, String> headers = {};
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      if (_berthApiProvider.skipSslVerification) {
        final webSocket = await WebSocket.connect(
          uri.toString(),
          headers: headers,
          customClient: HttpClient()..badCertificateCallback = (cert, host, port) => true,
        );
        _channel = IOWebSocketChannel(webSocket);
      } else {
        _channel = IOWebSocketChannel.connect(uri, headers: headers);
      }

      await _channel!.ready;
      _setStatus(WebSocketConnectionStatus.connected);
      _isConnecting = false;

      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnection,
      );

      return true;
    } catch (e) {
      _isConnecting = false;
      _setStatus(WebSocketConnectionStatus.error);
      _scheduleReconnect();
      return false;
    }
  }

  void _handleMessage(dynamic message) {
    try {
      final Map<String, dynamic> data = json.decode(message.toString());
      if (!_messageController.isClosed) {
        _messageController.add(data);
      }
    } catch (e) {
      // Ignore malformed frames.
    }
  }

  void _handleError(dynamic error) {
    _setStatus(WebSocketConnectionStatus.error);
  }

  void _handleDisconnection() {
    _setStatus(WebSocketConnectionStatus.disconnected);
    if (_shouldReconnect) {
      _scheduleReconnect();
    }
  }

  void _scheduleReconnect() {
    if (!_shouldReconnect || _endpoint == null) {
      return;
    }
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(milliseconds: _reconnectInterval), () {
      if (_shouldReconnect) {
        connect(_endpoint!);
      }
    });
  }

  void _setStatus(WebSocketConnectionStatus newStatus) {
    if (_status != newStatus) {
      _status = newStatus;
      if (!_statusController.isClosed) {
        _statusController.add(newStatus);
      }
    }
  }

  void disconnect() {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _channel?.sink.close(status.goingAway);
    _setStatus(WebSocketConnectionStatus.disconnected);
  }

  void dispose() {
    disconnect();
    _messageController.close();
    _statusController.close();
  }
}
