import 'package:flutter/material.dart';
import '../models/stack.dart' hide Container;
import '../theme/app_theme.dart';

class EnvironmentVariableCard extends StatelessWidget {
  final String serviceName;
  final List<ServiceEnvironment> serviceEnvironments;

  const EnvironmentVariableCard({
    super.key,
    required this.serviceName,
    required this.serviceEnvironments,
  });

  @override
  Widget build(BuildContext context) {
    final allVariables = serviceEnvironments
        .expand((env) => env.variables)
        .toList();
    
    final composeVariables = allVariables
        .where((v) => v.source == 'compose')
        .toList();
    
    final runtimeOnlyVariables = allVariables
        .where((v) => v.source == 'runtime' && 
                     !composeVariables.any((cv) => cv.key == v.key))
        .toList();

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, allVariables.length, composeVariables.length, runtimeOnlyVariables.length),
            const SizedBox(height: 12),
            if (composeVariables.isNotEmpty) ...[
              _buildVariableSection(context, 'Compose Variables', composeVariables, Colors.blue),
              const SizedBox(height: 12),
            ],
            if (runtimeOnlyVariables.isNotEmpty) ...[
              _buildVariableSection(context, 'Runtime Only Variables', runtimeOnlyVariables, Colors.green),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int totalCount, int composeCount, int runtimeCount) {
    return Row(
      children: [
        Icon(
          Icons.code,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$totalCount variable${totalCount != 1 ? 's' : ''}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            if (composeCount > 0) ...[
              Chip(
                label: Text('$composeCount Compose'),
                labelStyle: const TextStyle(fontSize: 11),
                backgroundColor: Colors.blue.withOpacity(0.1),
                side: BorderSide(color: Colors.blue.withOpacity(0.3)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 4),
            ],
            if (runtimeCount > 0) ...[
              Chip(
                label: Text('$runtimeCount Runtime'),
                labelStyle: const TextStyle(fontSize: 11),
                backgroundColor: Colors.green.withOpacity(0.1),
                side: BorderSide(color: Colors.green.withOpacity(0.3)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildVariableSection(BuildContext context, String title, List<EnvironmentVariable> variables, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title (${variables.length})',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...variables.map((variable) => _buildVariableItem(context, variable, color)),
      ],
    );
  }

  Widget _buildVariableItem(BuildContext context, EnvironmentVariable variable, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (variable.isSensitive) ...[
                Icon(
                  Icons.lock,
                  size: 16,
                  color: Colors.amber.shade700,
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Text(
                  variable.key,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              Row(
                children: [
                  Chip(
                    label: Text(variable.source.toUpperCase()),
                    labelStyle: const TextStyle(fontSize: 10),
                    backgroundColor: color.withOpacity(0.1),
                    side: BorderSide(color: color.withOpacity(0.3)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  if (variable.isSensitive) ...[
                    const SizedBox(width: 4),
                    Chip(
                      label: const Text('SENSITIVE'),
                      labelStyle: const TextStyle(fontSize: 10),
                      backgroundColor: Colors.amber.withOpacity(0.1),
                      side: BorderSide(color: Colors.amber.withOpacity(0.3)),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                  if (variable.isFromContainer) ...[
                    const SizedBox(width: 4),
                    Chip(
                      label: const Text('ACTIVE'),
                      labelStyle: const TextStyle(fontSize: 10),
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            variable.isSensitive ? '***' : (variable.value.isEmpty ? '(empty)' : variable.value),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontFamily: 'monospace',
            ),
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}