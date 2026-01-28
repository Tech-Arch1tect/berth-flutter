import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../../services/role_service.dart';
import '../../services/berth_api_provider.dart';
import '../../theme/app_theme.dart';

class RoleStackPermissionsScreen extends StatefulWidget {
  final int roleId;

  const RoleStackPermissionsScreen({
    super.key,
    required this.roleId,
  });

  @override
  State<RoleStackPermissionsScreen> createState() => _RoleStackPermissionsScreenState();
}

class _RoleStackPermissionsScreenState extends State<RoleStackPermissionsScreen> {
  late RoleService roleService;
  berth_api.ListRoleStackPermissionsData? data;
  bool isLoading = true;
  String? error;
  Set<int> deletingRules = {};


  bool showAddRuleModal = false;
  int? selectedServerId;
  Set<int> selectedPermissions = {};
  String stackPattern = '*';
  bool isCreatingRule = false;


  bool showAddToPatternModal = false;
  int? addToPatternServerId;
  String? addToPatternStackPattern;
  Set<int> addToPatternPermissions = {};
  bool isAddingToPattern = false;

  @override
  void initState() {
    super.initState();
    roleService = RoleService(context.read<BerthApiProvider>());
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      data = await roleService.getRoleStackPermissions(widget.roleId);
    } catch (e) {
      error = 'Failed to load data: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _deleteRule(int ruleId) async {
    setState(() {
      deletingRules.add(ruleId);
    });

    try {
      await roleService.deleteStackPermission(roleId: widget.roleId, permissionId: ruleId);
      await _loadData(); 
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete permission rule: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      setState(() {
        deletingRules.remove(ruleId);
      });
    }
  }

  void _showAddToPatternModal(int serverId, String stackPattern) {
    setState(() {
      showAddToPatternModal = true;
      addToPatternServerId = serverId;
      addToPatternStackPattern = stackPattern;
      addToPatternPermissions.clear();
    });
  }

  List<berth_api.PermissionInfo> _getAvailablePermissionsForPattern(int serverId, String stackPattern) {
    if (data == null) return [];

    final existingRules = data!.permissionRules.where((rule) =>
      rule.serverId == serverId && rule.stackPattern == stackPattern
    ).toList();

    final existingPermissionIds = existingRules.map((rule) => rule.permissionId).toSet();

    return data!.permissions.where((permission) =>
      !existingPermissionIds.contains(permission.id)
    ).toList();
  }

