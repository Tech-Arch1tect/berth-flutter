import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CollapsibleSection extends StatelessWidget {
  final String title;
  final int? count;
  final bool isExpanded;
  final bool isLoading;
  final String? error;
  final VoidCallback onToggle;
  final VoidCallback? onRefresh;
  final Widget? child;

  const CollapsibleSection({
    super.key,
    required this.title,
    this.count,
    required this.isExpanded,
    required this.isLoading,
    this.error,
    required this.onToggle,
    this.onRefresh,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Card(
        child: Column(
          children: [
            InkWell(
              onTap: onToggle,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        count != null ? '$title ($count)' : title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isExpanded && onRefresh != null)
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        iconSize: 20,
                        onPressed: onRefresh,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    if (isLoading)
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  ],
                ),
              ),
            ),
            if (isExpanded) ...[
              const Divider(height: 1),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          error!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (onRefresh != null)
                        TextButton(
                          onPressed: onRefresh,
                          child: const Text('Retry'),
                        ),
                    ],
                  ),
                )
              else if (child != null)
                child!
              else if (isLoading)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Text('No data available'),
                ),
            ],
          ],
        ),
      ),
    );
  }
}