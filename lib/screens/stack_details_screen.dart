import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/stack.dart' as stack_models;
import '../models/server.dart';
import '../services/stack_service.dart';
import '../services/server_service.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class StackDetailsScreen extends StatefulWidget {
  final int serverId;
  final String stackName;
  final StackService stackService;

  const StackDetailsScreen({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.stackService,
  });

  @override
  State<StackDetailsScreen> createState() => _StackDetailsScreenState();
}

class _StackDetailsScreenState extends State<StackDetailsScreen> {
  stack_models.StackDetails? _stackDetails;
  Server? _server;
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
      
      // Load server info and stack details concurrently
      final futures = await Future.wait([
        serverService.getUserServer(widget.serverId),
        widget.stackService.getStackDetails(widget.serverId, widget.stackName),
      ]);
      
      final server = futures[0] as Server;
      final stackDetails = futures[1] as stack_models.StackDetails;
      
      setState(() {
        _server = server;
        _stackDetails = stackDetails;
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
        title: Text(widget.stackName),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      drawer: const AppDrawer(currentRoute: '/servers/stacks'),
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
              'Error loading stack details',
              style: Theme.of(context).textTheme.headlineSmall,
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

    if (_stackDetails == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storage_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              'No stack details available',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Unable to load information for this stack.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Breadcrumb
          _buildBreadcrumb(),
          const SizedBox(height: 16),

          // Stack Overview Card
          _buildStackOverviewCard(),
          const SizedBox(height: 16),

          // Services Section
          if (_stackDetails!.services.isNotEmpty) ...[
            Text(
              'Services & Containers',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            ..._stackDetails!.services.map((service) => _buildServiceCard(service)),
          ] else ...[
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No services found',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'This stack doesn\'t contain any services.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () => context.go('/dashboard'),
          icon: const Icon(Icons.home, size: 16),
          label: const Text('Dashboard'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 32),
          ),
        ),
        const Icon(Icons.chevron_right, size: 16),
        TextButton(
          onPressed: () => context.go('/servers/${widget.serverId}/stacks'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 32),
          ),
          child: Text('${_server?.name ?? 'Server'} Stacks'),
        ),
        const Icon(Icons.chevron_right, size: 16),
        Text(
          widget.stackName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildStackOverviewCard() {
    final stackDetails = _stackDetails!;
    final totalContainers = stackDetails.services
        .fold<int>(0, (sum, service) => sum + service.containers.length);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.storage,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    stackDetails.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildOverviewItem('Compose File', stackDetails.composeFile),
            _buildOverviewItem('Path', stackDetails.path),
            _buildOverviewItem('Services Count', stackDetails.services.length.toString()),
            _buildOverviewItem('Total Containers', totalContainers.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(stack_models.ComposeService service) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.apps,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    service.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (service.image != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      service.image!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Containers
          if (service.containers.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: service.containers.map((container) => _buildContainerRow(container)).toList(),
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No containers found for this service',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContainerRow(stack_models.Container container) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  container.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildContainerStatusChip(container.state),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.image,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  container.image,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          if (container.ports != null && container.ports!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.settings_ethernet,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: container.ports!.map((port) => _buildPortChip(port)).toList(),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContainerStatusChip(String state) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (state.toLowerCase()) {
      case 'running':
        backgroundColor = Colors.green.withValues(alpha: 0.1);
        textColor = Colors.green.shade700;
        icon = Icons.play_circle_filled;
        break;
      case 'stopped':
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        textColor = Colors.red.shade700;
        icon = Icons.stop_circle;
        break;
      case 'paused':
        backgroundColor = Colors.orange.withValues(alpha: 0.1);
        textColor = Colors.orange.shade700;
        icon = Icons.pause_circle;
        break;
      case 'restarting':
        backgroundColor = Colors.blue.withValues(alpha: 0.1);
        textColor = Colors.blue.shade700;
        icon = Icons.refresh;
        break;
      case 'not created':
        backgroundColor = Colors.grey.withValues(alpha: 0.1);
        textColor = Colors.grey.shade700;
        icon = Icons.radio_button_unchecked;
        break;
      case 'exited':
        backgroundColor = Colors.orange.withValues(alpha: 0.1);
        textColor = Colors.orange.shade700;
        icon = Icons.exit_to_app;
        break;
      default:
        backgroundColor = Colors.grey.withValues(alpha: 0.1);
        textColor = Colors.grey.shade700;
        icon = Icons.help_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: textColor,
          ),
          const SizedBox(width: 4),
          Text(
            state,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortChip(stack_models.Port port) {
    final portText = port.publicPort != null 
        ? '${port.publicPort}:${port.privatePort}/${port.type}'
        : '${port.privatePort}/${port.type}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        portText,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontFamily: 'monospace',
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}