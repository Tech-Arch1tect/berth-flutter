import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../../services/operation_log_service.dart';
import '../../widgets/operation_log_stats.dart';
import '../../widgets/operation_log_filters.dart';
import '../../widgets/operation_log_list.dart';
import '../../widgets/operation_log_detail_modal.dart';
import '../../theme/app_theme.dart';

class AdminOperationLogsScreen extends StatefulWidget {
  const AdminOperationLogsScreen({super.key});

  @override
  State<AdminOperationLogsScreen> createState() => _AdminOperationLogsScreenState();
}

class _AdminOperationLogsScreenState extends State<AdminOperationLogsScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  
  berth_api.PaginatedOperationLogsResponse? _operationLogs;
  berth_api.OperationLogStatsResponse? _stats;
  berth_api.OperationLogDetailResponse? _selectedLogDetail;
  
  int _currentPage = 1;
  String _searchTerm = '';
  String _selectedStatus = '';
  String _selectedCommand = '';
  
  Set<String> _availableCommands = {};

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    await Future.wait([
      _loadOperationLogs(),
      _loadStats(),
    ]);

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadOperationLogs() async {
    setState(() {
      _isLoading = true;
    });

    final operationLogService = Provider.of<OperationLogService>(context, listen: false);
    
    try {
      final result = await operationLogService.getAdminOperationLogs(
        page: _currentPage,
        searchTerm: _searchTerm.isNotEmpty ? _searchTerm : null,
        status: _selectedStatus.isNotEmpty ? _selectedStatus : null,
        command: _selectedCommand.isNotEmpty ? _selectedCommand : null,
      );

      if (result != null) {
        setState(() {
          _operationLogs = result;
          _updateAvailableCommands(result.data.data);
          _errorMessage = '';
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load operation logs';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error loading operation logs: $e';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadStats() async {
    final operationLogService = Provider.of<OperationLogService>(context, listen: false);
    
    try {
      final stats = await operationLogService.getAdminOperationLogStats();
      setState(() {
        _stats = stats;
      });
    } catch (e) {
      // Stats loading failure is not critical
    }
  }

  void _updateAvailableCommands(List<berth_api.OperationLogInfo> logs) {
    final commands = logs.map((log) => log.command).toSet();
    setState(() {
      _availableCommands.addAll(commands);
    });
  }

  Future<void> _loadLogDetail(berth_api.OperationLogInfo log) async {
    final operationLogService = Provider.of<OperationLogService>(context, listen: false);
    
    try {
      final detail = await operationLogService.getAdminOperationLogDetail(log.id);
      if (detail != null) {
        setState(() {
          _selectedLogDetail = detail;
        });
        _showLogDetailModal();
      }
    } catch (e, stackTrace) {
      debugPrint('[AdminOperationLogsScreen] Failed to load operation details: $e');
      debugPrint('[AdminOperationLogsScreen] Stack trace: $stackTrace');
      _showErrorSnackBar('Failed to load operation details: $e');
    }
  }

  void _showLogDetailModal() {
    showDialog(
      context: context,
      builder: (context) => OperationLogDetailModal(
        logDetail: _selectedLogDetail?.data,
        showUser: true, // Admin can see user information
      ),
    ).then((_) {
      setState(() {
        _selectedLogDetail = null;
      });
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _onSearchChanged(String searchTerm) {
    setState(() {
      _searchTerm = searchTerm;
      _currentPage = 1;
    });
    _loadOperationLogs();
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _selectedStatus = status ?? '';
      _currentPage = 1;
    });
    _loadOperationLogs();
  }

  void _onCommandChanged(String? command) {
    setState(() {
      _selectedCommand = command ?? '';
      _currentPage = 1;
    });
    _loadOperationLogs();
  }

  void _onClearFilters() {
    setState(() {
      _searchTerm = '';
      _selectedStatus = '';
      _selectedCommand = '';
      _currentPage = 1;
    });
    _loadOperationLogs();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    _loadOperationLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Operation Logs'),
        actions: [
          IconButton(
            onPressed: _loadInitialData,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadInitialData,
        child: Column(
          children: [
            if (_stats != null)
              OperationLogStatsWidget(stats: _stats!.data),
            
            OperationLogFilters(
              searchTerm: _searchTerm,
              selectedStatus: _selectedStatus,
              selectedCommand: _selectedCommand,
              availableCommands: _availableCommands.toList()..sort(),
              onSearchChanged: _onSearchChanged,
              onStatusChanged: _onStatusChanged,
              onCommandChanged: _onCommandChanged,
              onClearFilters: _onClearFilters,
            ),
            
            if (_errorMessage.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(AppSpacing.lg),
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        _errorMessage,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
            Expanded(
              child: OperationLogList(
                logs: _operationLogs?.data.data ?? [],
                loading: _isLoading,
                pagination: _operationLogs?.data.pagination,
                showUser: true, // Admin can see user information
                onTap: _loadLogDetail,
                onPageChanged: _onPageChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}