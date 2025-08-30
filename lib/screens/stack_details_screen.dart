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
import '../widgets/service_card.dart';
import '../widgets/network_list.dart';
import '../widgets/volume_list.dart';
import '../widgets/environment_variable_list.dart';
import '../widgets/stack_stats_list.dart';
import '../widgets/logs_viewer.dart';
import '../widgets/operations_modal.dart';
import '../widgets/stack_quick_actions.dart';
import '../widgets/terminal_modal.dart';
import '../widgets/file_manager.dart';
import '../services/logs_service.dart';
import '../services/operations_service.dart';
import '../models/operation.dart';
import '../theme/app_theme.dart';
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
  
  OperationsService? _operationsService;
  bool _isQuickOperationRunning = false;
  String? _runningQuickOperation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController!.addListener(_onTabChanged);
    _loadData();
    _initWebSocket();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _wsService?.dispose();
    _statsTimer?.cancel();
    _operationsService?.disconnect();
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
      if (_stackStats == null && !_isStatsLoading) {
        _loadStats();
      }
      _startStatsTimer();
    } else if (_tabController!.index == 5) {
      if (_stackStats == null && !_isStatsLoading) {
        _loadStats();
      }
    } else {
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
    _stopStatsTimer();
    _statsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _tabController?.index == 4) {
        _loadStats(silent: true);
      }
    });
  }

  void _stopStatsTimer() {
    _statsTimer?.cancel();
    _statsTimer = null;
  }

  void _showOperationsModal() {
    if (_stackDetails == null) return;
    
    final apiClient = context.read<ApiClient>();
    final operationsService = OperationsService(apiClient);
    
    showDialog(
      context: context,
      builder: (context) => OperationsModal(
        serverId: widget.serverId,
        stackName: widget.stackName,
        services: _stackDetails!.services,
        operationsService: operationsService,
      ),
    );
  }

  void _handleServiceTap(stack_models.ComposeService service) {
  }

  void _handleOpenTerminal(stack_models.ComposeService service) {
    if (_server != null && _stackDetails != null) {
      final runningContainer = service.containers
          .firstWhere((container) => container.state == 'running');
      final stack = stack_models.Stack(
        name: _stackDetails!.name,
        path: _stackDetails!.path,
        composeFile: _stackDetails!.composeFile,
        serverId: _stackDetails!.serverId,
        serverName: _stackDetails!.serverName,
      );
      
      TerminalModal.show(
        context: context,
        server: _server!,
        stack: stack,
        serviceName: service.name,
        containerName: runningContainer.name,
      );
    }
  }

  Future<void> _handleQuickOperation(OperationRequest request) async {
    if (_isQuickOperationRunning) return;
    
    final apiClient = context.read<ApiClient>();
    _operationsService ??= OperationsService(apiClient);
    
    final isStackOperation = request.services.isEmpty;
    final operationKey = isStackOperation 
        ? 'stack:${request.command}'
        : '${request.command}:${request.services.first}';
    
    setState(() {
      _isQuickOperationRunning = true;
      _runningQuickOperation = operationKey;
    });
    
    final targetName = isStackOperation 
        ? 'stack ${widget.stackName}'
        : request.services.first;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting ${request.command} operation for $targetName...'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: const Duration(seconds: 2),
      ),
    );
    
    try {
      if (!_operationsService!.isConnected) {
        await _operationsService!.connect(widget.serverId, widget.stackName);
      }
      
      if (!_operationsService!.isConnected) {
        throw Exception('Unable to connect to operations service');
      }
      
      await _operationsService!.startOperation(request);
      
      _operationsService!.messages.listen(
        (message) {
          if (message.type == 'complete' && mounted) {
            setState(() {
              _isQuickOperationRunning = false;
              _runningQuickOperation = null;
            });
            
            final completionTargetName = isStackOperation 
                ? 'stack ${widget.stackName}'
                : request.services.first;
                
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${request.command.toUpperCase()} operation completed successfully for $completionTargetName'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                duration: const Duration(seconds: 3),
              ),
            );
            
            _refreshDataSilently();
          } else if (message.type == 'error' && mounted) {
            setState(() {
              _isQuickOperationRunning = false;
              _runningQuickOperation = null;
            });
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Operation failed: ${message.data ?? 'Unknown error'}'),
                backgroundColor: Theme.of(context).colorScheme.error,
                duration: const Duration(seconds: 5),
              ),
            );
          }
        },
      );
      
    } catch (e) {
      if (mounted) {
        setState(() {
          _isQuickOperationRunning = false;
          _runningQuickOperation = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Operation failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
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
        leading: Navigator.canPop(context) 
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
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
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Operations',
            onPressed: _stackDetails?.services.isEmpty == true ? null : _showOperationsModal,
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
              icon: const Icon(Icons.description),
              text: 'Files',
            ),
            Tab(
              icon: const Icon(Icons.terminal),
              text: 'Logs',
            ),
          ],
        ) : null,
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
        Container(
          padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.sm),
          child: _buildBreadcrumb(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              RefreshIndicator(
                onRefresh: _loadData,
                child: _stackDetails!.services.isNotEmpty
                    ? ListView(
                        padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
                        children: [
                          _buildStackOverviewCard(),
                          const SizedBox(height: 12),
                          Card(
                            child: StackQuickActions(
                              services: _stackDetails!.services,
                              onQuickOperation: _handleQuickOperation,
                              isOperationRunning: _isQuickOperationRunning,
                              runningOperation: _runningQuickOperation,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ..._stackDetails!.services.map((service) => ServiceCard(
                            service: service,
                            onQuickOperation: _handleQuickOperation,
                            isOperationRunning: _isQuickOperationRunning,
                            runningOperation: _runningQuickOperation,
                            onOpenTerminal: () => _handleOpenTerminal(service),
                            onTap: () => _handleServiceTap(service),
                            showDetails: false,
                          )),
                        ],
                      )
                    : ListView(
                        padding: AppTheme.spacing.itemPadding,
                        children: [
                          _buildStackOverviewCard(),
                          const SizedBox(height: 24),
                          
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
              FileManager(
                serverId: widget.serverId,
                stackName: widget.stackName,
              ),
              RefreshIndicator(
                onRefresh: () async {
                },
                child: Padding(
                  padding: AppTheme.spacing.cardPadding,
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
        padding: const EdgeInsets.all(AppSpacing.sm + AppSpacing.xs),
        child: Row(
          children: [
            Icon(
              Icons.layers_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                stackDetails.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _buildCompactStat('Services', stackDetails.services.length.toString()),
            const SizedBox(width: 12),
            _buildCompactStat('Containers', totalContainers.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactStat(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
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