  Future<void> _addToPattern() async {
    if (addToPatternServerId == null || addToPatternStackPattern == null || addToPatternPermissions.isEmpty) return;

    setState(() {
      isAddingToPattern = true;
    });

    try {
      
      for (final permissionId in addToPatternPermissions) {
        await roleService.createStackPermission(
          roleId: widget.roleId,
          serverId: addToPatternServerId!,
          permissionId: permissionId,
          stackPattern: addToPatternStackPattern!,
        );
      }
      
      final addedCount = addToPatternPermissions.length;
      
      
      setState(() {
        showAddToPatternModal = false;
        addToPatternServerId = null;
        addToPatternStackPattern = null;
        addToPatternPermissions.clear();
      });
      
      await _loadData(); 
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$addedCount permission(s) added to pattern'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add permissions to pattern: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      setState(() {
        isAddingToPattern = false;
      });
    }
  }

  Future<void> _createRule() async {
    if (selectedServerId == null || selectedPermissions.isEmpty) return;

    setState(() {
      isCreatingRule = true;
    });

    try {
      
      for (final permissionId in selectedPermissions) {
        await roleService.createStackPermission(
          roleId: widget.roleId,
          serverId: selectedServerId!,
          permissionId: permissionId,
          stackPattern: stackPattern.isEmpty ? '*' : stackPattern,
        );
      }
      
      
      setState(() {
        showAddRuleModal = false;
        selectedServerId = null;
        selectedPermissions.clear();
        stackPattern = '*';
      });
      
      await _loadData(); 
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${selectedPermissions.length} permission rule(s) created successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create permission rule: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      setState(() {
        isCreatingRule = false;
      });
    }
  }

  Map<String, List<berth_api.StackPermissionRule>> _groupRulesByServerAndPattern() {
    if (data == null) return {};

    final grouped = <String, List<berth_api.StackPermissionRule>>{};
    for (final rule in data!.permissionRules) {
      final serverName = data!.servers.firstWhere((s) => s.id == rule.serverId).name;
      final key = '$serverName - ${rule.stackPattern}';

      if (!grouped.containsKey(key)) {
        grouped[key] = [];
      }
      grouped[key]!.add(rule);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data?.role.name != null ? '${data!.role.name} Stack Permissions' : 'Stack Permissions'),
        leading: Navigator.canPop(context) 
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                showAddRuleModal = true;
              });
            },
            tooltip: 'Add Permission Rule',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
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
              error!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loadData,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (data == null) {
      return const Center(child: Text('No data available'));
    }

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildPermissionRules(),
              const SizedBox(height: 24),
              _buildPatternExamples(),
            ],
          ),
        ),
        if (showAddRuleModal) _buildAddRuleModal(),
        if (showAddToPatternModal) _buildAddToPatternModal(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.security,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data!.role.name} Stack Permissions',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage pattern-based stack permissions',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionRules() {
    final groupedRules = _groupRulesByServerAndPattern();
    
    if (groupedRules.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.rule,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  'No permission rules',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Get started by creating your first permission rule for this role.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showAddRuleModal = true;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Permission Rule'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Permission Rules',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...groupedRules.entries.map((entry) => _buildGroupedRuleCard(entry.key, entry.value)),
      ],
    );
  }

  Widget _buildGroupedRuleCard(String groupTitle, List<berth_api.StackPermissionRule> rules) {
    final firstRule = rules.first;
    final availablePermissions = _getAvailablePermissionsForPattern(firstRule.serverId, firstRule.stackPattern);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    groupTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (availablePermissions.isNotEmpty)
                  TextButton.icon(
                    onPressed: () => _showAddToPatternModal(firstRule.serverId, firstRule.stackPattern),
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Add', style: TextStyle(fontSize: 12)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: rules.map((rule) => _buildPermissionChip(rule)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionChip(berth_api.StackPermissionRule rule) {
    final permission = data!.permissions.firstWhere((p) => p.id == rule.permissionId);
    final isDeleting = deletingRules.contains(rule.id);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isDeleting ? Colors.grey.withValues(alpha: 0.3) : Colors.grey.shade600,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDeleting) ...[
            const SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            permission.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: isDeleting ? null : () => _deleteRule(rule.id),
            child: Icon(
              Icons.close,
              size: 14,
              color: isDeleting ? Colors.grey : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternExamples() {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Pattern Examples',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Common patterns:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildPatternExample('*', 'All stacks'),
            _buildPatternExample('*dev*', 'Stacks containing "dev"'),
            _buildPatternExample('*prod*', 'Stacks containing "prod"'),
            _buildPatternExample('app*', 'Stacks starting with "app"'),
            _buildPatternExample('*-staging', 'Stacks ending with "-staging"'),
            const SizedBox(height: 12),
            Text(
              'Complex patterns:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            _buildPatternExample('*dev*test*', 'Contains "dev" then "test"'),
            _buildPatternExample('api*staging*v1*', 'Complex matching'),
            const SizedBox(height: 12),
            Text(
              'Pattern matching is case-insensitive. Use multiple rules for different permissions per pattern.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatternExample(String pattern, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              pattern,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddRuleModal() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(AppSpacing.lg),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Permission Rule',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showAddRuleModal = false;
                        selectedServerId = null;
                        selectedPermissions.clear();
                        stackPattern = '*';
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              
              Text(
                'Server',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                value: selectedServerId,
                decoration: const InputDecoration(
                  hintText: 'Select a server',
                  border: OutlineInputBorder(),
                ),
                items: data!.servers.map((server) {
                  return DropdownMenuItem(
                    value: server.id,
                    child: Text(server.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedServerId = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              
              
              Text(
                'Permissions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  children: data!.permissions.map((permission) {
                    return CheckboxListTile(
                      value: selectedPermissions.contains(permission.id),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedPermissions.add(permission.id);
                          } else {
                            selectedPermissions.remove(permission.id);
                          }
                        });
                      },
                      title: Text(permission.name),
                      subtitle: Text(permission.description),
                      dense: true,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              
              
              Text(
                'Stack Pattern',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: stackPattern,
                decoration: const InputDecoration(
                  hintText: '* (all stacks)',
                  border: OutlineInputBorder(),
                  helperText: 'Use * for all stacks, *dev* for stacks containing "dev", etc.',
                ),
                onChanged: (value) {
                  setState(() {
                    stackPattern = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAddRuleModal = false;
                        selectedServerId = null;
                        selectedPermissions.clear();
                        stackPattern = '*';
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: isCreatingRule || selectedServerId == null || selectedPermissions.isEmpty ? null : _createRule,
                    child: isCreatingRule
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Create Rule'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddToPatternModal() {
    final availablePermissions = _getAvailablePermissionsForPattern(
      addToPatternServerId!, 
      addToPatternStackPattern!
    );
    final serverName = data!.servers.firstWhere((s) => s.id == addToPatternServerId).name;

    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(AppSpacing.lg),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Permissions to Pattern',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showAddToPatternModal = false;
                        addToPatternServerId = null;
                        addToPatternStackPattern = null;
                        addToPatternPermissions.clear();
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Server: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: serverName),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Pattern: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: addToPatternStackPattern!,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              
              Text(
                'Available Permissions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              
              if (availablePermissions.isEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'All permissions are already assigned to this pattern.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ] else ...[
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView(
                    children: availablePermissions.map((permission) {
                      return CheckboxListTile(
                        value: addToPatternPermissions.contains(permission.id),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              addToPatternPermissions.add(permission.id);
                            } else {
                              addToPatternPermissions.remove(permission.id);
                            }
                          });
                        },
                        title: Text(permission.name),
                        subtitle: Text(permission.description),
                        dense: true,
                      );
                    }).toList(),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAddToPatternModal = false;
                        addToPatternServerId = null;
                        addToPatternStackPattern = null;
                        addToPatternPermissions.clear();
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: isAddingToPattern || addToPatternPermissions.isEmpty ? null : _addToPattern,
                    child: isAddingToPattern
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Add Permissions'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}