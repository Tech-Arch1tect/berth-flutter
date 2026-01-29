import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class RoleService {
  final BerthApiProvider _berthApiProvider;

  RoleService(this._berthApiProvider);

  Future<List<berth_api.RoleWithPermissions>> getRoles() async {
    debugPrint('[RoleService] getRoles');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesGet(),
      );
      if (response == null) {
        throw Exception('Failed to load roles: null response');
      }
      debugPrint('[RoleService] getRoles: success, ${response.data.roles.length} roles');
      return response.data.roles;
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] getRoles: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to load roles: ${e.code}');
    }
  }

  Future<berth_api.ListRoleStackPermissionsData> getRoleStackPermissions(int roleId) async {
    debugPrint('[RoleService] getRoleStackPermissions: roleId=$roleId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesRoleIdStackPermissionsGet(roleId),
      );
      if (response == null) {
        throw Exception('Failed to load role stack permissions: null response');
      }
      debugPrint('[RoleService] getRoleStackPermissions: success');
      return response.data;
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] getRoleStackPermissions: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to load role stack permissions: ${e.code}');
    }
  }

  Future<void> createStackPermission({
    required int roleId,
    required int serverId,
    required int permissionId,
    required String stackPattern,
  }) async {
    debugPrint('[RoleService] createStackPermission: roleId=$roleId, serverId=$serverId');
    try {
      final request = berth_api.CreateStackPermissionRequest(
        serverId: serverId,
        permissionId: permissionId,
        stackPattern: stackPattern,
      );
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesRoleIdStackPermissionsPost(roleId, request),
      );
      if (response == null) {
        throw Exception('Failed to create permission: null response');
      }
      debugPrint('[RoleService] createStackPermission: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] createStackPermission: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to create permission: ${e.code}');
    }
  }

  Future<void> deleteStackPermission({
    required int roleId,
    required int permissionId,
  }) async {
    debugPrint('[RoleService] deleteStackPermission: roleId=$roleId, permissionId=$permissionId');
    try {
      await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(roleId, permissionId),
      );
      debugPrint('[RoleService] deleteStackPermission: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] deleteStackPermission: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to delete permission: ${e.code}');
    }
  }

  Future<berth_api.RoleWithPermissions> createRole({
    required String name,
    required String description,
  }) async {
    debugPrint('[RoleService] createRole: name=$name');
    try {
      final request = berth_api.CreateRoleRequest(
        name: name,
        description: description,
      );
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesPost(request),
      );
      if (response == null) {
        throw Exception('Failed to create role: null response');
      }
      debugPrint('[RoleService] createRole: success');
      return response.data;
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] createRole: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to create role: ${e.code}');
    }
  }

  Future<berth_api.RoleWithPermissions> updateRole({
    required int roleId,
    required String name,
    required String description,
  }) async {
    debugPrint('[RoleService] updateRole: roleId=$roleId, name=$name');
    try {
      final request = berth_api.UpdateRoleRequest(
        name: name,
        description: description,
      );
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesIdPut(roleId, request),
      );
      if (response == null) {
        throw Exception('Failed to update role: null response');
      }
      debugPrint('[RoleService] updateRole: success');
      return response.data;
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] updateRole: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to update role: ${e.code}');
    }
  }

  Future<void> deleteRole(int roleId) async {
    debugPrint('[RoleService] deleteRole: roleId=$roleId');
    try {
      await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.rolesApi.apiV1AdminRolesIdDelete(roleId),
      );
      debugPrint('[RoleService] deleteRole: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[RoleService] deleteRole: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to delete role: ${e.code}');
    }
  }
}
