import 'package:flutter/material.dart';
import '../models/operation.dart';
import '../theme/app_theme.dart';

class OperationLogs extends StatefulWidget {
  final OperationStatus operationStatus;
  final VoidCallback onClearLogs;

  const OperationLogs({
    super.key,
    required this.operationStatus,
    required this.onClearLogs,
  });

  @override
  State<OperationLogs> createState() => _OperationLogsState();
}

class _OperationLogsState extends State<OperationLogs> {
  final ScrollController _scrollController = ScrollController();
  bool _autoScroll = true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OperationLogs oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    
    if (widget.operationStatus.logs.length > oldWidget.operationStatus.logs.length && _autoScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              
              _buildStatusIndicator(),
              const SizedBox(width: 16),
              
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.operationStatus.command != null) ...[
                      Text(
                        'Command: ${widget.operationStatus.command}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Text(
                      'Logs: ${widget.operationStatus.logs.length} entries',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              
              
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  IconButton(
                    icon: Icon(
                      _autoScroll ? Icons.lock : Icons.lock_open,
                      color: _autoScroll 
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    tooltip: _autoScroll ? 'Disable auto-scroll' : 'Enable auto-scroll',
                    onPressed: () {
                      setState(() {
                        _autoScroll = !_autoScroll;
                      });
                    },
                  ),
                  
                  
                  IconButton(
                    icon: const Icon(Icons.clear_all),
                    tooltip: 'Clear logs',
                    onPressed: widget.operationStatus.logs.isEmpty 
                      ? null 
                      : widget.onClearLogs,
                  ),
                ],
              ),
            ],
          ),
        ),
        
        
        Expanded(
          child: widget.operationStatus.logs.isEmpty
            ? _buildEmptyState()
            : _buildLogsList(),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator() {
    if (widget.operationStatus.isRunning) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Running',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    
    bool hasCompleted = widget.operationStatus.logs.any(
      (log) => log.type == 'complete'
    );
    
    if (hasCompleted) {
      bool success = widget.operationStatus.logs
        .where((log) => log.type == 'complete')
        .any((log) => log.success == true);
      
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            success ? Icons.check_circle : Icons.error,
            size: 16,
            color: success ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            success ? 'Completed' : 'Failed',
            style: TextStyle(
              color: success ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 8),
        Text(
          'Idle',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.terminal,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No logs yet',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Run an operation to see the output here',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLogsList() {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: widget.operationStatus.logs.length,
        itemBuilder: (context, index) {
          final log = widget.operationStatus.logs[index];
          return _buildLogEntry(log, index);
        },
      ),
    );
  }

  Widget _buildLogEntry(StreamMessage log, int index) {
    Color textColor;
    Color backgroundColor;
    IconData? icon;

    
    switch (log.type.toLowerCase()) {
      case 'stderr':
        
        if (_isActualError(log)) {
          textColor = Theme.of(context).colorScheme.error;
          backgroundColor = Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.3);
          icon = Icons.error_outline;
        } else {
          textColor = Theme.of(context).colorScheme.onSurface;
          backgroundColor = Colors.transparent;
          icon = null;
        }
        break;
      case 'error':
        textColor = Theme.of(context).colorScheme.error;
        backgroundColor = Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.5);
        icon = Icons.error;
        break;
      case 'complete':
        if (log.success == true) {
          textColor = Theme.of(context).colorScheme.success;
          backgroundColor = Theme.of(context).colorScheme.successContainer.withValues(alpha: 0.5);
          icon = Icons.check_circle;
        } else {
          textColor = Theme.of(context).colorScheme.error;
          backgroundColor = Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.5);
          icon = Icons.error;
        }
        break;
      case 'stdout':
      default:
        
        if (_isDockerComposeInfo(log)) {
          textColor = Theme.of(context).colorScheme.primary;
          backgroundColor = Theme.of(context).colorScheme.primary.withValues(alpha: 0.05);
          icon = Icons.info_outline;
        } else {
          textColor = Theme.of(context).colorScheme.onSurface;
          backgroundColor = Colors.transparent;
          icon = null;
        }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: backgroundColor != Colors.transparent
          ? Border.all(
              color: textColor.withValues(alpha: 0.2),
              width: 1,
            )
          : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            _formatTimestamp(log.timestamp ?? ''),
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          
          
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: textColor,
            ),
            const SizedBox(width: 8),
          ],
          
          
          Expanded(
            child: SelectableText(
              _getLogDisplayText(log),
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: textColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLogDisplayText(StreamMessage log) {
    if (log.type == 'complete') {
      if (log.success == true) {
        return 'Operation completed successfully (exit code: ${log.exitCode ?? 0})';
      } else if (log.success == false) {
        return 'Operation failed (exit code: ${log.exitCode ?? 1})';
      } else {
        return 'Operation finished (status unknown - may have completed successfully)';
      }
    }
    return log.data ?? '';
  }

  bool _isActualError(StreamMessage log) {
    final data = log.data?.toLowerCase() ?? '';
    
    
    final errorPatterns = [
      'error',
      'failed',
      'exception',
      'panic',
      'fatal',
      'cannot',
      'unable to',
      'not found',
      'permission denied',
      'access denied',
      'connection refused',
      'timeout',
      'invalid',
    ];
    
    return errorPatterns.any((pattern) => data.contains(pattern));
  }

  bool _isDockerComposeInfo(StreamMessage log) {
    final data = log.data?.toLowerCase() ?? '';
    
    
    final infoPatterns = [
      RegExp(r'container .+ (running|created|started|stopped)'),
      RegExp(r'network .+ (created|removed)'),
      RegExp(r'volume .+ (created|removed)'),
      RegExp(r'pulling .+'),
      RegExp(r'pulled .+'),
      RegExp(r'building .+'),
      RegExp(r'built .+'),
    ];

    return infoPatterns.any((pattern) => pattern.hasMatch(data));
  }

  String _formatTimestamp(String timestamp) {
    if (timestamp.isEmpty) {
      return '--:--:--';
    }
    
    try {
      final dateTime = DateTime.parse(timestamp);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
    } catch (e) {
      return '--:--:--';
    }
  }
}