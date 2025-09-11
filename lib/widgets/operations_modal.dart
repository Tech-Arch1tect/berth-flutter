import 'dart:async';
import 'package:flutter/material.dart';
import '../models/operation.dart';
import '../models/stack.dart' as stack_models;
import '../services/operations_service.dart';
import '../theme/app_theme.dart';
import 'operation_builder.dart';
import 'operation_logs.dart';

class OperationsModal extends StatefulWidget {
  final int serverId;
  final String stackName;
  final List<stack_models.ComposeService> services;
  final OperationsService operationsService;

  const OperationsModal({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.services,
    required this.operationsService,
  });

  @override
  State<OperationsModal> createState() => _OperationsModalState();
}

class _OperationsModalState extends State<OperationsModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  OperationStatus _operationStatus = const OperationStatus(isRunning: false);
  bool _isConnecting = false;
  String? _error;
  Timer? _operationTimeout;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _setupOperationsService();
  }

  @override
  void dispose() {
    _operationTimeout?.cancel();
    _tabController.dispose();
    widget.operationsService.disconnect();
    super.dispose();
  }

  void _setupOperationsService() {
    
    widget.operationsService.connectionStatus.listen((isConnected) {
      if (mounted) {
        setState(() {
          _isConnecting = !isConnected && !widget.operationsService.isConnected;
        });
      }
    });

    
    widget.operationsService.messages.listen((message) {
      if (mounted) {
        setState(() {
          // Check if this is the first message before adding it
          final isFirstMessage = _operationStatus.logs.isEmpty;
          
          _operationStatus = _operationStatus.copyWith(
            logs: [..._operationStatus.logs, message],
          );

          // If this is the first message and we're not already on logs tab, switch to it
          if (isFirstMessage && _tabController.index == 0) {
            _tabController.animateTo(1);
          }

          if (message.type == 'complete') {
            _operationTimeout?.cancel();
            _operationTimeout = null;
            _operationStatus = _operationStatus.copyWith(
              isRunning: false,
            );
          }
        });
      }
    });

    
    widget.operationsService.errors.listen((error) {
      if (mounted) {
        setState(() {
          _error = error;
        });
        _showErrorSnackBar(error);
      }
    });
  }

  void _showErrorSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Theme.of(context).colorScheme.onError,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  Future<void> _connectToOperations() async {
    if (widget.operationsService.isConnected) return;

    setState(() {
      _isConnecting = true;
      _error = null;
    });

    try {
      await widget.operationsService.connect(
        widget.serverId,
        widget.stackName,
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isConnecting = false;
        });
      }
    }
  }

  Future<void> _startOperation(OperationRequest request) async {
    if (!widget.operationsService.isConnected) {
      await _connectToOperations();
    }

    if (!widget.operationsService.isConnected) {
      _showErrorSnackBar('Unable to connect to operations service');
      return;
    }

    try {
      setState(() {
        _operationStatus = OperationStatus(
          isRunning: true,
          command: request.command,
          startTime: DateTime.now(),
          logs: [],
        );
      });

      
      _operationTimeout?.cancel();
      _operationTimeout = Timer(const Duration(minutes: 10), () {
        if (mounted && _operationStatus.isRunning) {
          setState(() {
            _operationStatus = _operationStatus.copyWith(
              isRunning: false,
              logs: [..._operationStatus.logs, StreamMessage(
                type: 'complete',
                success: null, 
                exitCode: null,
                timestamp: DateTime.now().toIso8601String(),
              )],
            );
          });
        }
      });

      await widget.operationsService.startOperation(request);

      
      _tabController.animateTo(1);
    } catch (e) {
      _operationTimeout?.cancel();
      _operationTimeout = null;
      setState(() {
        _operationStatus = _operationStatus.copyWith(isRunning: false);
      });
      _showErrorSnackBar('Failed to start operation: $e');
    }
  }

  void _clearLogs() {
    setState(() {
      _operationStatus = _operationStatus.copyWith(logs: []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Operations - ${widget.stackName}'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            _buildConnectionStatus(),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.build),
                text: 'Operations',
              ),
              Tab(
                icon: Icon(Icons.terminal),
                text: 'Logs',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            
            OperationBuilder(
              services: widget.services,
              onOperationStart: _startOperation,
              isRunning: _operationStatus.isRunning,
            ),
            
            OperationLogs(
              operationStatus: _operationStatus,
              onClearLogs: _clearLogs,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionStatus() {
    if (_isConnecting) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Theme.of(context).colorScheme.warning,
          ),
        ),
      );
    }

    IconData icon;
    Color color;
    String tooltip;

    if (widget.operationsService.isConnected) {
      icon = Icons.cloud_done;
      color = Theme.of(context).colorScheme.success;
      tooltip = 'Connected';
    } else if (_error != null) {
      icon = Icons.cloud_off;
      color = Theme.of(context).colorScheme.error;
      tooltip = 'Error: $_error';
    } else {
      icon = Icons.cloud_off;
      color = Theme.of(context).colorScheme.onSurfaceVariant;
      tooltip = 'Disconnected';
    }

    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: _connectToOperations,
      ),
    );
  }
}