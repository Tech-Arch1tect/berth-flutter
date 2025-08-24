import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/role_service.dart';
import '../../widgets/app_drawer.dart';

class RoleServerPermissionsScreen extends StatefulWidget {
  final int roleId;

  const RoleServerPermissionsScreen({
    super.key,
    required this.roleId,
  });

  @override
  State<RoleServerPermissionsScreen> createState() => _RoleServerPermissionsScreenState();
}

class _RoleServerPermissionsScreenState extends State<RoleServerPermissionsScreen> {
  late RoleService roleService;
  RoleServerPermissionsData? data;
  bool isLoading = true;
  String? error;
  Set<String> updatingPermissions = {};

  @override
  void initState() {
    super.initState();
    roleService = RoleService(context.read());
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      data = await roleService.getRoleServerPermissions(widget.roleId);
    } catch (e) {
      error = 'Failed to load data: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _togglePermission(int serverId, int permissionId, bool currentlyGranted) async {
    final key = '$serverId-$permissionId';
    
    setState(() {
      updatingPermissions.add(key);
    });

    try {
      await roleService.updateRoleServerPermission(
        roleId: widget.roleId,
        serverId: serverId,
        permissionId: permissionId,
        granted: !currentlyGranted,
      );
      
      setState(() {
        if (data != null) {
          final updatedMatrix = Map<int, Map<int, bool>>.from(data!.permissionMatrix);
          if (updatedMatrix[serverId] == null) {
            updatedMatrix[serverId] = <int, bool>{};
          }
          updatedMatrix[serverId]![permissionId] = !currentlyGranted;
          
          data = RoleServerPermissionsData(
            role: data!.role,
            servers: data!.servers,
            permissions: data!.permissions,
            permissionMatrix: updatedMatrix,
          );
        }
        updatingPermissions.remove(key);
      });
    } catch (e) {
      setState(() {
        updatingPermissions.remove(key);
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update permission: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data?.role.name != null ? '${data!.role.name} Server Permissions' : 'Server Permissions'),
      ),
      drawer: const AppDrawer(currentRoute: '/admin/roles'),
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

    if (data!.servers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.dns_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No servers configured yet',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildPermissionMatrix(),
          const SizedBox(height: 24),
          _buildPermissionInfo(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
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
              Icons.security,
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
                  '${data!.role.name} Server Permissions',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage server permissions for the ${data!.role.name} role',
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

  Widget _buildPermissionMatrix() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrowScreen = constraints.maxWidth < 600;
        
        if (isNarrowScreen) {
          return _buildMobilePermissionMatrix();
        } else {
          return _buildDesktopPermissionMatrix();
        }
      },
    );
  }

  Widget _buildMobilePermissionMatrix() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Permission Matrix',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...data!.servers.map((server) => _buildMobileServerPermissions(server)),
        ],
      ),
    );
  }

  Widget _buildMobileServerPermissions(dynamic server) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: server.isActive ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      server.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${server.useHttps ? 'https' : 'http'}://${server.host}:${server.port}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (server.description.isNotEmpty)
                      Text(
                        server.description,
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...data!.permissions.map((permission) {
          final granted = data!.hasPermission(server.id, permission.id);
          final key = '${server.id}-${permission.id}';
          final isUpdating = updatingPermissions.contains(key);

          return ListTile(
            title: Text(permission.name),
            subtitle: Text(permission.description),
            trailing: isUpdating
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () => _togglePermission(server.id, permission.id, granted),
                    icon: Icon(
                      granted ? Icons.check_circle : Icons.cancel,
                      color: granted ? Colors.green : Colors.grey,
                    ),
                    tooltip: granted ? 'Revoke ${permission.name}' : 'Grant ${permission.name}',
                  ),
          );
        }),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildDesktopPermissionMatrix() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Permission Matrix',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                const DataColumn(
                  label: Text(
                    'Server',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...data!.permissions.map((permission) => DataColumn(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        permission.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        permission.description,
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
              ],
              rows: data!.servers.map((server) => DataRow(
                cells: [
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: server.isActive ? Colors.green : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              server.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '${server.useHttps ? 'https' : 'http'}://${server.host}:${server.port}',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        if (server.description.isNotEmpty)
                          Text(
                            server.description,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                  ...data!.permissions.map((permission) {
                    final granted = data!.hasPermission(server.id, permission.id);
                    final key = '${server.id}-${permission.id}';
                    final isUpdating = updatingPermissions.contains(key);

                    return DataCell(
                      Center(
                        child: IconButton(
                          onPressed: isUpdating ? null : () => _togglePermission(server.id, permission.id, granted),
                          icon: isUpdating
                              ? SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                )
                              : Icon(
                                  granted ? Icons.check_circle : Icons.cancel,
                                  color: granted ? Colors.green : Colors.grey,
                                ),
                          tooltip: granted ? 'Revoke ${permission.name}' : 'Grant ${permission.name}',
                        ),
                      ),
                    );
                  }),
                ],
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionInfo() {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                  'Permission Information',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...data!.permissions.map((permission) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      permission.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      permission.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 12),
            Text(
              'Users with the ${data!.role.name} role can only access servers where they have at least the stacks.read permission.',
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
}