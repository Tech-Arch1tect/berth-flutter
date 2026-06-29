import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:berth_api/api.dart' as berth_api;
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

  OperationsService(this._berthApiProvider) {
    _messageController = StreamController<StreamMessage>.broadcast();
    _connectionController = StreamController<bool>.broadcast();
    _errorController = StreamController<String>.broadcast();
  }

  Stream<StreamMessage> get messages => _messageController?.stream ?? const Stream.empty();
  Stream<bool> get connectionStatus => _connectionController?.stream ?? const Stream.empty();
  Stream<String> get errors => _errorController?.stream ?? const Stream.empty();

  bool get isConnected => _isConnected;

  Future<void> startOperation(
    int serverId,
    String stackName,
    OperationRequest request,
  ) async {
    await disconnect();

    final startData = await _berthApiProvider.callWithAutoRefresh(
      () => _berthApiProvider.operationsApi
          .apiV1ServersServeridStacksStacknameOperationsPost(
        serverId,
        stackName,
        berth_api.OperationRequest(
          command: request.command,
          options: request.options,
          services: request.services,
        ),
      ),
    );

    final operationId = startData?.data.operationId;
    if (operationId == null || operationId.isEmpty) {
      throw Exception('Failed to start operation: no operation ID returned');
    }

    await _connectStream(serverId, stackName, operationId);
  }

  Future<void> _connectStream(
    int serverId,
    String stackName,
    String operationId,
  ) async {
    final token = _berthApiProvider.authToken;
    if (token == null) {
      throw Exception('No authentication token available');
    }

    final baseUrl = _berthApiProvider.baseUrl;
    final wsUrl =
        baseUrl.replaceFirst('http://', 'ws://').replaceFirst('https://', 'wss://');
    final path =
        '/ws/api/servers/$serverId/stacks/${Uri.encodeComponent(stackName)}/operations/$operationId';
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
      _channel = IOWebSocketChannel.connect(uri, headers: headers);
    }

    _channel!.stream.listen(
      _handleMessage,
      onError: _handleError,
      onDone: _handleDisconnected,
    );

    _isConnected = true;
    if (_connectionController?.isClosed == false) {
      _connectionController!.add(true);
    }
  }

  Future<void> disconnect() async {
    if (_channel != null) {
      await _channel!.sink.close(status.goingAway);
      _channel = null;
    }

    _isConnected = false;

    if (_connectionController?.isClosed == false) {
      _connectionController?.add(false);
    }
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
  }

  void _handleDisconnected() {
    _isConnected = false;
    if (_connectionController?.isClosed == false) {
      _connectionController?.add(false);
    }
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