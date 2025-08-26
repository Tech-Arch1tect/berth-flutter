import 'package:flutter/material.dart';
import '../models/stack.dart' hide Container;

class NetworkCard extends StatelessWidget {
  final Network network;

  const NetworkCard({super.key, required this.network});

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
            _buildNetworkInfo(context),
            if (network.ipam != null) ...[
              const SizedBox(height: 12),
              _buildIPAMInfo(context),
            ],
            if (network.containers != null && network.containers!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildConnectedContainers(context),
            ],
            if (network.labels != null && network.labels!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildLabels(context),
            ],
            if (network.options != null && network.options!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildOptions(context),
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
          Icons.hub,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                network.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (network.driver != null)
                Text(
                  'Driver: ${network.driver}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _buildStatusChip(context),
        if (network.external == true) ...[
          const SizedBox(width: 8),
          _buildExternalChip(context),
        ],
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    return Chip(
      label: Text(
        network.exists ? 'Active' : 'Declared',
        style: TextStyle(
          color: network.exists
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 12,
        ),
      ),
      backgroundColor: network.exists
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surfaceVariant,
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

  Widget _buildNetworkInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildInfoRow(context, 'Status', network.exists ? 'Running' : 'Not Created'),
          if (network.created != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(context, 'Created', _formatDate(network.created!)),
          ],
        ],
      ),
    );
  }

  Widget _buildIPAMInfo(BuildContext context) {
    final ipam = network.ipam!;
    return ExpansionTile(
      title: Text(
        'Network Configuration',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ipam.driver != null) _buildInfoRow(context, 'IPAM Driver', ipam.driver!),
              if (ipam.config != null && ipam.config!.isNotEmpty) ...[
                if (ipam.driver != null) const SizedBox(height: 8),
                Text(
                  'Subnets:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 4),
                ...ipam.config!.map((config) => Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (config.subnet != null)
                            Text(
                              config.subnet!,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                  ),
                            ),
                          if (config.gateway != null)
                            Text(
                              'Gateway: ${config.gateway!}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectedContainers(BuildContext context) {
    final containers = network.containers!;
    return ExpansionTile(
      title: Text(
        'Connected Containers (${containers.length})',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      children: containers.entries.map((entry) {
        final containerId = entry.key;
        final endpoint = entry.value;
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
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
                      endpoint.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    '${containerId.substring(0, 12)}...',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 4,
                children: [
                  if (endpoint.ipv4Address != null)
                    _buildNetworkDetail(context, 'IPv4', endpoint.ipv4Address!),
                  if (endpoint.macAddress != null)
                    _buildNetworkDetail(context, 'MAC', endpoint.macAddress!),
                  if (endpoint.ipv6Address != null)
                    _buildNetworkDetail(context, 'IPv6', endpoint.ipv6Address!),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNetworkDetail(BuildContext context, String label, String value) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: '$label: ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontFamily: 'monospace',
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
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
          children: network.labels!.entries
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

  Widget _buildOptions(BuildContext context) {
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
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: network.options!.entries
                .map((entry) => _buildInfoRow(context, entry.key, entry.value))
                .toList(),
          ),
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

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Invalid date';
    }
  }
}