import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/stack.dart' as stack_models;
import '../models/server.dart';
import '../models/websocket_message.dart';
import '../services/api_client.dart';
import '../services/stack_service.dart';
import '../services/server_service.dart';
import '../services/websocket_service.dart';
import '../services/stack_websocket_service.dart';
import '../widgets/app_drawer.dart';
import '../widgets/network_list.dart';
import '../widgets/volume_list.dart';
import '../widgets/environment_variable_list.dart';
import '../widgets/stack_stats_list.dart';
import '../widgets/logs_viewer.dart';
import '../services/logs_service.dart';
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

class _StackDetailsScreenState extends State<StackDetailsScreen> with SingleTickerProviderStateMixin {
  stack_models.StackDetails? _stackDetails;
  List<stack_models.Network>? _networks;
  List<stack_models.Volume>? _volumes;
  Map<String, List<stack_models.ServiceEnvironment>>? _environmentVariables;
  stack_models.StackStats? _stackStats;
  Server? _server;
  bool _isLoading = true;
  bool _isNetworksLoading = false;
  bool _isVolumesLoading = false;
  bool _isEnvironmentLoading = false;
  bool _isStatsLoading = false;
  bool _isStatsRefreshing = false;
  bool _isSilentRefreshing = false;
  String? _error;
  String? _networksError;
  String? _volumesError;
  String? _environmentError;
  String? _statsError;
  
  TabController? _tabController;
  
  StackWebSocketService? _wsService;
  WebSocketConnectionStatus _wsStatus = WebSocketConnectionStatus.disconnected;
  String? _wsError;
  
