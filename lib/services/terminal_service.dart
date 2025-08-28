import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/terminal_message.dart';
import '../models/websocket_message.dart';
import 'api_client.dart';

class TerminalService {
  final ApiClient _apiClient;
  WebSocketChannel? _channel;
  StreamController<TerminalOutputMessage>? _outputController;
  StreamController<TerminalSession>? _sessionController;
  Timer? _reconnectTimer;
  
  bool _isConnecting = false;
  bool _shouldReconnect = true;
  WebSocketConnectionStatus _status = WebSocketConnectionStatus.disconnected;
  TerminalSession _session = const TerminalSession(
    id: '',
    isConnected: false,
    isConnecting: false,
    serverId: 0,
    stackName: '',
    serviceName: '',
  );
  
  final int _reconnectInterval = 3000;
  final StreamController<WebSocketConnectionStatus> _statusController = 
      StreamController<WebSocketConnectionStatus>.broadcast();

  TerminalService(this._apiClient);

  // Getters
  WebSocketConnectionStatus get connectionStatus => _status;
  bool get isConnected => _status == WebSocketConnectionStatus.connected;
  TerminalSession get session => _session;

  // Streams
  Stream<TerminalOutputMessage>? get outputStream => _outputController?.stream;
  Stream<TerminalSession>? get sessionStream => _sessionController?.stream;
  Stream<WebSocketConnectionStatus> get connectionStatusStream => _statusController.stream;

  // Connection management
  Future<bool> connect(int serverId) async {
    if (_isConnecting || isConnected) {
      return isConnected;
    }

    _isConnecting = true;
    _setStatus(WebSocketConnectionStatus.connecting);

    try {
      final baseUrl = _apiClient.baseUrl;
      final wsUrl = baseUrl.replaceFirst('http', 'ws');
      final uri = Uri.parse('$wsUrl/ws/api/servers/$serverId/terminal');
      
      final token = _apiClient.authToken;
      final Map<String, String> headers = {};
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }

      _channel = IOWebSocketChannel.connect(
        uri,
        headers: headers,
      );

      // Close existing controllers if they exist to prevent resource leaks
      _outputController?.close();
      _sessionController?.close();
      
      _outputController = StreamController<TerminalOutputMessage>.broadcast();
      _sessionController = StreamController<TerminalSession>.broadcast();

      await _channel!.ready;
      _setStatus(WebSocketConnectionStatus.connected);
      _isConnecting = false;
      
      _setSession(_session.copyWith(
        serverId: serverId,
        isConnecting: false,
        isConnected: false,
        error: null,
      ));

      // Listen to messages
      _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnection,
      );

