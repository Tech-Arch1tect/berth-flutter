import 'package:flutter/material.dart';
import '../models/stack.dart' as stack_models;
import '../models/operation.dart';

class ServiceQuickActions extends StatelessWidget {
  final stack_models.ComposeService service;
  final Function(OperationRequest) onQuickOperation;
  final bool isOperationRunning;
  final String? runningOperation;

  const ServiceQuickActions({
    super.key,
    required this.service,
    required this.onQuickOperation,
    this.isOperationRunning = false,
    this.runningOperation,
  });

  ServiceState _getServiceState() {
    if (service.containers.isEmpty) {
      return ServiceState.noContainers;
    }

    final runningCount = service.containers.where((c) => c.state == 'running').length;
    final stoppedCount = service.containers.where((c) => c.state == 'stopped' || c.state == 'exited').length;
    final notCreatedCount = service.containers.where((c) => c.state == 'not created').length;
    final totalCount = service.containers.length;

    if (runningCount == totalCount) {
      return ServiceState.allRunning;
    } else if (stoppedCount == totalCount) {
      return ServiceState.allStopped;
    } else if (notCreatedCount == totalCount) {
      return ServiceState.allNotCreated;
    } else if (runningCount > 0) {
      return ServiceState.mixedRunning;
    } else if (notCreatedCount > 0) {
      return ServiceState.mixedNotCreated;
    } else {
      return ServiceState.other;
    }
  }

  bool _isThisOperationRunning(String command) {
    return isOperationRunning && runningOperation == '$command:${service.name}';
  }

  void _handleAction(String command) {
    onQuickOperation(OperationRequest(
      command: command,
      options: [],
      services: [service.name],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final serviceState = _getServiceState();

    if (serviceState == ServiceState.noContainers) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          'No containers',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        
        _buildActionButton(
          context: context,
          command: 'up',
          label: 'Up',
          icon: Icons.upload,
          color: const Color(0xFF9C27B0),
          tooltip: 'Deploy/Update ${service.name} (applies configuration changes)',
        ),

        
        if (serviceState == ServiceState.allStopped || 
            (serviceState == ServiceState.mixedRunning && 
             service.containers.any((c) => c.state == 'stopped' || c.state == 'exited'))) ...[
          _buildActionButton(
            context: context,
            command: 'start',
            label: 'Start',
            icon: Icons.play_arrow,
            color: const Color(0xFF4CAF50),
            tooltip: 'Start ${service.name}',
          ),
        ],

        
        if (serviceState == ServiceState.allRunning || serviceState == ServiceState.mixedRunning) ...[
          _buildActionButton(
            context: context,
            command: 'stop',
            label: 'Stop',
            icon: Icons.stop,
            color: const Color(0xFFF44336),
            tooltip: 'Stop ${service.name}',
          ),
        ],

        
        if (serviceState == ServiceState.allRunning) ...[
          _buildActionButton(
            context: context,
            command: 'restart',
            label: 'Restart',
            icon: Icons.refresh,
            color: const Color(0xFF2196F3),
            tooltip: 'Restart ${service.name}',
          ),
        ],

        
        if (serviceState != ServiceState.allNotCreated && 
            service.containers.any((c) => c.state != 'not created')) ...[
          _buildActionButton(
            context: context,
            command: 'down',
            label: 'Down',
            icon: Icons.download,
            color: const Color(0xFFFF9800),
            tooltip: 'Stop and remove ${service.name} containers',
          ),
        ],
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String command,
    required String label,
    required IconData icon,
    required Color color,
    required String tooltip,
  }) {
    final isThisRunning = _isThisOperationRunning(command);
    final isDisabled = isOperationRunning;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: color.withValues(alpha: Theme.of(context).brightness == Brightness.dark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: isDisabled ? null : () => _handleAction(command),
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isThisRunning) ...[
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).brightness == Brightness.dark
                          ? color.withValues(alpha: 0.9)
                          : Color.fromARGB(255, (color.r * 0.7).round(), (color.g * 0.7).round(), (color.b * 0.7).round())
                      ),
                    ),
                  ),
                ] else ...[
                  Icon(
                    icon,
                    size: 12,
                    color: Theme.of(context).brightness == Brightness.dark
                      ? color.withValues(alpha: 0.9)
                      : Color.fromARGB(255, (color.r * 0.7).round(), (color.g * 0.7).round(), (color.b * 0.7).round()),
                  ),
                ],
                const SizedBox(width: 4),
                Text(
                  isThisRunning ? _getLoadingText(command) : label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                      ? color.withValues(alpha: 0.9)
                      : Color.fromARGB(255, (color.r * 0.7).round(), (color.g * 0.7).round(), (color.b * 0.7).round()),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLoadingText(String command) {
    switch (command) {
      case 'up':
        return 'Deploying...';
      case 'start':
        return 'Starting...';
      case 'stop':
        return 'Stopping...';
      case 'restart':
        return 'Restarting...';
      case 'down':
        return 'Removing...';
      default:
        return 'Running...';
    }
  }
}

enum ServiceState {
  noContainers,
  allRunning,
  allStopped,
  allNotCreated,
  mixedRunning,
  mixedNotCreated,
  other,
}