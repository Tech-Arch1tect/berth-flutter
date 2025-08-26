import 'package:flutter/material.dart';
import '../models/stack.dart' as stack_models;

class StackStatsList extends StatelessWidget {
  final List<stack_models.ContainerStats>? containers;
  final bool isLoading;
  final String? error;

  const StackStatsList({
    super.key,
    this.containers,
    required this.isLoading,
    this.error,
  });

  String _formatBytes(int bytes) {
    if (bytes == 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    int i = 0;
    double size = bytes.toDouble();
    
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    
    return '${size.toStringAsFixed(1)} ${suffixes[i]}';
  }

  String _formatPercent(double percent) {
    return '${percent.toStringAsFixed(1)}%';
  }

  @override
  Widget build(BuildContext context) {
    // Show full loading screen only on initial load when we have no data
    if (isLoading && (containers == null || containers!.isEmpty)) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading resource statistics...'),
            ],
          ),
        ),
      );
    }

    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load resource statistics',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error!,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    if (containers == null || containers!.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 48,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No running containers found',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Show spinning icon when loading, static icon when not
              if (isLoading)
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              else
                Icon(
                  Icons.refresh,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              const SizedBox(width: 8),
              Text(
                'Real-time resource usage • Updates every 5 seconds',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: containers!.length,
            itemBuilder: (context, index) {
              final container = containers![index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              container.name,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              container.serviceName,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // CPU Usage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CPU Usage',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatPercent(container.cpuPercent),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (container.cpuPercent / 100).clamp(0.0, 1.0),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Memory Usage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Memory Usage',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${_formatBytes(container.memoryUsage)} / ${_formatBytes(container.memoryLimit)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: (container.memoryPercent / 100).clamp(0.0, 1.0),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_formatPercent(container.memoryPercent)} used',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}