  Timer? _statsTimer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController!.addListener(_onTabChanged);
    _loadData();
    _initWebSocket();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _wsService?.dispose();
    _statsTimer?.cancel();
    super.dispose();
  }
  
  void _onTabChanged() {
    if (_tabController!.index == 1 && _networks == null && !_isNetworksLoading) {
      _loadNetworks();
    } else if (_tabController!.index == 2 && _volumes == null && !_isVolumesLoading) {
      _loadVolumes();
    } else if (_tabController!.index == 3 && _environmentVariables == null && !_isEnvironmentLoading) {
      _loadEnvironmentVariables();
    } else if (_tabController!.index == 4) {
      // Stats tab - load data and start timer for auto-refresh
      if (_stackStats == null && !_isStatsLoading) {
        _loadStats();
      }
      _startStatsTimer();
    } else if (_tabController!.index == 5) {
      // Logs tab - load stats for container selection
      if (_stackStats == null && !_isStatsLoading) {
        _loadStats();
      }
    } else {
      // Stop stats timer when not on stats tab
      _stopStatsTimer();
    }
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

      // If networks tab is active, also load networks
      if (_tabController?.index == 1) {
        _loadNetworks();
      } else if (_tabController?.index == 2) {
        _loadVolumes();
      } else if (_tabController?.index == 3) {
        _loadEnvironmentVariables();
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadNetworks() async {
    setState(() {
      _isNetworksLoading = true;
      _networksError = null;
    });

    try {
      final networks = await widget.stackService.getStackNetworks(widget.serverId, widget.stackName);
      
      if (mounted) {
        setState(() {
          _networks = networks;
          _isNetworksLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _networksError = e.toString();
          _isNetworksLoading = false;
        });
      }
    }
  }

  Future<void> _loadVolumes() async {
    setState(() {
      _isVolumesLoading = true;
      _volumesError = null;
    });

    try {
      final volumes = await widget.stackService.getStackVolumes(widget.serverId, widget.stackName);
      
      if (mounted) {
        setState(() {
          _volumes = volumes;
          _isVolumesLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _volumesError = e.toString();
          _isVolumesLoading = false;
        });
      }
    }
  }

  Future<void> _loadEnvironmentVariables() async {
    setState(() {
      _isEnvironmentLoading = true;
      _environmentError = null;
    });

    try {
      final environmentVariables = await widget.stackService.getStackEnvironmentVariables(widget.serverId, widget.stackName);
      
      if (mounted) {
        setState(() {
          _environmentVariables = environmentVariables;
          _isEnvironmentLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _environmentError = e.toString();
          _isEnvironmentLoading = false;
        });
      }
    }
  }

  Future<void> _loadStats({bool silent = false}) async {
    setState(() {
      if (silent) {
        _isStatsRefreshing = true;
      } else {
        _isStatsLoading = true;
        _statsError = null;
      }
    });

    try {
      final stackStats = await widget.stackService.getStackStats(widget.serverId, widget.stackName);
      
      if (mounted) {
        setState(() {
          _stackStats = stackStats;
          if (silent) {
            _isStatsRefreshing = false;
          } else {
            _isStatsLoading = false;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          if (silent) {
            _isStatsRefreshing = false;
          } else {
            _statsError = e.toString();
            _isStatsLoading = false;
          }
        });
      }
    }
  }

  void _startStatsTimer() {
    _stopStatsTimer(); // Stop any existing timer
    _statsTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted && _tabController?.index == 4) {
        _loadStats(silent: true);
      }
    });
  }

  void _stopStatsTimer() {
    _statsTimer?.cancel();
    _statsTimer = null;
  }

  Future<void> _refreshDataSilently() async {
    if (mounted) {
      setState(() {
        _isSilentRefreshing = true;
      });
    }
    
    try {
      final serverService = context.read<ServerService>();
      
      final futures = await Future.wait([
        serverService.getUserServer(widget.serverId),
        widget.stackService.getStackDetails(widget.serverId, widget.stackName),
      ]);
      
      final server = futures[0] as Server;
      final stackDetails = futures[1] as stack_models.StackDetails;
      
      if (mounted) {
        setState(() {
          _server = server;
          _stackDetails = stackDetails;
          _isSilentRefreshing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSilentRefreshing = false;
        });
      }
    }
  }

  Future<void> _initWebSocket() async {
    try {
      final apiClient = context.read<ApiClient>();
      final webSocketService = WebSocketService(apiClient);
      
      _wsService = StackWebSocketService(
        webSocketService,
        widget.serverId,
        widget.stackName,
      );

      _wsService!.connectionStatus.listen((status) {
        if (mounted) {
          setState(() {
            _wsStatus = status;
          });
          
          if (status == WebSocketConnectionStatus.connected) {
            _refreshDataSilently();
          }
        }
      });

      _wsService!.errors.listen((error) {
        if (mounted) {
          setState(() {
            _wsError = error.toString();
          });
        }
      });

      _wsService!.refreshEvents.listen((_) {
        if (mounted) {
          _refreshDataSilently();
        }
      });

      await _wsService!.connect();
    } catch (e) {
      if (mounted) {
        setState(() {
          _wsError = 'WebSocket initialization failed: $e';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text(widget.stackName)),
            _buildConnectionStatusIcon(),
          ],
        ),
        actions: [
          if (_isSilentRefreshing)
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(right: 16),
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _loadData();
              if (_tabController?.index == 1) {
                _loadNetworks();
              } else if (_tabController?.index == 2) {
                _loadVolumes();
              } else if (_tabController?.index == 3) {
                _loadEnvironmentVariables();
              } else if (_tabController?.index == 4) {
                _loadStats();
              } else if (_tabController?.index == 5) {
                _loadStats();
              }
            },
          ),
        ],
        bottom: _stackDetails != null ? TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: const Icon(Icons.apps),
              text: 'Services (${_stackDetails?.services.length ?? 0})',
            ),
            Tab(
              icon: const Icon(Icons.hub),
              text: 'Networks${_networks != null ? ' (${_networks!.length})' : ''}',
            ),
            Tab(
              icon: const Icon(Icons.folder),
              text: 'Volumes${_volumes != null ? ' (${_volumes!.length})' : ''}',
            ),
            Tab(
              icon: const Icon(Icons.code),
              text: 'Environment${_environmentVariables != null ? ' (${_environmentVariables!.values.expand((envs) => envs.expand((env) => env.variables)).length})' : ''}',
            ),
            Tab(
              icon: const Icon(Icons.analytics),
              text: 'Stats${_stackStats != null ? ' (${_stackStats!.containers.length})' : ''}',
            ),
            Tab(
              icon: const Icon(Icons.terminal),
              text: 'Logs',
            ),
          ],
        ) : null,
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

    return Column(
      children: [
        // Breadcrumb and Stack Overview (always visible)
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildBreadcrumb(),
              const SizedBox(height: 16),
              _buildStackOverviewCard(),
            ],
          ),
        ),
        
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Services Tab
              RefreshIndicator(
                onRefresh: _loadData,
                child: _stackDetails!.services.isNotEmpty
                    ? ListView(
                        padding: const EdgeInsets.all(16),
                        children: _stackDetails!.services.map((service) => _buildServiceCard(service)).toList(),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
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
                      ),
              ),
              
              // Networks Tab
              RefreshIndicator(
                onRefresh: () async {
                  await _loadNetworks();
                },
                child: NetworkList(
                  networks: _networks ?? [],
                  isLoading: _isNetworksLoading,
                  error: _networksError,
                ),
              ),
              
              // Volumes Tab
              RefreshIndicator(
                onRefresh: () async {
                  await _loadVolumes();
                },
                child: VolumeList(
                  volumes: _volumes ?? [],
                  isLoading: _isVolumesLoading,
                  error: _volumesError,
                ),
              ),
              
              // Environment Variables Tab
              RefreshIndicator(
                onRefresh: () async {
                  await _loadEnvironmentVariables();
                },
                child: EnvironmentVariableList(
                  environmentData: _environmentVariables,
                  isLoading: _isEnvironmentLoading,
                  error: _environmentError,
                ),
              ),
              // Stats Tab
              RefreshIndicator(
                onRefresh: () async {
                  await _loadStats();
                },
                child: StackStatsList(
                  containers: _stackStats?.containers,
                  isLoading: _isStatsLoading || _isStatsRefreshing,
                  error: _statsError,
                ),
              ),
              
              // Logs Tab
              RefreshIndicator(
                onRefresh: () async {
                  // Logs viewer manages its own refresh
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: LogsViewer(
                    serverId: widget.serverId,
                    stackName: widget.stackName,
                    logsService: LogsService(context.read<ApiClient>()),
                    containers: _stackStats?.containers,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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

  Widget _buildConnectionStatusIcon() {
    IconData icon;
    Color color;
    String tooltip;

    switch (_wsStatus) {
      case WebSocketConnectionStatus.connected:
        icon = Icons.cloud_done;
        color = Colors.green;
        tooltip = 'Live updates active';
        break;
      case WebSocketConnectionStatus.connecting:
        icon = Icons.cloud_sync;
        color = Colors.orange;
        tooltip = 'Connecting to live updates';
        break;
      case WebSocketConnectionStatus.error:
        icon = Icons.cloud_off;
        color = Colors.red;
        tooltip = _wsError ?? 'Connection error';
        break;
      case WebSocketConnectionStatus.disconnected:
        icon = Icons.cloud_off;
        color = Colors.grey;
        tooltip = 'Live updates disconnected';
        break;
    }

    return Tooltip(
      message: tooltip,
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}