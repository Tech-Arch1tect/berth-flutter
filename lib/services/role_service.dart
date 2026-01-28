import 'dart:convert';
import 'package:berth_api/api.dart' as berth_api;
import '../models/role.dart';
import '../models/permission.dart';
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

  Future<RoleStackPermissionsData> getRoleStackPermissions(int roleId) async {
    final response = await _apiClient.get('/api/v1/admin/roles/$roleId/stack-permissions');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      return RoleStackPermissionsData(
        role: Role.fromJson(data['role']),
        servers: (data['servers'] as List).map((server) => berth_api.ServerResponse.fromJson(server)!).toList(),
        permissions: (data['permissions'] as List).map((permission) => Permission.fromJson(permission)).toList(),
        permissionRules: (data['permissionRules'] as List).map((rule) => PermissionRule.fromJson(rule)).toList(),
      );
    } else {
      throw Exception('Failed to load role stack permissions: ${response.statusCode}');
    }
  }

  Future<void> createStackPermission({
    required int roleId,
    required int serverId,
    required int permissionId,
    required String stackPattern,
  }) async {
    final response = await _apiClient.post('/api/v1/admin/roles/$roleId/stack-permissions', body: {
      'server_id': serverId,
      'permission_id': permissionId,
      'stack_pattern': stackPattern,
    });
    
    if (response.statusCode != 201) {
      final errorData = json.decode(response.body);
      throw Exception('Failed to create permission: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<void> deleteStackPermission({
    required int roleId,
    required int permissionId,
  }) async {
    final response = await _apiClient.delete('/api/v1/admin/roles/$roleId/stack-permissions/$permissionId');
    
    if (response.statusCode != 200) {
      final errorData = json.decode(response.body);
      throw Exception('Failed to delete permission: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<Role> createRole({
    required String name,
    required String description,
  }) async {
    final response = await _apiClient.post('/api/v1/admin/roles', body: {
      'name': name,
      'description': description,
    });

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Role.fromJson(data);
    } else {
      final error = json.decode(response.body);
      throw Exception('Failed to create role: ${error['error'] ?? 'Unknown error'}');
    }
  }

  Future<Role> updateRole({
    required int roleId,
    required String name,
    required String description,
  }) async {
    final response = await _apiClient.put('/api/v1/admin/roles/$roleId', body: {
      'name': name,
      'description': description,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Role.fromJson(data);
    } else {
      final error = json.decode(response.body);
      throw Exception('Failed to update role: ${error['error'] ?? 'Unknown error'}');
    }
  }

  Future<void> deleteRole(int roleId) async {
    final response = await _apiClient.delete('/api/v1/admin/roles/$roleId');

    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      throw Exception('Failed to delete role: ${error['error'] ?? 'Unknown error'}');
    }
  }

}

class PermissionRule {
  final int id;
  final int serverId;
  final int permissionId;
  final String stackPattern;
  final bool isStackBased;

  PermissionRule({
    required this.id,
    required this.serverId,
    required this.permissionId,
    required this.stackPattern,
    required this.isStackBased,
  });

  factory PermissionRule.fromJson(Map<String, dynamic> json) {
    return PermissionRule(
      id: json['id'] as int,
      serverId: json['server_id'] as int,
      permissionId: json['permission_id'] as int,
      stackPattern: json['stack_pattern'] as String? ?? '*',
      isStackBased: json['is_stack_based'] as bool? ?? true,
    );
  }
}

class RoleStackPermissionsData {
  final Role role;
  final List<berth_api.ServerResponse> servers;
  final List<Permission> permissions;
  final List<PermissionRule> permissionRules;

  RoleStackPermissionsData({
    required this.role,
    required this.servers,
    required this.permissions,
    required this.permissionRules,
  });

  List<PermissionRule> getRulesForServerPattern(int serverId, String stackPattern) {
    return permissionRules.where((rule) => 
      rule.serverId == serverId && rule.stackPattern == stackPattern
    ).toList();
  }

  bool hasPermissionForPattern(int serverId, int permissionId, String stackPattern) {
    return permissionRules.any((rule) => 
      rule.serverId == serverId && 
      rule.permissionId == permissionId && 
      rule.stackPattern == stackPattern
    );
  }
}