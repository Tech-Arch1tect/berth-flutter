import 'package:flutter/material.dart';
import '../models/stack.dart' as stack_models;
import '../models/operation.dart';
import '../theme/app_theme.dart';

class ServiceCard extends StatefulWidget {
  final stack_models.ComposeService service;
  final Function(OperationRequest)? onQuickOperation;
  final bool isOperationRunning;
  final String? runningOperation;
  final VoidCallback? onOpenTerminal;
  final VoidCallback? onTap;
  final bool showDetails;

  const ServiceCard({
    super.key,
    required this.service,
    this.onQuickOperation,
    this.isOperationRunning = false,
    this.runningOperation,
    this.onOpenTerminal,
    this.onTap,
    this.showDetails = false,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> 
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _isExpanded = widget.showDetails;
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  ServiceState _getServiceState() {
    if (widget.service.containers.isEmpty) {
      return ServiceState.noContainers;
    }

    final runningCount = widget.service.containers.where((c) => c.state.toLowerCase() == 'running').length;
    final stoppedCount = widget.service.containers.where((c) => c.state.toLowerCase() == 'stopped' || c.state.toLowerCase() == 'exited').length;
    final notCreatedCount = widget.service.containers.where((c) => c.state.toLowerCase() == 'not created').length;
    final totalCount = widget.service.containers.length;

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

  String _formatUptime(String? startedAt) {
    if (startedAt == null || startedAt.isEmpty) return '';

    try {
      final start = DateTime.parse(startedAt);
      final now = DateTime.now();
      final diff = now.difference(start);

      if (diff.inDays > 0) {
        return '${diff.inDays}d ${diff.inHours % 24}h';
      } else if (diff.inHours > 0) {
        return '${diff.inHours}h ${diff.inMinutes % 60}m';
      } else {
        return '${diff.inMinutes}m';
      }
    } catch (e) {
      return '';
    }
  }

  String _formatMemory(int? bytes) {
    if (bytes == null) return '';
    final mb = bytes / (1024 * 1024);
    if (mb < 1024) return '${mb.toStringAsFixed(0)}MB';
    return '${(mb / 1024).toStringAsFixed(1)}GB';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    final runningContainers = widget.service.containers
        .where((c) => c.state.toLowerCase() == 'running')
        .length;
    final totalContainers = widget.service.containers.length;
    
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.zero,
      onTap: widget.onTap,
      child: Column(
        children: [
          _buildServiceHeader(context, colorScheme, runningContainers, totalContainers, isMobile),
          if (widget.service.containers.isNotEmpty)
            _buildContainerList(context, colorScheme),
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              return SizeTransition(
                sizeFactor: _expandAnimation,
                axisAlignment: -1.0,
                child: _buildExpandedDetails(context, colorScheme, isMobile),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHeader(BuildContext context, ColorScheme colorScheme, 
      int runningContainers, int totalContainers, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: isMobile ? 32 : 40,
                height: isMobile ? 32 : 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryBlue, AppTheme.primaryPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
                ),
                child: Icon(
                  Icons.developer_board_rounded,
                  color: Colors.white,
                  size: isMobile ? 16 : 20,
                ),
              ),
              
              SizedBox(width: isMobile ? 8 : 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.service.name,
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        _buildStatusIndicator(colorScheme, runningContainers, totalContainers, isMobile),
                      ],
                    ),
                    if (widget.service.image?.isNotEmpty == true) ...[
                      SizedBox(height: isMobile ? 2 : 4),
                      Text(
                        widget.service.image!,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 13,
                          color: colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              
              SizedBox(width: isMobile ? 4 : 8),
              IconButton(
                onPressed: _toggleExpanded,
                iconSize: isMobile ? 20 : 24,
                padding: EdgeInsets.all(isMobile ? 4 : 8),
                icon: AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          if (isMobile && widget.onQuickOperation != null) ...[
            const SizedBox(height: 12),
            _buildServiceQuickActions(context, colorScheme, isMobile),
          ],
          if (!isMobile && widget.onQuickOperation != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 52),
                Expanded(
                  child: _buildServiceQuickActions(context, colorScheme, isMobile),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildServiceQuickActions(BuildContext context, ColorScheme colorScheme, bool isMobile) {
    final serviceState = _getServiceState();
    
    if (serviceState == ServiceState.noContainers) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          'No containers',
          style: TextStyle(
            fontSize: isMobile ? 11 : 12,
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
        ),
      );
    }

    if (isMobile) {
      return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          _buildActionButton(
            context: context,
            command: 'up',
            label: 'Up',
            icon: Icons.upload_rounded,
            color: AppTheme.primaryPurple,
            tooltip: 'Deploy/Update ${widget.service.name}',
            isMobile: true,
          ),

          if (serviceState == ServiceState.allStopped || 
              (serviceState == ServiceState.mixedRunning && 
               widget.service.containers.any((c) => c.state.toLowerCase() == 'stopped' || c.state.toLowerCase() == 'exited')))
            _buildActionButton(
              context: context,
              command: 'start',
              label: 'Start',
              icon: Icons.play_arrow_rounded,
              color: colorScheme.success,
              tooltip: 'Start ${widget.service.name}',
              isMobile: true,
            )
          else if (serviceState == ServiceState.allRunning || serviceState == ServiceState.mixedRunning)
            _buildActionButton(
              context: context,
              command: 'stop',
              label: 'Stop',
              icon: Icons.stop_rounded,
              color: colorScheme.error,
              tooltip: 'Stop ${widget.service.name}',
              isMobile: true,
            ),

          if (widget.onOpenTerminal != null && 
              (serviceState == ServiceState.allRunning || serviceState == ServiceState.mixedRunning))
            _buildTerminalButton(context, colorScheme, true),

          _buildMoreActionsButton(context, colorScheme, serviceState),
        ],
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
          icon: Icons.upload_rounded,
          color: AppTheme.primaryPurple,
          tooltip: 'Deploy/Update ${widget.service.name}',
          isMobile: false,
        ),

        if (serviceState == ServiceState.allStopped || 
            (serviceState == ServiceState.mixedRunning && 
             widget.service.containers.any((c) => c.state.toLowerCase() == 'stopped' || c.state.toLowerCase() == 'exited')))
          _buildActionButton(
            context: context,
            command: 'start',
            label: 'Start',
            icon: Icons.play_arrow_rounded,
            color: colorScheme.success,
            tooltip: 'Start ${widget.service.name}',
            isMobile: false,
          ),

        if (serviceState == ServiceState.allRunning || serviceState == ServiceState.mixedRunning)
          _buildActionButton(
            context: context,
            command: 'stop',
            label: 'Stop',
            icon: Icons.stop_rounded,
            color: colorScheme.error,
            tooltip: 'Stop ${widget.service.name}',
            isMobile: false,
          ),

        if (serviceState == ServiceState.allRunning)
          _buildActionButton(
            context: context,
            command: 'restart',
            label: 'Restart',
            icon: Icons.refresh_rounded,
            color: colorScheme.info,
            tooltip: 'Restart ${widget.service.name}',
            isMobile: false,
          ),

        _buildActionButton(
          context: context,
          command: 'pull',
          label: 'Pull',
          icon: Icons.cloud_download_rounded,
          color: colorScheme.onSurfaceVariant,
          tooltip: 'Pull latest images for ${widget.service.name}',
          isMobile: false,
        ),

        if (serviceState != ServiceState.allNotCreated && 
            widget.service.containers.any((c) => c.state.toLowerCase() != 'not created'))
          _buildActionButton(
            context: context,
            command: 'down',
            label: 'Down',
            icon: Icons.download_rounded,
            color: colorScheme.warning,
            tooltip: 'Stop and remove ${widget.service.name} containers',
            isMobile: false,
          ),

        if (widget.onOpenTerminal != null && 
            (serviceState == ServiceState.allRunning || serviceState == ServiceState.mixedRunning))
          _buildTerminalButton(context, colorScheme, false),
      ],
    );
  }

  Widget _buildMoreActionsButton(BuildContext context, ColorScheme colorScheme, ServiceState serviceState) {
    return PopupMenuButton<String>(
      onSelected: (String command) {
        _handleAction(command);
      },
      itemBuilder: (BuildContext context) => [
        if (serviceState == ServiceState.allRunning)
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
        
        if (serviceState != ServiceState.allNotCreated && 
            widget.service.containers.any((c) => c.state.toLowerCase() != 'not created'))
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz_rounded,
              size: 12,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              'More',
              style: TextStyle(
                fontSize: 11,
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
    final isDisabled = widget.isOperationRunning;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
        child: InkWell(
          onTap: isDisabled ? null : () => _handleAction(command),
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 6 : 8, 
              vertical: isMobile ? 4 : 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isThisRunning) ...[
                  SizedBox(
                    width: isMobile ? 12 : 14,
                    height: isMobile ? 12 : 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
                ] else ...[
                  Icon(
                    icon,
                    size: isMobile ? 12 : 14,
                    color: color,
                  ),
                ],
                SizedBox(width: isMobile ? 3 : 4),
                Text(
                  isThisRunning ? _getLoadingText(command) : label,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTerminalButton(BuildContext context, ColorScheme colorScheme, bool isMobile) {
    final color = colorScheme.success;
    
    return Tooltip(
      message: 'Open terminal for ${widget.service.name}',
      child: Material(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
        child: InkWell(
          onTap: widget.isOperationRunning ? null : widget.onOpenTerminal,
          borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 6 : 8, 
              vertical: isMobile ? 4 : 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.terminal_rounded,
                  size: isMobile ? 12 : 14,
                  color: color,
                ),
                SizedBox(width: isMobile ? 3 : 4),
                Text(
                  'Terminal',
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isThisOperationRunning(String command) {
    return widget.isOperationRunning && widget.runningOperation == '$command:${widget.service.name}';
  }

  void _handleAction(String command) {
    widget.onQuickOperation?.call(OperationRequest(
      command: command,
      options: [],
      services: [widget.service.name],
    ));
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

  Widget _buildStatusIndicator(ColorScheme colorScheme, int running, int total, bool isMobile) {
    final isHealthy = running == total && total > 0;
    final isPartial = running > 0 && running < total;
    
    Color statusColor;
    Color bgColor;
    String statusText;
    
    if (isHealthy) {
      statusColor = colorScheme.success;
      bgColor = colorScheme.successContainer;
      statusText = 'Running';
    } else if (isPartial) {
      statusColor = colorScheme.warning;
      bgColor = colorScheme.warningContainer;
      statusText = 'Partial';
    } else {
      statusColor = colorScheme.error;
      bgColor = colorScheme.errorContainer;
      statusText = 'Stopped';
    }
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 6 : 8, 
        vertical: isMobile ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(isMobile ? 6 : 8),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isMobile ? 4 : 6,
            height: isMobile ? 4 : 6,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: isMobile ? 4 : 6),
          Text(
            '$running/$total',
            style: TextStyle(
              fontSize: isMobile ? 10 : 12,
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 4),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: statusColor.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContainerList(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: widget.service.containers.map((container) {
          return _buildContainerItem(context, colorScheme, container);
        }).toList(),
      ),
    );
  }

  Widget _buildContainerItem(BuildContext context, ColorScheme colorScheme, 
      stack_models.Container container) {
    final statusInfo = _getContainerStatusInfo(colorScheme, container);
    final uptime = _formatUptime(container.started);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(isMobile ? 8 : 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
        border: Border.all(
          color: statusInfo['color'].withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: isMobile ? 8 : 12,
            height: isMobile ? 8 : 12,
            decoration: BoxDecoration(
              color: statusInfo['color'],
              shape: BoxShape.circle,
            ),
          ),
          
          SizedBox(width: isMobile ? 8 : 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        container.name,
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 4 : 6, 
                        vertical: isMobile ? 1 : 3,
                      ),
                      decoration: BoxDecoration(
                        color: statusInfo['color'].withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(isMobile ? 4 : 6),
                      ),
                      child: Text(
                        statusInfo['label'],
                        style: TextStyle(
                          fontSize: isMobile ? 9 : 10,
                          fontWeight: FontWeight.w600,
                          color: statusInfo['color'],
                        ),
                      ),
                    ),
                  ],
                ),
                if (uptime.isNotEmpty && !isMobile) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Up $uptime',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          if (container.ports != null && container.ports!.isNotEmpty)
            ...container.ports!.take(isMobile ? 1 : 2).map((port) => Container(
              margin: const EdgeInsets.only(left: 4),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 4 : 6, 
                vertical: isMobile ? 2 : 3,
              ),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(isMobile ? 4 : 6),
              ),
              child: Text(
                port.publicPort != null && port.publicPort! > 0 
                    ? '${port.publicPort}:${port.privatePort}'
                    : '${port.privatePort}',
                style: TextStyle(
                  fontSize: isMobile ? 9 : 10,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.primary,
                  fontFamily: 'monospace',
                ),
              ),
            )),
          
          if (container.ports != null && container.ports!.length > (isMobile ? 1 : 2))
            Container(
              margin: const EdgeInsets.only(left: 4),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 4 : 6, 
                vertical: isMobile ? 2 : 3,
              ),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(isMobile ? 4 : 6),
              ),
              child: Text(
                '+${container.ports!.length - (isMobile ? 1 : 2)}',
                style: TextStyle(
                  fontSize: isMobile ? 9 : 10,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpandedDetails(BuildContext context, ColorScheme colorScheme, bool isMobile) {
    if (!_isExpanded) return const SizedBox.shrink();
    
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(
        isMobile ? 12 : 16, 
        0, 
        isMobile ? 12 : 16, 
        isMobile ? 12 : 16,
      ),
      padding: EdgeInsets.all(isMobile ? 10 : 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.service.containers.map((container) => 
          _buildContainerExpandedDetails(context, colorScheme, container, isMobile)
        ).toList(),
      ),
    );
  }

  Widget _buildContainerExpandedDetails(BuildContext context, ColorScheme colorScheme, 
      stack_models.Container container, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.developer_board_rounded,
              size: isMobile ? 14 : 16,
              color: colorScheme.primary,
            ),
            SizedBox(width: isMobile ? 6 : 8),
            Text(
              container.name,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        
        SizedBox(height: isMobile ? 8 : 12),
        
        if (isMobile) 
          _buildMobileDetailColumn(context, colorScheme, container)
        else
          _buildDesktopDetailColumns(context, colorScheme, container),
        
        if (widget.service.containers.last != container)
          Padding(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 12),
            child: const Divider(),
          ),
      ],
    );
  }

  Widget _buildMobileDetailColumn(BuildContext context, ColorScheme colorScheme, 
      stack_models.Container container) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (container.restartPolicy != null)
          _buildDetailRow(
            context,
            'Restart',
            container.restartPolicy!.name,
            Icons.refresh_rounded,
            colorScheme,
            isMobile: true,
          ),
        
        if (container.user?.isNotEmpty == true)
          _buildDetailRow(
            context,
            'User',
            container.user!,
            Icons.person_rounded,
            colorScheme,
            isCode: true,
            isMobile: true,
          ),
        
        if (container.created?.isNotEmpty == true)
          _buildDetailRow(
            context,
            'Created',
            _formatDateTime(container.created!),
            Icons.access_time_rounded,
            colorScheme,
            isCode: true,
            isMobile: true,
          ),
        
        if (container.networks != null && container.networks!.isNotEmpty) ...[
          SizedBox(height: 6),
          Text(
            'Networks',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          ...container.networks!.take(2).map((network) => Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              '${network.name}${network.ipAddress?.isNotEmpty == true ? ': ${network.ipAddress}' : ''}',
              style: TextStyle(
                fontSize: 10,
                color: colorScheme.onSurfaceVariant,
                fontFamily: network.ipAddress?.isNotEmpty == true ? 'monospace' : null,
              ),
            ),
          )),
          if (container.networks!.length > 2)
            Text(
              '+${container.networks!.length - 2} more',
              style: TextStyle(
                fontSize: 9,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildDesktopDetailColumns(BuildContext context, ColorScheme colorScheme, 
      stack_models.Container container) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (container.restartPolicy != null)
                _buildDetailRow(
                  context,
                  'Restart Policy',
                  container.restartPolicy!.name,
                  Icons.refresh_rounded,
                  colorScheme,
                ),
              
              if (container.user?.isNotEmpty == true)
                _buildDetailRow(
                  context,
                  'User',
                  container.user!,
                  Icons.person_rounded,
                  colorScheme,
                  isCode: true,
                ),
              
              if (container.workingDir?.isNotEmpty == true)
                _buildDetailRow(
                  context,
                  'Working Dir',
                  container.workingDir!,
                  Icons.folder_rounded,
                  colorScheme,
                  isCode: true,
                ),
              
              if (container.resourceLimits?.memory != null)
                _buildDetailRow(
                  context,
                  'Memory',
                  _formatMemory(container.resourceLimits!.memory),
                  Icons.memory_rounded,
                  colorScheme,
                ),
              
              if (container.resourceLimits?.cpuShares != null)
                _buildDetailRow(
                  context,
                  'CPU',
                  '${container.resourceLimits!.cpuShares} shares',
                  Icons.speed_rounded,
                  colorScheme,
                ),
            ],
          ),
        ),
        
        const SizedBox(width: 16),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (container.created?.isNotEmpty == true)
                _buildDetailRow(
                  context,
                  'Created',
                  _formatDateTime(container.created!),
                  Icons.access_time_rounded,
                  colorScheme,
                  isCode: true,
                ),
              
              if (container.started?.isNotEmpty == true)
                _buildDetailRow(
                  context,
                  'Started',
                  _formatDateTime(container.started!),
                  Icons.play_circle_rounded,
                  colorScheme,
                  isCode: true,
                ),
              
              if (container.networks != null && container.networks!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Networks',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                ...container.networks!.map((network) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          network.name,
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      if (network.ipAddress?.isNotEmpty == true)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            network.ipAddress!,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'monospace',
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                    ],
                  ),
                )),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    ColorScheme colorScheme, {
    bool isCode = false,
    bool isMobile = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 4 : 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: isMobile ? 12 : 14,
            color: colorScheme.primary,
          ),
          SizedBox(width: isMobile ? 4 : 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 12,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 12,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSurface,
                    fontFamily: isCode ? 'monospace' : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateTimeStr;
    }
  }

  Map<String, dynamic> _getContainerStatusInfo(ColorScheme colorScheme, 
      stack_models.Container container) {
    final state = container.state.toLowerCase();
    
    switch (state) {
      case 'running':
        return {
          'color': colorScheme.success,
          'label': 'Running',
        };
      case 'stopped':
      case 'exited':
        return {
          'color': colorScheme.error,
          'label': (container.exitCode ?? 0) == 0 ? 'Stopped' : 'Error (${container.exitCode})',
        };
      case 'paused':
        return {
          'color': colorScheme.warning,
          'label': 'Paused',
        };
      case 'restarting':
        return {
          'color': colorScheme.info,
          'label': 'Restarting',
        };
      case 'not created':
        return {
          'color': colorScheme.onSurfaceVariant,
          'label': 'Not Created',
        };
      default:
        return {
          'color': colorScheme.warning,
          'label': state.toUpperCase(),
        };
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