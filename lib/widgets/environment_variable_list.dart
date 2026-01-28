import 'package:flutter/material.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'environment_variable_card.dart';

class EnvironmentVariableList extends StatelessWidget {
  final Map<String, List<berth_api.ServiceEnvironment>>? environmentData;
  final bool isLoading;
  final String? error;

  const EnvironmentVariableList({
    super.key,
    this.environmentData,
    this.isLoading = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
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
              'Error loading environment variables',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (environmentData == null || environmentData!.isEmpty) {
      return _buildEmptyState(context, 'No environment variables found', 'This stack doesn\'t have any environment variables configured.');
    }

    final servicesWithVariables = environmentData!.entries
        .where((entry) => entry.value.any((env) => env.variables.isNotEmpty))
        .toList();

    if (servicesWithVariables.isEmpty) {
      return _buildEmptyState(context, 'No environment variables found', 'This stack doesn\'t have any environment variables configured.');
    }

    servicesWithVariables.sort((a, b) => a.key.compareTo(b.key));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: servicesWithVariables.map((entry) {
        return EnvironmentVariableCard(
          serviceName: entry.key,
          serviceEnvironments: entry.value,
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState(BuildContext context, String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.code_off,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}