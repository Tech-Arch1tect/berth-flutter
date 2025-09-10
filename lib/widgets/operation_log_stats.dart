import 'package:flutter/material.dart';
import '../models/operation_log.dart' as models;
import '../theme/app_theme.dart';

class OperationLogStatsWidget extends StatelessWidget {
  final models.OperationLogStats stats;

  const OperationLogStatsWidget({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Expanded(child: _buildStatCard(
            context,
            'Total',
            stats.totalOperations.toString(),
            Icons.list_alt,
            Theme.of(context).colorScheme.primary,
          )),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: _buildStatCard(
            context,
            'Recent',
            stats.recentOperations.toString(),
            Icons.schedule,
            Theme.of(context).colorScheme.secondary,
          )),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: _buildStatCard(
            context,
            'Success',
            stats.successfulOperations.toString(),
            Icons.check_circle,
            Theme.of(context).colorScheme.success,
          )),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: _buildStatCard(
            context,
            'Failed',
            stats.failedOperations.toString(),
            Icons.error,
            Theme.of(context).colorScheme.error,
          )),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: _buildStatCard(
            context,
            'Incomplete',
            stats.incompleteOperations.toString(),
            Icons.pending,
            Theme.of(context).colorScheme.warning,
          )),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}