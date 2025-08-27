import 'package:flutter/material.dart';
import '../models/stack.dart' as stack_models;
import '../models/operation.dart';

class StackQuickActions extends StatelessWidget {
  final List<stack_models.ComposeService> services;
  final Function(OperationRequest) onQuickOperation;
  final bool isOperationRunning;
  final String? runningOperation;

  const StackQuickActions({
    super.key,
    required this.services,
    required this.onQuickOperation,
    this.isOperationRunning = false,
    this.runningOperation,
  });

  StackState _getStackState() {
    if (services.isEmpty) {
      return StackState.noContainers;
    }

    final allContainers = services.expand((s) => s.containers).toList();
    if (allContainers.isEmpty) {
      return StackState.noContainers;
    }

    final runningCount = allContainers.where((c) => c.state == 'running').length;
    final stoppedCount = allContainers.where((c) => c.state == 'stopped' || c.state == 'exited').length;
    final notCreatedCount = allContainers.where((c) => c.state == 'not created').length;
    final totalCount = allContainers.length;

    if (runningCount == totalCount) {
      return StackState.allRunning;
    } else if (stoppedCount == totalCount) {
      return StackState.allStopped;
    } else if (notCreatedCount == totalCount) {
      return StackState.allNotCreated;
    } else if (runningCount > 0) {
      return StackState.mixedRunning;
    } else if (notCreatedCount > 0) {
      return StackState.mixedNotCreated;
    } else {
      return StackState.other;
    }
  }

  bool _isThisOperationRunning(String command) {
    return isOperationRunning && runningOperation == 'stack:$command';
  }

  void _handleAction(String command) {
    onQuickOperation(OperationRequest(
      command: command,
      options: [],
      services: [],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final stackState = _getStackState();

    if (stackState == StackState.noContainers) {
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
          tooltip: 'Deploy/Update stack (applies configuration changes)',
        ),

        
        if (stackState == StackState.allStopped || 
            (stackState == StackState.mixedRunning && 
             services.any((s) => s.containers.any((c) => c.state == 'stopped' || c.state == 'exited')))) ...[
          _buildActionButton(
            context: context,
            command: 'start',
            label: 'Start',
            icon: Icons.play_arrow,
            color: const Color(0xFF4CAF50),
            tooltip: 'Start stack',
          ),
        ],

        
        if (stackState == StackState.allRunning || stackState == StackState.mixedRunning) ...[
          _buildActionButton(
            context: context,
            command: 'stop',
            label: 'Stop',
            icon: Icons.stop,
            color: const Color(0xFFF44336),
            tooltip: 'Stop stack',
          ),
        ],

        
        if (stackState == StackState.allRunning) ...[
          _buildActionButton(
            context: context,
            command: 'restart',
            label: 'Restart',
            icon: Icons.refresh,
            color: const Color(0xFF2196F3),
            tooltip: 'Restart stack',
          ),
        ],

        
        if (stackState != StackState.allNotCreated && 
            services.any((s) => s.containers.any((c) => c.state != 'not created'))) ...[
          _buildActionButton(
            context: context,
            command: 'down',
            label: 'Down',
            icon: Icons.download,
            color: const Color(0xFFFF9800),
            tooltip: 'Stop and remove stack containers',
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

enum StackState {
  noContainers,
  allRunning,
  allStopped,
  allNotCreated,
  mixedRunning,
  mixedNotCreated,
  other,
}