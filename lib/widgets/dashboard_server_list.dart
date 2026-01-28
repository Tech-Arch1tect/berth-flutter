import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../models/stack_statistics.dart';
import '../services/server_service.dart';
import 'dashboard_server_card.dart';
import '../theme/app_theme.dart';

class DashboardServerList extends StatefulWidget {
  const DashboardServerList({super.key});

  @override
  State<DashboardServerList> createState() => _DashboardServerListState();
}

class _DashboardServerListState extends State<DashboardServerList> {
  List<berth_api.ServerResponse> _servers = [];
  bool _isLoading = true;
  String? _error;
  late ServerService _serverService;

  final Map<int, StackStatistics?> _statistics = {};
  final Set<int> _loadingStatistics = {};
  final Set<int> _statisticsErrors = {};

  @override
  void initState() {
    super.initState();
    _serverService = context.read<ServerService>();
    _loadServers();
  }

  Future<void> _loadServers() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final servers = await _serverService.getUserServers();
      if (mounted) {
        setState(() {
          _servers = servers;
          _isLoading = false;
        });
        
        // Load statistics for each server
        _loadAllStatistics();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadAllStatistics() async {
    for (final server in _servers) {
      _loadServerStatistics(server.id);
    }
  }

  Future<void> _loadServerStatistics(int serverId) async {
    if (mounted) {
      setState(() {
        _loadingStatistics.add(serverId);
        _statisticsErrors.remove(serverId);
      });
    }

    try {
      final statistics = await _serverService.getServerStatistics(serverId);
      
      if (mounted) {
        setState(() {
          _statistics[serverId] = statistics;
          _loadingStatistics.remove(serverId);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _statisticsErrors.add(serverId);
          _loadingStatistics.remove(serverId);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Servers',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!_isLoading && _error == null)
                  Text(
                    '${_servers.length} server${_servers.length != 1 ? 's' : ''} configured',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_error != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Failed to load servers',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (_servers.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    children: [
                      Icon(
                        Icons.dns_outlined,
                        size: 48,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No servers configured',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Add your first server to start managing Docker Compose stacks.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            else
              Column(
                children: _servers
                    .map((server) => DashboardServerCard(
                          server: server,
                          statistics: _statistics[server.id],
                          isLoadingStatistics: _loadingStatistics.contains(server.id),
                          hasStatisticsError: _statisticsErrors.contains(server.id),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}