      return true;
    } catch (e) {
      _isConnecting = false;
      _setStatus(WebSocketConnectionStatus.error);
      _setSession(_session.copyWith(
        isConnecting: false,
        isConnected: false,
        error: 'Connection failed: $e',
      ));
      _scheduleReconnect(serverId);
      return false;
    }
  }

  // Terminal session management
  bool startTerminal({
    required String stackName,
    required String serviceName,
    String? containerName,
    int cols = 80,
    int rows = 24,
  }) {
    if (!isConnected || _session.isConnecting || _session.isConnected) {
      return false;
    }

    final startMessage = TerminalStartMessage(
      stackName: stackName,
      serviceName: serviceName,
      containerName: containerName,
      cols: cols,
      rows: rows,
    );

    final success = _sendMessage(startMessage.toJson());
    if (success) {
      _setSession(_session.copyWith(
        isConnecting: true,
        stackName: stackName,
        serviceName: serviceName,
        containerName: containerName,
      ));
    }

    return success;
  }

  bool sendInput(String sessionId, Uint8List input) {
    if (!_session.isConnected || _session.id != sessionId) {
      return false;
    }

    final inputMessage = TerminalInputMessage(
      sessionId: sessionId,
      input: input.toList(),
      timestamp: DateTime.now().toIso8601String(),
    );

    return _sendMessage(inputMessage.toJson());
  }

  bool resizeTerminal(String sessionId, int cols, int rows) {
    if (!_session.isConnected || _session.id != sessionId) {
      return false;
    }

    final resizeMessage = TerminalResizeMessage(
      sessionId: sessionId,
      cols: cols,
      rows: rows,
      timestamp: DateTime.now().toIso8601String(),
    );

    return _sendMessage(resizeMessage.toJson());
  }

  bool closeTerminal(String sessionId) {
    if (_session.id.isEmpty || _session.id != sessionId) {
      return false;
    }

    final closeMessage = TerminalCloseMessage(
      sessionId: sessionId,
      timestamp: DateTime.now().toIso8601String(),
    );
    
    final messageSent = _sendMessage(closeMessage.toJson());
    if (!messageSent) {
      // WebSocket is already closed, trigger disconnect directly
      _handleTerminalClose(0);
    }
    
    return true;
  }

  // Message handling
  void _handleMessage(dynamic message) {
    try {
      final Map<String, dynamic> data = json.decode(message.toString());
      final messageType = data['type'] as String?;

      switch (messageType) {
        case TerminalMessage.success:
          final successMessage = TerminalSuccessMessage.fromJson(data);
          if (successMessage.sessionId.isNotEmpty) {
            _setSession(_session.copyWith(
              id: successMessage.sessionId,
              isConnected: true,
              isConnecting: false,
              error: null,
            ));
          }
          break;

        case TerminalMessage.terminalOutput:
          final outputMessage = TerminalOutputMessage.fromJson(data);
          if (outputMessage.sessionId == _session.id) {
            _outputController?.add(outputMessage);
          }
          break;

        case TerminalMessage.terminalClose:
          final closeData = data;
          final exitCode = closeData['exit_code'] as int? ?? 0;
          _handleTerminalClose(exitCode);
          break;

        case TerminalMessage.error:
          final errorMessage = TerminalErrorMessage.fromJson(data);
          _setSession(_session.copyWith(
            isConnected: false,
            isConnecting: false,
            error: errorMessage.error,
          ));
          break;

        default:
          // Unknown message type - ignore
          break;
      }
    } catch (e) {
      _setSession(_session.copyWith(
        isConnected: false,
        isConnecting: false,
        error: 'Failed to parse message: $e',
      ));
    }
  }

  void _handleError(dynamic error) {
    _setStatus(WebSocketConnectionStatus.error);
    _setSession(_session.copyWith(
      isConnected: false,
      isConnecting: false,
      error: 'WebSocket error: $error',
    ));
  }

  void _handleDisconnection() {
    _setStatus(WebSocketConnectionStatus.disconnected);
    _setSession(_session.copyWith(
      id: '',
      isConnected: false,
      isConnecting: false,
    ));
    
    if (_shouldReconnect) {
      _scheduleReconnect(_session.serverId);
    }
  }

  void _handleTerminalClose(int exitCode) {
    _setSession(_session.copyWith(
      isConnected: false,
      isConnecting: false,
    ));
  }

  void _scheduleReconnect(int serverId) {
    if (!_shouldReconnect || serverId == 0) {
      return;
    }
    
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(Duration(milliseconds: _reconnectInterval), () {
      if (_shouldReconnect) {
        connect(serverId);
      }
    });
  }

  void _setStatus(WebSocketConnectionStatus status) {
    if (_status != status) {
      _status = status;
      _statusController.add(status);
    }
  }

  void _setSession(TerminalSession newSession) {
    _session = newSession;
    _sessionController?.add(_session);
  }

  bool _sendMessage(Map<String, dynamic> message) {
    if (!isConnected || _channel == null) {
      return false;
    }

    try {
      final jsonMessage = json.encode(message);
      _channel!.sink.add(jsonMessage);
      return true;
    } catch (e) {
      _setStatus(WebSocketConnectionStatus.error);
      return false;
    }
  }

  // Cleanup
  void disconnect() {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _channel?.sink.close(status.goingAway);
    _outputController?.close();
    _sessionController?.close();
    _setStatus(WebSocketConnectionStatus.disconnected);
  }

  void dispose() {
    disconnect();
    _statusController.close();
  }
}