import 'package:flutter/material.dart';
import '../models/stack.dart' as stack_models;
import '../models/operation.dart';
import '../theme/app_theme.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (stackState == StackState.noContainers) {
      return GlassCard(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        child: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: isMobile ? 16 : 20,
              color: colorScheme.onSurfaceVariant,
            ),
            SizedBox(width: isMobile ? 8 : 12),
            Text(
              'No containers available',
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: isMobile ? 24 : 32,
                height: isMobile ? 24 : 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryBlue, AppTheme.primaryPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
                ),
                child: Icon(
                  Icons.layers_rounded,
                  color: Colors.white,
                  size: isMobile ? 12 : 16,
                ),
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Text(
                'Stack Actions',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          
          SizedBox(height: isMobile ? 12 : 16),
          if (isMobile)
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                _buildActionButton(
                  context: context,
                  command: 'up',
                  label: 'Up',
                  icon: Icons.upload_rounded,
                  color: AppTheme.primaryPurple,
                  tooltip: 'Deploy/Update entire stack',
                  isMobile: true,
                ),

                if (stackState == StackState.allStopped || 
                    (stackState == StackState.mixedRunning && 
                     services.any((s) => s.containers.any((c) => c.state == 'stopped' || c.state == 'exited'))))
                  _buildActionButton(
                    context: context,
                    command: 'start',
                    label: 'Start',
                    icon: Icons.play_arrow_rounded,
                    color: colorScheme.success,
                    tooltip: 'Start entire stack',
                    isMobile: true,
                  )
                else if (stackState == StackState.allRunning || stackState == StackState.mixedRunning)
                  _buildActionButton(
                    context: context,
                    command: 'stop',
                    label: 'Stop',
                    icon: Icons.stop_rounded,
                    color: colorScheme.error,
                    tooltip: 'Stop entire stack',
                    isMobile: true,
                  ),

                _buildMoreActionsButton(context, colorScheme, stackState, isMobile),
            ],
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionButton(
                  context: context,
                  command: 'up',
                  label: 'Up',
                  icon: Icons.upload_rounded,
                  color: AppTheme.primaryPurple,
                  tooltip: 'Deploy/Update entire stack',
                  isMobile: false,
                ),

                if (stackState == StackState.allStopped || 
                    (stackState == StackState.mixedRunning && 
                     services.any((s) => s.containers.any((c) => c.state == 'stopped' || c.state == 'exited'))))
                  _buildActionButton(
                    context: context,
                    command: 'start',
                    label: 'Start',
                    icon: Icons.play_arrow_rounded,
                    color: colorScheme.success,
                    tooltip: 'Start entire stack',
                    isMobile: false,
                  ),

                if (stackState == StackState.allRunning || stackState == StackState.mixedRunning)
                  _buildActionButton(
                    context: context,
                    command: 'stop',
                    label: 'Stop',
                    icon: Icons.stop_rounded,
                    color: colorScheme.error,
                    tooltip: 'Stop entire stack',
                    isMobile: false,
                  ),

                if (stackState == StackState.allRunning)
                  _buildActionButton(
                    context: context,
                    command: 'restart',
                    label: 'Restart',
                    icon: Icons.refresh_rounded,
                    color: colorScheme.info,
                    tooltip: 'Restart entire stack',
                    isMobile: false,
                  ),

                _buildActionButton(
                  context: context,
                  command: 'pull',
                  label: 'Pull',
                  icon: Icons.cloud_download_rounded,
                  color: colorScheme.onSurfaceVariant,
                  tooltip: 'Pull latest images for all services',
                  isMobile: false,
                ),

                if (stackState != StackState.allNotCreated && 
                    services.any((s) => s.containers.any((c) => c.state != 'not created')))
                  _buildActionButton(
                    context: context,
                    command: 'down',
                    label: 'Down',
                    icon: Icons.download_rounded,
                    color: colorScheme.warning,
                    tooltip: 'Stop and remove all stack containers',
                    isMobile: false,
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMoreActionsButton(BuildContext context, ColorScheme colorScheme, StackState stackState, bool isMobile) {
    return PopupMenuButton<String>(
      onSelected: (String command) {
        _handleAction(command);
      },
      itemBuilder: (BuildContext context) => [
        if (stackState == StackState.allRunning)
          PopupMenuItem<String>(
            value: 'restart',
            child: Row(
              children: [
                Icon(Icons.refresh_rounded, size: 16, color: colorScheme.info),
                const SizedBox(width: 8),
                const Text('Restart'),
              ],
            ),
          ),
        
        PopupMenuItem<String>(
          value: 'pull',
          child: Row(
            children: [
              Icon(Icons.cloud_download_rounded, size: 16, color: colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              const Text('Pull'),
            ],
          ),
        ),
        
        if (stackState != StackState.allNotCreated && 
            services.any((s) => s.containers.any((c) => c.state != 'not created')))
          PopupMenuItem<String>(
            value: 'down',
            child: Row(
              children: [
                Icon(Icons.download_rounded, size: 16, color: colorScheme.warning),
                const SizedBox(width: 8),
                const Text('Down'),
              ],
            ),
          ),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 6 : 8, 
          vertical: isMobile ? 4 : 6,
        ),
        decoration: BoxDecoration(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz_rounded,
              size: isMobile ? 12 : 14,
              color: colorScheme.onSurfaceVariant,
            ),
            SizedBox(width: isMobile ? 3 : 4),
            Text(
              'More',
              style: TextStyle(
                fontSize: isMobile ? 11 : 12,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String command,
    required String label,
    required IconData icon,
    required Color color,
    required String tooltip,
    required bool isMobile,
  }) {
    final isThisRunning = _isThisOperationRunning(command);
    final isDisabled = isOperationRunning;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
        elevation: 0,
        child: InkWell(
          onTap: isDisabled ? null : () => _handleAction(command),
          borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 8 : 16, 
              vertical: isMobile ? 6 : 12,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isThisRunning) ...[
                  SizedBox(
                    width: isMobile ? 14 : 18,
                    height: isMobile ? 14 : 18,
                    child: CircularProgressIndicator(
                      strokeWidth: isMobile ? 1.5 : 2,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                ] else ...[
                  Icon(
                    icon,
                    size: isMobile ? 14 : 18,
                    color: color,
                  ),
                ],
                SizedBox(width: isMobile ? 6 : 12),
                Text(
                  isThisRunning ? _getLoadingText(command) : label,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w600,
                    color: color,
                    letterSpacing: -0.2,
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
      case 'pull':
        return 'Pulling...';
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