import 'dart:async';
import 'package:flutter/material.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../services/logs_service.dart';
import '../theme/app_theme.dart';

class LogsViewer extends StatefulWidget {
  final int serverId;
  final String stackName;
  final LogsService logsService;
  final List<berth_api.Container>? containers;

  const LogsViewer({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.logsService,
    this.containers,
  });

  @override
  State<LogsViewer> createState() => _LogsViewerState();
}

class _LogsViewerState extends State<LogsViewer> {
  List<berth_api.LogEntry> _logs = [];
  bool _isLoading = false;
  String? _error;
  bool _autoRefresh = false;
  bool _showTimestamps = true;
  String _searchTerm = '';
  String _levelFilter = 'all';
  String _selectedContainer = '';
  int _tail = 100;
  String _since = '';
  Timer? _refreshTimer;

  final List<int> _tailOptions = [50, 100, 500, 1000];

  @override
  void initState() {
    super.initState();
    _loadLogs();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadLogs() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      berth_api.LogsResponse response;
      
      if (_selectedContainer.isNotEmpty) {
        response = await widget.logsService.getContainerLogs(
          serverId: widget.serverId,
          stackName: widget.stackName,
          containerName: _selectedContainer,
          tail: _tail,
          since: _since.isEmpty ? null : _since,
          timestamps: _showTimestamps,
        );
      } else {
        response = await widget.logsService.getStackLogs(
          serverId: widget.serverId,
          stackName: widget.stackName,
          tail: _tail,
          since: _since.isEmpty ? null : _since,
          timestamps: _showTimestamps,
        );
      }

      setState(() {
        _logs = response.data.logs;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _logs = [];
        _error = e.toString();
        _isLoading = false;
      });
    }
  }


  List<berth_api.LogEntry> get _filteredLogs {
    return _logs.where((log) {
      if (_searchTerm.isNotEmpty && 
          !log.message.toLowerCase().contains(_searchTerm.toLowerCase())) {
        return false;
      }
      
      if (_levelFilter != 'all' && log.level != _levelFilter) {
        return false;
      }
      
      return true;
    }).toList();
  }

  Color _getLogLevelColor(String? level) {
    switch (level?.toLowerCase()) {
      case 'error':
        return Colors.red;
      case 'warn':
        return Colors.orange;
      case 'info':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    return timestamp.toLocal().toString().substring(11, 19);
  }

  String? _extractLogTimestamp(String message) {
    final patterns = [
      RegExp(r'(\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2})'),
      RegExp(r'(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d+)?(?:Z|[+-]\d{2}:\d{2})?)'),
      RegExp(r'^(\d{2}:\d{2}:\d{2})'),
    ];

    for (final pattern in patterns) {
      final match = pattern.firstMatch(message);
      if (match != null) {
        return match.group(1);
      }
    }
    return null;
  }

  String _cleanLogMessage(String message) {
    final patterns = [
      RegExp(r'\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2} '),
      RegExp(r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d+)?(?:Z|[+-]\d{2}:\d{2})? '),
      RegExp(r'^\d{2}:\d{2}:\d{2} '),
    ];

    String cleaned = message;
    for (final pattern in patterns) {
      cleaned = cleaned.replaceFirst(pattern, '');
    }
    return cleaned;
  }

  void _showSettingsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search logs',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() => _searchTerm = value);
                  setSheetState(() {});
                },
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Show timestamps'),
                value: _showTimestamps,
                onChanged: (value) {
                  setState(() => _showTimestamps = value);
                  setSheetState(() {});
                  _loadLogs();
                },
              ),
              SwitchListTile(
                title: const Text('Auto refresh (5s)'),
                value: _autoRefresh,
                onChanged: (value) {
                  setState(() => _autoRefresh = value);
                  setSheetState(() {});
                  if (_autoRefresh) {
                    _refreshTimer = Timer.periodic(const Duration(seconds: 5), (_) {
                      _loadLogs();
                    });
                  } else {
                    _refreshTimer?.cancel();
                  }
                },
              ),
              
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _logs.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null && _logs.isEmpty) {
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
              'Error loading logs',
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
              onPressed: _loadLogs,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final filteredLogs = _filteredLogs;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<int>(
                        value: _tail,
                        isDense: true,
                        underline: const SizedBox(),
                        items: _tailOptions.map((tail) => DropdownMenuItem(
                          value: tail,
                          child: Text('$tail'),
                        )).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _tail = value);
                            _loadLogs();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        value: _since,
                        isDense: true,
                        underline: const SizedBox(),
                        items: [
                          const DropdownMenuItem(value: '', child: Text('All')),
                          const DropdownMenuItem(value: '5m', child: Text('5m')),
                          const DropdownMenuItem(value: '1h', child: Text('1h')),
                          const DropdownMenuItem(value: '24h', child: Text('24h')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _since = value);
                            _loadLogs();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        value: _levelFilter,
                        isDense: true,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(value: 'all', child: Text('All')),
                          DropdownMenuItem(value: 'error', child: Text('Error')),
                          DropdownMenuItem(value: 'warn', child: Text('Warn')),
                          DropdownMenuItem(value: 'info', child: Text('Info')),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _levelFilter = value);
                          }
                        },
                      ),
                    ),
                    
                    const Spacer(),
                    IconButton(
                      onPressed: _isLoading ? null : _loadLogs,
                      icon: _isLoading 
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.refresh),
                      tooltip: 'Refresh logs',
                    ),
                    IconButton(
                      onPressed: () => _showSettingsSheet(context),
                      icon: const Icon(Icons.tune),
                      tooltip: 'More options',
                    ),
                  ],
                ),
                if (widget.containers != null && widget.containers!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedContainer,
                      isDense: true,
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: const Text('Select container'),
                      items: [
                        const DropdownMenuItem(
                          value: '',
                          child: Text('All containers'),
                        ),
                        ...widget.containers!.map((container) => DropdownMenuItem(
                          value: container.name,
                          child: Text(
                            container.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedContainer = value);
                          _loadLogs();
                        }
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverFillRemaining(
          child: Card(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.terminal,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _selectedContainer.isEmpty
                                ? widget.stackName
                                : _selectedContainer,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Status indicator
                          if (_autoRefresh)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.sync, size: 12, color: Colors.green.shade700),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Auto',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      if (_searchTerm.isNotEmpty || _levelFilter != 'all' || _since.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt,
                                size: 12,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  [
                                    if (_searchTerm.isNotEmpty) 'search: "$_searchTerm"',
                                    if (_levelFilter != 'all') 'level: $_levelFilter',
                                    if (_since.isNotEmpty) 'since: $_since',
                                  ].join(' • '),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: filteredLogs.isEmpty
                      ? const Center(
                          child: Text(
                            'No logs available',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'monospace',
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredLogs.length,
                          itemBuilder: (context, index) {
                            final log = filteredLogs[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: SelectableText.rich(
                                TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    if (_showTimestamps) ...[
                                      TextSpan(
                                        text: '${_extractLogTimestamp(log.message) ?? _formatTimestamp(log.timestamp)} ',
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                    if (log.source_.isNotEmpty) ...[
                                      TextSpan(
                                        text: '[${log.source_}] ',
                                        style: const TextStyle(color: Colors.cyan),
                                      ),
                                    ],
                                    if (log.level != null) ...[
                                      TextSpan(
                                        text: '${log.level!.toUpperCase()} ',
                                        style: TextStyle(
                                          color: _getLogLevelColor(log.level),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                    TextSpan(text: _cleanLogMessage(log.message)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}