import 'dart:convert';
import '../models/role.dart';
import '../models/permission.dart';
import '../models/server.dart';
import 'api_client.dart';

class RoleService {
  final ApiClient _apiClient;

  RoleService(this._apiClient);

  Future<List<Role>> getRoles() async {
    final response = await _apiClient.get('/api/v1/admin/roles');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final roles = data['roles'] as List;
      return roles.map((role) => Role.fromJson(role)).toList();
    } else {
      throw Exception('Failed to load roles: ${response.statusCode}');
    }
  }

  Future<RoleServerPermissionsData> getRoleServerPermissions(int roleId) async {
    final response = await _apiClient.get('/api/v1/admin/roles/$roleId/server-permissions');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      return RoleServerPermissionsData(
        role: Role.fromJson(data['role']),
        servers: (data['servers'] as List).map((server) => Server.fromJson(server)).toList(),
        permissions: (data['permissions'] as List).map((permission) => Permission.fromJson(permission)).toList(),
        permissionMatrix: _parsePermissionMatrix(data['permissionMatrix']),
      );
    } else {
      throw Exception('Failed to load role server permissions: ${response.statusCode}');
    }
  }

  Future<void> updateRoleServerPermission({
    required int roleId,
    required int serverId,
    required int permissionId,
    required bool granted,
  }) async {
    final response = await _apiClient.post('/api/v1/admin/roles/$roleId/server-permissions', body: {
      'server_id': serverId,
      'permission_id': permissionId,
      'granted': granted,
    });
    
    if (response.statusCode != 200) {
      final errorData = json.decode(response.body);
      throw Exception('Failed to update permission: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Map<int, Map<int, bool>> _parsePermissionMatrix(dynamic matrix) {
    final result = <int, Map<int, bool>>{};
    if (matrix is Map) {
      matrix.forEach((serverKey, permissions) {
        final serverId = int.tryParse(serverKey.toString());
        if (serverId != null && permissions is Map) {
          result[serverId] = <int, bool>{};
          permissions.forEach((permissionKey, value) {
            final permissionId = int.tryParse(permissionKey.toString());
            if (permissionId != null) {
              result[serverId]![permissionId] = value == true;
            }
          });
        }
      });
    }
    return result;
  }
}

class RoleServerPermissionsData {
  final Role role;
  final List<Server> servers;
  final List<Permission> permissions;
  final Map<int, Map<int, bool>> permissionMatrix;

  RoleServerPermissionsData({
    required this.role,
    required this.servers,
    required this.permissions,
    required this.permissionMatrix,
  });

  bool hasPermission(int serverId, int permissionId) {
    return permissionMatrix[serverId]?[permissionId] ?? false;
  }
}