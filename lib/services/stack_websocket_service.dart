import 'dart:async';
import 'websocket_service.dart';
import '../models/websocket_message.dart';

class StackWebSocketService {
  final WebSocketService _webSocketService;
  final int serverId;
  final String stackName;
  
  Timer? _refreshTimer;
  final int _refreshDebounceMs = 1500;
  bool _isSubscribed = false;
  bool _isDisposed = false;
  StreamSubscription<WebSocketConnectionStatus>? _statusSubscription;
  StreamSubscription<Map<String, dynamic>>? _messageSubscription;
  
  final StreamController<WebSocketConnectionStatus> _statusController = 
      StreamController<WebSocketConnectionStatus>.broadcast();
  
  final StreamController<Exception> _errorController = 
      StreamController<Exception>.broadcast();
  
  final StreamController<void> _refreshController = 
      StreamController<void>.broadcast();

  StackWebSocketService(
    this._webSocketService,
    this.serverId,
    this.stackName,
  ) {
    _statusSubscription = _webSocketService.connectionStatusStream.listen((status) {
      if (!_isDisposed) {
        _statusController.add(status);
      }
    });
  }

  Stream<WebSocketConnectionStatus> get connectionStatus => _statusController.stream;
  Stream<Exception> get errors => _errorController.stream;
  Stream<void> get refreshEvents => _refreshController.stream;
  
  bool get isConnected => _webSocketService.isConnected;
  WebSocketConnectionStatus get status => _webSocketService.connectionStatus;

  Future<bool> connect() async {
    try {
      final success = await _webSocketService.connect('/ws/api/stack-status/$serverId');

      if (success) {
        _listenToMessages();
        _subscribe();
      } else if (!_isDisposed) {
        _errorController.add(Exception('Failed to connect to WebSocket'));
      }

      return success;
    } catch (e) {
      if (_isDisposed) return false;
      if (e.toString().contains('403') || e.toString().contains('Forbidden')) {
        _errorController.add(Exception('Insufficient permissions to access this server'));
      } else if (e.toString().contains('401') || e.toString().contains('Unauthorized')) {
        _errorController.add(Exception('Authentication required'));
      } else {
        _errorController.add(Exception('Connection failed: ${e.toString()}'));
      }
      return false;
    }
  }

  void _listenToMessages() {
    _messageSubscription = _webSocketService.messageStream?.listen(
      (message) {
        if (!_isDisposed) {
          _handleMessage(message);
        }
      },
      onError: (error) {
        if (_isDisposed) return;
        if (error.toString().contains('403')) {
          _errorController.add(Exception('Permission denied for server access'));
        } else {
          _errorController.add(Exception('WebSocket error: $error'));
        }
      },
    );
  }

  void _handleMessage(Map<String, dynamic> message) {
    final messageType = message['type'] as String?;
    
    switch (messageType) {
      case 'container_status':
        final event = ContainerStatusEvent.fromJson(message);
        if (event.serverId == serverId && event.stackName == stackName) {
          _scheduleDebouncedRefresh();
        }
        break;
        
      case 'stack_status':
        final event = StackStatusEvent.fromJson(message);
        if (event.serverId == serverId && event.stackName == stackName) {
          _scheduleDebouncedRefresh();
        }
        break;
        
      case 'error':
        if (_isDisposed) return;
        final error = WebSocketError.fromJson(message);
        if (error.error.contains('403') || error.error.contains('Forbidden')) {
          _errorController.add(Exception('Permission denied: ${error.error}'));
        } else {
          _errorController.add(Exception('Server error: ${error.error}'));
        }
        break;
        
      case 'success':
        
        break;
        
      default:
        
        break;
    }
  }

  void _scheduleDebouncedRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer(Duration(milliseconds: _refreshDebounceMs), () {
      _refreshStackDetails();
    });
  }

  Future<void> _refreshStackDetails() async {
    if (_isDisposed) return;
    try {
      _refreshController.add(null);
      _statusController.add(_webSocketService.connectionStatus);
    } catch (e) {
      if (!_isDisposed) {
        _errorController.add(Exception('Failed to refresh stack details: $e'));
      }
    }
  }

  void _subscribe() {
    if (_webSocketService.isConnected && !_isSubscribed) {
      final success = _webSocketService.subscribe('stack_status', serverId, stackName);
      if (success) {
        _isSubscribed = true;
      } else {
      }
    }
  }

  void _unsubscribe() {
    if (_isSubscribed) {
      _webSocketService.unsubscribe('stack_status', serverId, stackName);
      _isSubscribed = false;
    }
  }

  void disconnect() {
    _refreshTimer?.cancel();
    _unsubscribe();
  }

  void dispose() {
    _isDisposed = true;
    disconnect();
    _messageSubscription?.cancel();
    _statusSubscription?.cancel();
    _statusController.close();
    _errorController.close();
    _refreshController.close();
  }
}