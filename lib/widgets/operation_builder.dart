import 'package:flutter/material.dart';
import '../models/operation.dart';
import '../models/stack.dart' as stack_models;
import '../services/operations_service.dart';
import '../theme/app_theme.dart';

class OperationBuilder extends StatefulWidget {
  final List<stack_models.ComposeService> services;
  final Function(OperationRequest) onOperationStart;
  final bool isRunning;

  const OperationBuilder({
    super.key,
    required this.services,
    required this.onOperationStart,
    required this.isRunning,
  });

  @override
  State<OperationBuilder> createState() => _OperationBuilderState();
}

class _OperationBuilderState extends State<OperationBuilder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCommand = 'up';
  final Set<String> _selectedOptions = {};
  final Set<String> _selectedServices = {};

  final List<String> _availableCommands = [
    'up',
    'down',
    'start', 
    'stop',
    'restart',
    'pull',
    'create-archive',
    'extract-archive'
  ];

  final Map<String, List<String>> _availableOptions = {
    'up': ['--build', '--no-deps', '--force-recreate', '--no-recreate'],
    'down': ['-v', '--remove-orphans', '--rmi local', '--rmi all'],
    'start': [],
    'stop': ['-t 10', '-t 30'],
    'restart': ['-t 10', '-t 30'],
    'pull': ['--ignore-pull-failures'],
    'create-archive': ['--format zip', '--format tar', '--format tar.gz'],
    'extract-archive': ['--overwrite', '--create-dirs'],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          margin: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
            tabs: const [
              Tab(text: 'Quick Actions'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildPresetsTab(),
              _buildCustomTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPresetsTab() {
    final presets = OperationsService.getDefaultPresets();
    
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: presets.map((preset) => _buildPresetCard(preset)).toList(),
    );
  }

  Widget _buildPresetCard(OperationPreset preset) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;
    
    switch (preset.variant) {
      case OperationVariant.success:
        backgroundColor = Theme.of(context).colorScheme.success.withValues(alpha: 0.1);
        textColor = Theme.of(context).colorScheme.success;
        borderColor = Theme.of(context).colorScheme.success.withValues(alpha: 0.3);
        break;
      case OperationVariant.danger:
        backgroundColor = Theme.of(context).colorScheme.error.withValues(alpha: 0.1);
        textColor = Theme.of(context).colorScheme.error;
        borderColor = Theme.of(context).colorScheme.error.withValues(alpha: 0.3);
        break;
      case OperationVariant.warning:
        backgroundColor = Theme.of(context).colorScheme.warning.withValues(alpha: 0.1);
        textColor = Theme.of(context).colorScheme.warning;
        borderColor = Theme.of(context).colorScheme.warning.withValues(alpha: 0.3);
        break;
      case OperationVariant.primary:
        backgroundColor = Theme.of(context).colorScheme.primary.withValues(alpha: 0.1);
        textColor = Theme.of(context).colorScheme.primary;
        borderColor = Theme.of(context).colorScheme.primary.withValues(alpha: 0.3);
        break;
      case OperationVariant.secondary:
      default:
        backgroundColor = Theme.of(context).colorScheme.surfaceContainerHighest;
        textColor = Theme.of(context).colorScheme.onSurface;
        borderColor = Theme.of(context).colorScheme.outlineVariant;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: widget.isRunning ? null : () => _runPreset(preset),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              _getPresetIcon(preset.icon, textColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      preset.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      preset.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: textColor.withValues(alpha: 0.8),
                      ),
                    ),
                    if (preset.options.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Options: ${preset.options.join(', ')}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: textColor.withValues(alpha: 0.7),
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: textColor.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPresetIcon(String? iconName, Color color) {
    IconData icon;
    switch (iconName) {
      case 'play_arrow':
        icon = Icons.play_arrow;
        break;
      case 'build':
        icon = Icons.build;
        break;
      case 'stop':
        icon = Icons.stop;
        break;
      case 'refresh':
        icon = Icons.refresh;
        break;
      case 'download':
        icon = Icons.download;
        break;
      case 'pause':
        icon = Icons.pause;
        break;
      case 'play_circle':
        icon = Icons.play_circle;
        break;
      default:
        icon = Icons.settings;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }

  void _runPreset(OperationPreset preset) {
    final request = OperationRequest(
      command: preset.command,
      options: preset.options,
      services: [], 
    );
    widget.onOperationStart(request);
  }

  Widget _buildCustomTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommandSection(),
          const SizedBox(height: 24),
          _buildOptionsSection(),
          const SizedBox(height: 24),
          _buildServicesSection(),
          const SizedBox(height: 32),
          _buildRunButton(),
        ],
      ),
    );
  }

  Widget _buildCommandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Command',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availableCommands.map((command) {
            final isSelected = _selectedCommand == command;
            return FilterChip(
              label: Text(command),
              selected: isSelected,
              onSelected: widget.isRunning ? null : (selected) {
                if (selected) {
                  setState(() {
                    _selectedCommand = command;
                    _selectedOptions.clear();
                  });
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOptionsSection() {
    final options = _availableOptions[_selectedCommand] ?? [];
    if (options.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Options',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = _selectedOptions.contains(option);
            return FilterChip(
              label: Text(
                option,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
              selected: isSelected,
              onSelected: widget.isRunning ? null : (selected) {
                setState(() {
                  if (selected) {
                    _selectedOptions.add(option);
                  } else {
                    _selectedOptions.remove(option);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    if (widget.services.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Services (leave empty for all)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_selectedServices.isNotEmpty)
              TextButton(
                onPressed: widget.isRunning ? null : () {
                  setState(() {
                    _selectedServices.clear();
                  });
                },
                child: const Text('Clear all'),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.services.map((service) {
            final isSelected = _selectedServices.contains(service.name);
            return FilterChip(
              label: Text(service.name),
              selected: isSelected,
              onSelected: widget.isRunning ? null : (selected) {
                setState(() {
                  if (selected) {
                    _selectedServices.add(service.name);
                  } else {
                    _selectedServices.remove(service.name);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRunButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: widget.isRunning ? null : _runCustomOperation,
        icon: widget.isRunning 
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.play_arrow),
        label: Text(
          widget.isRunning 
            ? 'Running...'
            : 'Run $_selectedCommand${_selectedOptions.isNotEmpty ? ' ${_selectedOptions.join(' ')}' : ''}',
          style: const TextStyle(fontFamily: 'monospace'),
        ),
      ),
    );
  }

  void _runCustomOperation() {
    final request = OperationRequest(
      command: _selectedCommand,
      options: _selectedOptions.toList(),
      services: _selectedServices.toList(),
    );
    widget.onOperationStart(request);
  }
}