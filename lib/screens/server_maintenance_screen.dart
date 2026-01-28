import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../services/maintenance_service.dart';
import '../services/server_service.dart';
import '../theme/app_theme.dart';

class ServerMaintenanceScreen extends StatefulWidget {
  final int serverId;

  const ServerMaintenanceScreen({
    super.key,
    required this.serverId,
  });

  @override
  State<ServerMaintenanceScreen> createState() => _ServerMaintenanceScreenState();
}

class _ServerMaintenanceScreenState extends State<ServerMaintenanceScreen> {
  berth_api.MaintenanceInfo? _maintenanceInfo;
  berth_api.ServerResponse? _server;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final serverService = context.read<ServerService>();
      final maintenanceService = context.read<MaintenanceService>();

      final futures = await Future.wait([
        serverService.getUserServer(widget.serverId),
        maintenanceService.getMaintenanceInfo(widget.serverId),
      ]);

      final server = futures[0] as berth_api.ServerResponse;
      final maintenanceInfo = futures[1] as berth_api.MaintenanceInfo;

      setState(() {
        _server = server;
        _maintenanceInfo = maintenanceInfo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_server?.name ?? 'Server Maintenance'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading maintenance info',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _loadData,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSystemInfoCard(),
          const SizedBox(height: AppSpacing.md),
          _buildDiskUsageCard(),
          const SizedBox(height: AppSpacing.md),
          _buildResourceSummaryCard(),
          const SizedBox(height: AppSpacing.md),
          _buildResourceSection('Images', Icons.image, _maintenanceInfo!.imageSummary.images.length, _buildImagesSection),
          const SizedBox(height: AppSpacing.md),
          _buildResourceSection('Containers', Icons.view_in_ar, _maintenanceInfo!.containerSummary.containers.length, _buildContainersSection),
          const SizedBox(height: AppSpacing.md),
          _buildResourceSection('Volumes', Icons.storage, _maintenanceInfo!.volumeSummary.volumes.length, _buildVolumesSection),
          const SizedBox(height: AppSpacing.md),
          _buildResourceSection('Networks', Icons.hub, _maintenanceInfo!.networkSummary.networks.length, _buildNetworksSection),
          const SizedBox(height: AppSpacing.md),
          _buildCleanupSection(),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  Widget _buildResourceSection(String title, IconData icon, int itemCount, Widget Function() contentBuilder) {
    return Card(
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '$itemCount ${itemCount == 1 ? 'item' : 'items'}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        children: [
          if (itemCount > 0)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: contentBuilder(),
            )
          else
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                'No $title found',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCleanupSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 8),
                Text(
                  'Docker Cleanup Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Select cleanup operations to free up disk space. Review the statistics before proceeding.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _buildCleanupOptionsGrid(),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildQuickActionsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildImagesSection() {
    final images = _maintenanceInfo!.imageSummary.images;
    return Column(
      children: images.map((image) => _buildResourceCard(
        title: '${image.repository}:${image.tag}',
        subtitle: 'ID: ${image.id.substring(0, 12)}',
        size: image.size,
        status: image.dangling ? 'Dangling' : (image.unused ? 'Unused' : 'In Use'),
        statusColor: image.dangling || image.unused
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        icon: Icons.image,
        onDelete: image.dangling || image.unused
            ? () => _deleteResource('image', image.id)
            : null,
      )).toList(),
    );
  }

  Widget _buildContainersSection() {
    final containers = _maintenanceInfo!.containerSummary.containers;
    return Column(
      children: containers.map((container) => _buildResourceCard(
        title: container.name,
        subtitle: 'Image: ${container.image}',
        size: container.size,
        status: container.state,
        statusColor: container.state == 'running'
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline,
        icon: Icons.view_in_ar,
        onDelete: container.state != 'running'
            ? () => _deleteResource('container', container.id)
            : null,
      )).toList(),
    );
  }

  Widget _buildVolumesSection() {
    final volumes = _maintenanceInfo!.volumeSummary.volumes;
    return Column(
      children: volumes.map((volume) => _buildResourceCard(
        title: volume.name,
        subtitle: 'Driver: ${volume.driver}',
        size: volume.size,
        status: volume.unused ? 'Unused' : 'In Use',
        statusColor: volume.unused
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        icon: Icons.storage,
        onDelete: volume.unused
            ? () => _deleteResource('volume', volume.name)
            : null,
      )).toList(),
    );
  }

  Widget _buildNetworksSection() {
    final networks = _maintenanceInfo!.networkSummary.networks;
    return Column(
      children: networks.map((network) => _buildResourceCard(
        title: network.name,
        subtitle: 'Driver: ${network.driver} • Scope: ${network.scope}',
        size: null,
        status: network.unused ? 'Unused' : 'In Use',
        statusColor: network.unused
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        icon: Icons.hub,
        onDelete: network.unused && !['bridge', 'host', 'none'].contains(network.name)
            ? () => _deleteResource('network', network.id)
            : null,
      )).toList(),
    );
  }

  Widget _buildSystemInfoCard() {
    final systemInfo = _maintenanceInfo!.systemInfo;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.computer,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'System Information',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildInfoRow('Docker Version', systemInfo.version),
            _buildInfoRow('API Version', systemInfo.apiVersion),
            _buildInfoRow('Architecture', systemInfo.architecture),
            _buildInfoRow('OS', systemInfo.os),
            _buildInfoRow('Kernel', systemInfo.kernelVersion),
            _buildInfoRow('CPUs', systemInfo.ncpu.toString()),
            _buildInfoRow('Memory', _formatBytes(systemInfo.totalMemory)),
            _buildInfoRow('Storage Driver', systemInfo.storageDriver),
          ],
        ),
      ),
    );
  }

  Widget _buildDiskUsageCard() {
    final diskUsage = _maintenanceInfo!.diskUsage;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.pie_chart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Disk Usage',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildUsageRow('Total Size', diskUsage.totalSize, diskUsage.totalSize),
            _buildUsageRow('Images', diskUsage.imagesSize, diskUsage.totalSize),
            _buildUsageRow('Containers', diskUsage.containersSize, diskUsage.totalSize),
            _buildUsageRow('Volumes', diskUsage.volumesSize, diskUsage.totalSize),
            _buildUsageRow('Build Cache', diskUsage.buildCacheSize, diskUsage.totalSize),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceSummaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.inventory_2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Resource Summary',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    'Images',
                    _maintenanceInfo!.imageSummary.totalCount,
                    _maintenanceInfo!.imageSummary.unusedCount,
                    Icons.image,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    'Containers',
                    _maintenanceInfo!.containerSummary.totalCount,
                    _maintenanceInfo!.containerSummary.stoppedCount,
                    Icons.view_in_ar,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    'Volumes',
                    _maintenanceInfo!.volumeSummary.totalCount,
                    _maintenanceInfo!.volumeSummary.unusedCount,
                    Icons.storage,
                  ),
                ),
                Expanded(
                  child: _buildSummaryItem(
                    'Networks',
                    _maintenanceInfo!.networkSummary.totalCount,
                    _maintenanceInfo!.networkSummary.unusedCount,
                    Icons.hub,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String title, int total, int unused, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 2),
          Text(
            total.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (unused > 0)
            Text(
              '$unused unused',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
        ],
      ),
    );
  }






  Widget _buildCleanupOptionsGrid() {
    final cleanupTypes = [
      {
        'type': 'images',
        'title': 'Images',
        'description': 'Remove unused Docker images',
        'icon': Icons.image,
        'stats': _getCleanupStats('images'),
      },
      {
        'type': 'containers', 
        'title': 'Containers',
        'description': 'Remove stopped containers',
        'icon': Icons.view_in_ar,
        'stats': _getCleanupStats('containers'),
      },
      {
        'type': 'volumes',
        'title': 'Volumes',
        'description': 'Remove unused volumes',
        'icon': Icons.storage,
        'stats': _getCleanupStats('volumes'),
      },
      {
        'type': 'networks',
        'title': 'Networks', 
        'description': 'Remove unused networks',
        'icon': Icons.hub,
        'stats': _getCleanupStats('networks'),
      },
      {
        'type': 'build-cache',
        'title': 'Build Cache',
        'description': 'Remove build cache entries',
        'icon': Icons.build,
        'stats': _getCleanupStats('build-cache'),
      },
      {
        'type': 'system',
        'title': 'Full System',
        'description': 'Complete system cleanup',
        'icon': Icons.cleaning_services,
        'stats': _getCleanupStats('system'),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine grid configuration based on screen width
        int crossAxisCount;
        double childAspectRatio;
        double crossAxisSpacing = AppSpacing.sm;
        double mainAxisSpacing = AppSpacing.sm;

        if (constraints.maxWidth < 600) {
          // Phone: 2 columns
          crossAxisCount = 2;
          childAspectRatio = 0.85;
        } else if (constraints.maxWidth < 900) {
          // Tablet portrait: 3 columns
          crossAxisCount = 3;
          childAspectRatio = 0.9;
          crossAxisSpacing = AppSpacing.md;
          mainAxisSpacing = AppSpacing.md;
        } else if (constraints.maxWidth < 1200) {
          // Tablet landscape/small desktop: 3 columns with more spacing
          crossAxisCount = 3;
          childAspectRatio = 1.0;
          crossAxisSpacing = AppSpacing.lg;
          mainAxisSpacing = AppSpacing.lg;
        } else {
          // Large desktop: 4 columns
          crossAxisCount = 4;
          childAspectRatio = 1.1;
          crossAxisSpacing = AppSpacing.lg;
          mainAxisSpacing = AppSpacing.lg;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          itemCount: cleanupTypes.length,
          itemBuilder: (context, index) {
            final cleanupType = cleanupTypes[index];
            return _buildCleanupOptionCard(cleanupType, constraints.maxWidth);
          },
        );
      },
    );
  }

  Widget _buildCleanupOptionCard(Map<String, dynamic> cleanupType, double screenWidth) {
    final stats = cleanupType['stats'] as Map<String, dynamic>;
    final hasProblematic = stats['problematic'] > 0;
    
    // Adjust card content based on screen size
    final isCompact = screenWidth < 600;
    final iconSize = isCompact ? 20.0 : 24.0;
    final titleMaxLines = isCompact ? 1 : 2;
    final descriptionMaxLines = isCompact ? 2 : 3;
    final cardPadding = isCompact ? AppSpacing.xs : AppSpacing.sm;
    
    return Card(
      child: InkWell(
        onTap: hasProblematic ? () => _showCleanupDialog(cleanupType) : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    cleanupType['icon'] as IconData,
                    color: hasProblematic 
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    size: iconSize,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cleanupType['title'] as String,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: titleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                cleanupType['description'] as String,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: descriptionMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              _buildStatsRow('Total', stats['total'].toString()),
              if (hasProblematic) ...[
                const SizedBox(height: 4),
                _buildStatsRow(
                  'To Clean', 
                  stats['problematic'].toString(),
                  isHighlight: true,
                ),
              ],
              if (stats['size'] > 0) ...[
                const SizedBox(height: 4),
                _buildStatsRow('Size', _formatBytes(stats['size'])),
              ],
              const Spacer(),
              if (hasProblematic)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Cleanup Available',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Already Clean',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    final quickActions = [
      {
        'title': 'Dangling Images Only',
        'description': 'Remove untagged images',
        'icon': Icons.image,
        'color': Colors.orange,
        'onTap': () => _performAdvancedCleanup('images', all: false),
      },
      {
        'title': 'All Unused Images',
        'description': 'Remove all unused images',
        'icon': Icons.image,
        'color': Colors.red,
        'onTap': () => _performAdvancedCleanup('images', all: true),
      },
      {
        'title': 'Stopped Containers',
        'description': 'Remove stopped containers',
        'icon': Icons.view_in_ar,
        'color': Colors.blue,
        'onTap': () => _performAdvancedCleanup('containers'),
      },
      {
        'title': 'Full System Clean',
        'description': 'Complete system cleanup',
        'icon': Icons.cleaning_services,
        'color': Colors.deepPurple,
        'onTap': () => _performAdvancedCleanup('system'),
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Quick actions always use 2 columns for better layout
        int crossAxisCount = 2;
        double childAspectRatio;
        double crossAxisSpacing = AppSpacing.sm;
        double mainAxisSpacing = AppSpacing.sm;

        if (constraints.maxWidth < 600) {
          // Phone: taller cards
          childAspectRatio = 1.3;
        } else if (constraints.maxWidth < 900) {
          // Tablet: more square cards  
          childAspectRatio = 1.4;
          crossAxisSpacing = AppSpacing.md;
          mainAxisSpacing = AppSpacing.md;
        } else {
          // Desktop: wider cards
          childAspectRatio = 1.5;
          crossAxisSpacing = AppSpacing.lg;
          mainAxisSpacing = AppSpacing.lg;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          itemCount: quickActions.length,
          itemBuilder: (context, index) {
            final action = quickActions[index];
            return _buildQuickActionCard(
              action['title'] as String,
              action['description'] as String,
              action['icon'] as IconData,
              action['color'] as Color,
              action['onTap'] as VoidCallback,
              constraints.maxWidth,
            );
          },
        );
      },
    );
  }

  Widget _buildQuickActionCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
    double screenWidth,
  ) {
    // Adjust card content based on screen size
    final isCompact = screenWidth < 600;
    final iconSize = isCompact ? 24.0 : 28.0;
    final cardPadding = isCompact ? AppSpacing.xs : AppSpacing.sm;
    final titleMaxLines = isCompact ? 1 : 2;
    final descriptionMaxLines = isCompact ? 1 : 2;
    
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(cardPadding),
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: iconSize,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: titleMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: descriptionMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow(String label, String value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: isHighlight 
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: isHighlight
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Map<String, dynamic> _getCleanupStats(String type) {
    if (_maintenanceInfo == null) return {'total': 0, 'problematic': 0, 'size': 0};
    
    switch (type) {
      case 'images':
        return {
          'total': _maintenanceInfo!.imageSummary.totalCount,
          'problematic': _maintenanceInfo!.imageSummary.danglingCount + _maintenanceInfo!.imageSummary.unusedCount,
          'size': _maintenanceInfo!.imageSummary.danglingSize + _maintenanceInfo!.imageSummary.unusedSize,
        };
      case 'containers':
        return {
          'total': _maintenanceInfo!.containerSummary.totalCount,
          'problematic': _maintenanceInfo!.containerSummary.stoppedCount,
          'size': 0,
        };
      case 'volumes':
        return {
          'total': _maintenanceInfo!.volumeSummary.totalCount,
          'problematic': _maintenanceInfo!.volumeSummary.unusedCount,
          'size': _maintenanceInfo!.volumeSummary.unusedSize,
        };
      case 'networks':
        return {
          'total': _maintenanceInfo!.networkSummary.totalCount,
          'problematic': _maintenanceInfo!.networkSummary.unusedCount,
          'size': 0,
        };
      case 'build-cache':
        return {
          'total': _maintenanceInfo!.buildCacheSummary.totalCount,
          'problematic': _maintenanceInfo!.buildCacheSummary.cache.where((c) => !c.inUse).length,
          'size': _maintenanceInfo!.buildCacheSummary.totalSize,
        };
      case 'system':
        return {
          'total': _maintenanceInfo!.imageSummary.totalCount + 
                   _maintenanceInfo!.containerSummary.totalCount + 
                   _maintenanceInfo!.volumeSummary.totalCount + 
                   _maintenanceInfo!.networkSummary.totalCount,
          'problematic': _maintenanceInfo!.imageSummary.danglingCount + 
                        _maintenanceInfo!.imageSummary.unusedCount +
                        _maintenanceInfo!.containerSummary.stoppedCount +
                        _maintenanceInfo!.volumeSummary.unusedCount + 
                        _maintenanceInfo!.networkSummary.unusedCount,
          'size': _maintenanceInfo!.diskUsage.totalSize,
        };
      default:
        return {'total': 0, 'problematic': 0, 'size': 0};
    }
  }

  Future<void> _showCleanupDialog(Map<String, dynamic> cleanupType) async {
    final stats = cleanupType['stats'] as Map<String, dynamic>;
    final type = cleanupType['type'] as String;
    
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              cleanupType['icon'] as IconData,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text('Cleanup ${cleanupType['title']}'),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cleanupType['description'] as String),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildStatsRow('Total Resources', stats['total'].toString()),
                  _buildStatsRow('Resources to Clean', stats['problematic'].toString(), isHighlight: true),
                  if (stats['size'] > 0)
                    _buildStatsRow('Space to Reclaim', _formatBytes(stats['size'])),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (type == 'images' || type == 'volumes' || type == 'build-cache')
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose cleanup mode:',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _performAdvancedCleanup(type, all: false);
                            },
                            child: Text(type == 'images' ? 'Dangling Only' : 'Safe Clean'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _performAdvancedCleanup(type, all: true);
                            },
                            child: const Text('All Unused'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performAdvancedCleanup(type);
                    },
                    child: const Text('Clean Now'),
                  ),
                ],
              ),
            if (type == 'images' || type == 'volumes' || type == 'build-cache')
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _performAdvancedCleanup(String type, {bool? force, bool? all}) async {
    final maintenanceService = context.read<MaintenanceService>();
    
    final confirmed = await _showConfirmationDialog(
      'Confirm ${all == true ? "Complete" : "Safe"} Cleanup',
      'Are you sure you want to clean up $type? This action cannot be undone.',
    );

    if (!confirmed) return;

    try {
      final request = berth_api.PruneRequest(
        type: type,
        force: force ?? false,
        all: all ?? false,
        filters: '',
      );

      final result = await maintenanceService.pruneResources(widget.serverId, request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Successfully cleaned up ${result.itemsDeleted.length} items, '
              'reclaimed ${_formatBytes(result.spaceReclaimed)}',
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        _loadData();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to perform cleanup: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Widget _buildResourceCard({
    required String title,
    required String subtitle,
    required int? size,
    required String status,
    required Color statusColor,
    required IconData icon,
    VoidCallback? onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (size != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      _formatBytes(size),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 8),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                  size: 20,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageRow(String label, int value, int total) {
    final percentage = total > 0 ? (value / total * 100).toStringAsFixed(1) : '0.0';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              _formatBytes(value),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
          Text(
            '$percentage%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _deleteResource(String type, String id) async {
    final maintenanceService = context.read<MaintenanceService>();
    
    final confirmed = await _showConfirmationDialog(
      'Confirm Deletion',
      'Are you sure you want to delete this $type? This action cannot be undone.',
    );

    if (!confirmed) return;

    try {
      final request = berth_api.DeleteRequest(type: type, id: id);

      final result = await maintenanceService.deleteResource(widget.serverId, request);

      if (mounted) {
        if (result.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Successfully deleted $type'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
          _loadData();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to delete $type: ${result.error}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting $type: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<bool> _showConfirmationDialog(String title, String content) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)}GB';
  }
}