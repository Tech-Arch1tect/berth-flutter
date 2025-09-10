import 'package:flutter/material.dart';
import '../models/operation_log.dart' as models;
import '../theme/app_theme.dart';

class OperationLogDetailModal extends StatelessWidget {
  final models.OperationLogDetail? logDetail;
  final bool showUser;

  const OperationLogDetailModal({
    super.key,
    this.logDetail,
    required this.showUser,
  });

  @override
  Widget build(BuildContext context) {
    if (logDetail == null) return const SizedBox.shrink();

    final log = logDetail!.log;
    final messages = logDetail!.messages;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Operation Details'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        body: Column(
          children: [
            _buildHeader(context, log),
            const Divider(height: 1),
            Expanded(
              child: _buildMessagesList(context, messages),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, models.OperationLogEntry log) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.terminal,
                          size: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            log.command,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _buildInfoRow(context, Icons.layers, 'Stack', log.stackName),
                    if (showUser) ...[
                      const SizedBox(height: AppSpacing.xs),
                      _buildInfoRow(context, Icons.person, 'User', log.userName),
                    ],
                    const SizedBox(height: AppSpacing.xs),
                    _buildInfoRow(context, Icons.dns, 'Server', log.serverName),
                    const SizedBox(height: AppSpacing.xs),
                    _buildInfoRow(context, Icons.access_time, 'Started', log.formattedDate),
                    const SizedBox(height: AppSpacing.xs),
                    _buildInfoRow(context, Icons.timer, 'Duration', _formatDuration(log)),
                    const SizedBox(height: AppSpacing.xs),
                    _buildInfoRow(context, Icons.message, 'Messages', '${logDetail!.messages.length}'),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              _buildStatusBadge(context, log),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(BuildContext context, models.OperationLogEntry log) {
    IconData icon;
    Color color;
    String text;

    if (log.isIncomplete) {
      icon = Icons.pending;
      color = Theme.of(context).colorScheme.warning;
      text = 'Incomplete';
    } else if (log.success == true) {
      icon = Icons.check_circle;
      color = Theme.of(context).colorScheme.success;
      text = 'Completed Successfully';
    } else if (log.success == false) {
      icon = Icons.error;
      color = Theme.of(context).colorScheme.error;
      text = 'Failed';
    } else {
      icon = Icons.help_outline;
      color = Theme.of(context).colorScheme.onSurfaceVariant;
      text = 'Unknown Status';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: color,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList(BuildContext context, List<models.OperationLogMessage> messages) {
    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'No messages',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'No output messages were captured for this operation',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return _buildMessageEntry(context, message);
        },
      ),
    );
  }

  Widget _buildMessageEntry(BuildContext context, models.OperationLogMessage message) {
    Color backgroundColor = Colors.transparent;
    Color textColor = Theme.of(context).colorScheme.onSurface;
    IconData? icon;

    switch (message.messageType.toLowerCase()) {
      case 'stderr':
        if (_isActualError(message)) {
          backgroundColor = Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.3);
          textColor = Theme.of(context).colorScheme.error;
          icon = Icons.error_outline;
        }
        break;
      case 'error':
        backgroundColor = Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.5);
        textColor = Theme.of(context).colorScheme.error;
        icon = Icons.error;
        break;
      case 'stdout':
      default:
        if (_isDockerComposeInfo(message)) {
          backgroundColor = Theme.of(context).colorScheme.primary.withValues(alpha: 0.05);
          textColor = Theme.of(context).colorScheme.primary;
          icon = Icons.info_outline;
        }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
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
            _formatTimestamp(message.timestamp),
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: textColor,
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
          Expanded(
            child: SelectableText(
              message.messageData,
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

  String _formatDuration(models.OperationLogEntry log) {
    int? duration = log.durationMs ?? log.partialDurationMs;
    
    if (duration == null || duration == 0) return 'N/A';
    if (duration < 0) return 'N/A';
    
    String formatted;
    if (duration < 1000) {
      formatted = '${duration}ms';
    } else if (duration < 60000) {
      formatted = '${(duration / 1000).toStringAsFixed(1)}s';
    } else {
      formatted = '${(duration / 60000).toStringAsFixed(1)}m';
    }
    
    return log.partialDurationMs != null ? '~$formatted' : formatted;
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
           '${timestamp.minute.toString().padLeft(2, '0')}:'
           '${timestamp.second.toString().padLeft(2, '0')}';
  }

  bool _isActualError(models.OperationLogMessage message) {
    final data = message.messageData.toLowerCase();
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

  bool _isDockerComposeInfo(models.OperationLogMessage message) {
    final data = message.messageData.toLowerCase();
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
}