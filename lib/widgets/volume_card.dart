import 'package:flutter/material.dart';
import '../models/stack.dart' hide Container;
import '../theme/app_theme.dart';

class VolumeCard extends StatelessWidget {
  final Volume volume;

  const VolumeCard({super.key, required this.volume});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 12),
            _buildVolumeInfo(context),
            if (volume.usedBy != null && volume.usedBy!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildUsedByContainers(context),
            ],
            if (volume.driverOpts != null && volume.driverOpts!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildDriverOptions(context),
            ],
            if (volume.labels != null && volume.labels!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildLabels(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.folder,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getDisplayName(volume.name),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (volume.driver != null)
                Text(
                  'Driver: ${volume.driver}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _buildStatusChip(context),
        if (volume.external == true) ...[
          const SizedBox(width: 8),
          _buildExternalChip(context),
        ],
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    return Chip(
      label: Text(
        volume.exists ? 'Active' : 'Declared',
        style: TextStyle(
          color: volume.exists
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
        ),
      ),
      backgroundColor: volume.exists
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildExternalChip(BuildContext context) {
    return Chip(
      label: Text(
        'External',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 12,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildVolumeInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildInfoRow(context, 'Status', volume.exists ? 'Active' : 'Declared'),
          if (volume.created != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(context, 'Created', _formatDate(volume.created!)),
          ],
          if (volume.scope != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(context, 'Scope', volume.scope!),
          ],
          if (volume.mountpoint != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(context, 'Mount Point', volume.mountpoint!),
          ],
        ],
      ),
    );
  }

  Widget _buildUsedByContainers(BuildContext context) {
    final usedBy = volume.usedBy!;
    return ExpansionTile(
      title: Text(
        'Used by Containers (${usedBy.length})',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      children: usedBy.map((usage) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      usage.containerName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    'Service: ${usage.serviceName}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...usage.mounts.map((mount) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Type: ',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                            Text(
                              mount.type,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                            ),
                            if (mount.readOnly == true) ...[
                              const SizedBox(width: 8),
                              Chip(
                                label: const Text('Read Only'),
                                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.onErrorContainer,
                                  fontSize: 10,
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 2),
                        _buildInfoRow(context, 'Source', mount.source),
                        const SizedBox(height: 2),
                        _buildInfoRow(context, 'Target', mount.target),
                      ],
                    ),
                  )),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDriverOptions(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Driver Options',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: volume.driverOpts!.entries
                .map((entry) => _buildInfoRow(context, entry.key, entry.value))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLabels(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Labels',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: volume.labels!.entries
              .map((entry) => Chip(
                    label: Text(
                      '${entry.key}: ${entry.value}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    side: BorderSide.none,
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'monospace',
                ),
          ),
        ),
      ],
    );
  }

  String _getDisplayName(String name) {
    if (name.startsWith('bind:')) {
      return name.substring(5);
    } else if (name.startsWith('tmpfs:')) {
      return name.substring(6);
    }
    return name;
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Invalid date';
    }
  }
}