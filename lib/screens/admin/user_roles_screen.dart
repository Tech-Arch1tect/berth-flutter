import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/api_client.dart';
import '../../models/user.dart';
import '../../models/role.dart';
import '../../widgets/app_drawer.dart';

class UserRolesScreen extends StatefulWidget {
  final int userId;
  final String username;

  const UserRolesScreen({
    super.key,
    required this.userId,
    required this.username,
  });

  @override
  State<UserRolesScreen> createState() => _UserRolesScreenState();
}

class _UserRolesScreenState extends State<UserRolesScreen> {
  User? user;
  List<Role> allRoles = [];
  bool isLoading = true;
  bool isProcessing = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadUserRoles();
  }

  Future<void> _loadUserRoles() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      final apiClient = context.read<ApiClient>();
      final response = await apiClient.get('/api/v1/admin/users/${widget.userId}/roles');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        user = User.fromJson(data['user']);
        allRoles = (data['all_roles'] as List<dynamic>)
            .map((json) => Role.fromJson(json))
            .toList();
      } else {
        error = 'Failed to load user roles (${response.statusCode})';
      }
    } catch (e) {
      error = 'Network error: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _assignRole(int roleId) async {
    if (isProcessing) return;

    setState(() {
      isProcessing = true;
    });

    try {
      final apiClient = context.read<ApiClient>();
      final response = await apiClient.post(
        '/api/v1/admin/users/assign-role',
        body: {
          'user_id': widget.userId,
          'role_id': roleId,
        },
      );

      if (response.statusCode == 200) {
        await _loadUserRoles();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Role assigned successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to assign role (${response.statusCode})'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Network error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

  Future<void> _revokeRole(int roleId) async {
    if (isProcessing) return;

    setState(() {
      isProcessing = true;
    });

    try {
      final apiClient = context.read<ApiClient>();
      final response = await apiClient.post(
        '/api/v1/admin/users/revoke-role',
        body: {
          'user_id': widget.userId,
          'role_id': roleId,
        },
      );

      if (response.statusCode == 200) {
        await _loadUserRoles();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Role revoked successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to revoke role (${response.statusCode})'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Network error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

  List<Role> get userRoles => user?.roles ?? [];
  List<int> get userRoleIds => userRoles.map((role) => role.id).toList();
  List<Role> get availableRoles => allRoles.where((role) => !userRoleIds.contains(role.id)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage ${widget.username}\'s Roles'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back to Users',
        ),
      ),
      drawer: const AppDrawer(currentRoute: '/admin/users'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.manage_accounts,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage User Roles',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Managing roles for ${widget.username}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (isLoading) _buildLoadingState(),
            if (error != null) _buildErrorState(),
            if (!isLoading && error == null && user != null) ...[
              _buildCurrentRoles(),
              const SizedBox(height: 24),
              _buildAvailableRoles(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(48),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildErrorState() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(48),
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
              onPressed: _loadUserRoles,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentRoles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Roles',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          child: userRoles.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'No roles assigned',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              : Column(
                  children: userRoles.map((role) => ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.verified_user,
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      role.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                    subtitle: Text(role.description),
                    trailing: ElevatedButton.icon(
                      onPressed: isProcessing ? null : () => _revokeRole(role.id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[100],
                        foregroundColor: Colors.red[800],
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      icon: const Icon(Icons.remove_circle_outline, size: 16),
                      label: const Text('Remove', style: TextStyle(fontSize: 12)),
                    ),
                  )).toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildAvailableRoles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Roles',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          child: availableRoles.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'All roles assigned',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              : Column(
                  children: availableRoles.map((role) => ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.person_add,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      role.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    ),
                    subtitle: Text(role.description),
                    trailing: ElevatedButton.icon(
                      onPressed: isProcessing ? null : () => _assignRole(role.id),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[100],
                        foregroundColor: Colors.green[800],
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      icon: const Icon(Icons.add_circle_outline, size: 16),
                      label: const Text('Assign', style: TextStyle(fontSize: 12)),
                    ),
                  )).toList(),
                ),
        ),
      ],
    );
  }
}