import 'dart:async';
import 'package:flutter/material.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../services/stack_service.dart';
import '../widgets/stack_stats_list.dart';
import '../theme/app_theme.dart';

class StackStatsModal extends StatefulWidget {
  final int serverId;
  final String stackName;
  final StackService stackService;

  const StackStatsModal({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.stackService,
  });

  @override
  State<StackStatsModal> createState() => _StackStatsModalState();
}

class _StackStatsModalState extends State<StackStatsModal> {
  berth_api.StackStatsResponse? _stackStats;
  bool _isStatsLoading = false;
  String? _statsError;
  Timer? _statsTimer;

  @override
  void initState() {
    super.initState();
    _loadStackStats();
    _startStatsTimer();
  }

  @override
  void dispose() {
    _statsTimer?.cancel();
    super.dispose();
  }

  void _startStatsTimer() {
    _statsTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        _loadStackStats();
      }
    });
  }

  Future<void> _loadStackStats({bool force = false}) async {
    // Only skip if already loading (to prevent concurrent requests)
    if (_isStatsLoading && !force) return;

    if (mounted) {
      setState(() {
        _isStatsLoading = true;
        _statsError = null;
      });
    }

    try {
      final stats = await widget.stackService.getStackStats(
        widget.serverId,
        widget.stackName,
      );
      if (mounted) {
        setState(() {
          _stackStats = stats;
          _isStatsLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _statsError = e.toString();
          _isStatsLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Container Statistics',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => _loadStackStats(force: true),
                      tooltip: 'Refresh statistics',
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: _stackStats != null
                      ? StackStatsList(
                          containers: _stackStats!.containers,
                          isLoading: _isStatsLoading,
                          error: _statsError,
                        )
                      : _isStatsLoading
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(AppSpacing.xl),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : _statsError != null
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(AppSpacing.lg),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: Theme.of(context).colorScheme.error,
                                          size: 48,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Failed to load statistics',
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          _statsError!,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        FilledButton(
                                          onPressed: () => _loadStackStats(force: true),
                                          child: const Text('Retry'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('No statistics available'),
                                ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}