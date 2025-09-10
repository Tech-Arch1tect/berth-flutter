import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OperationLogFilters extends StatelessWidget {
  final String searchTerm;
  final String selectedStatus;
  final String selectedCommand;
  final List<String> availableCommands;
  final Function(String) onSearchChanged;
  final Function(String?) onStatusChanged;
  final Function(String?) onCommandChanged;
  final VoidCallback onClearFilters;

  const OperationLogFilters({
    super.key,
    required this.searchTerm,
    required this.selectedStatus,
    required this.selectedCommand,
    required this.availableCommands,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onCommandChanged,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppSpacing.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.filter_list,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Filters',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (_hasActiveFilters())
                  TextButton.icon(
                    onPressed: onClearFilters,
                    icon: const Icon(Icons.clear_all, size: 16),
                    label: const Text('Clear All'),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search operations...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchTerm.isNotEmpty
                  ? IconButton(
                      onPressed: () => onSearchChanged(''),
                      icon: const Icon(Icons.clear),
                    )
                  : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedStatus.isEmpty ? null : selectedStatus,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('All Statuses')),
                      DropdownMenuItem(value: 'complete', child: Text('Complete')),
                      DropdownMenuItem(value: 'incomplete', child: Text('Incomplete')),
                      DropdownMenuItem(value: 'success', child: Text('Successful')),
                      DropdownMenuItem(value: 'failed', child: Text('Failed')),
                    ],
                    onChanged: onStatusChanged,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedCommand.isEmpty ? null : selectedCommand,
                    decoration: InputDecoration(
                      labelText: 'Command',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All Commands')),
                      ...availableCommands.map(
                        (command) => DropdownMenuItem(
                          value: command,
                          child: Text(command),
                        ),
                      ),
                    ],
                    onChanged: onCommandChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _hasActiveFilters() {
    return searchTerm.isNotEmpty ||
           selectedStatus.isNotEmpty ||
           selectedCommand.isNotEmpty;
  }
}