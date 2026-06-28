//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:berth_api/api.dart';
import 'package:test/test.dart';


/// tests for AdminApi
void main() {
  // final instance = AdminApi();

  group('tests for AdminApi', () {
    // Export data
    //
    // Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.
    //
    //Future<MultipartFile> apiV1AdminMigrationExportPost(ExportRequest exportRequest) async
    test('test apiV1AdminMigrationExportPost', () async {
      // TODO
    });

    // Import data
    //
    // Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.
    //
    //Future<ResponseImportData> apiV1AdminMigrationImportPost(MultipartFile backupFile, String password) async
    test('test apiV1AdminMigrationImportPost', () async {
      // TODO
    });

    // List all operation logs
    //
    // Returns paginated list of all operation logs. Requires admin permissions.
    //
    //Future<ResponseOperationLogInfo> apiV1AdminOperationLogsGet({ int page, int pageSize, String search, String serverId, String stackName, String command, String status, int daysBack }) async
    test('test apiV1AdminOperationLogsGet', () async {
      // TODO
    });

    // Get operation log details
    //
    // Returns detailed information about a specific operation log including all messages. Requires admin permissions.
    //
    //Future<ResponseOperationLogDetailData> apiV1AdminOperationLogsIdGet(int id) async
    test('test apiV1AdminOperationLogsIdGet', () async {
      // TODO
    });

    // Get operation logs statistics
    //
    // Returns aggregated statistics for all operation logs. Requires admin permissions.
    //
    //Future<ResponseOperationLogStatsData> apiV1AdminOperationLogsStatsGet() async
    test('test apiV1AdminOperationLogsStatsGet', () async {
      // TODO
    });

    // List all permissions
    //
    // Returns list of all permissions. Use ?type=role to filter out API-key-only permissions. Requires admin access.
    //
    //Future<ResponseListPermissionsData> apiV1AdminPermissionsGet({ String type }) async
    test('test apiV1AdminPermissionsGet', () async {
      // TODO
    });

    // List all roles
    //
    // List all roles. Requires admin permissions.
    //
    //Future<ResponseListRolesData> apiV1AdminRolesGet() async
    test('test apiV1AdminRolesGet', () async {
      // TODO
    });

    // Delete a role
    //
    // Deletes a role. Requires admin permissions.
    //
    //Future<ResponseMessageData> apiV1AdminRolesIdDelete(int id) async
    test('test apiV1AdminRolesIdDelete', () async {
      // TODO
    });

    // Update a role
    //
    // Updates an existing role. Requires admin permissions.
    //
    //Future<ResponseRoleWithPermissions> apiV1AdminRolesIdPut(int id, UpdateRoleRequest updateRoleRequest) async
    test('test apiV1AdminRolesIdPut', () async {
      // TODO
    });

    // Create a new role
    //
    // Creates a new role. Requires admin permissions.
    //
    //Future<ResponseRoleWithPermissions> apiV1AdminRolesPost(CreateRoleRequest createRoleRequest) async
    test('test apiV1AdminRolesPost', () async {
      // TODO
    });

    // List role stack permissions
    //
    // Returns the role details, available servers, permissions, and current permission rules. Requires admin permissions.
    //
    //Future<ResponseListRoleStackPermissionsData> apiV1AdminRolesRoleIdStackPermissionsGet(int roleId) async
    test('test apiV1AdminRolesRoleIdStackPermissionsGet', () async {
      // TODO
    });

    // Delete a role stack permission
    //
    // Deletes a permission rule from a role. Requires admin permissions.
    //
    //Future<ResponseMessageData> apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(int roleId, int permissionId) async
    test('test apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete', () async {
      // TODO
    });

    // Create a role stack permission
    //
    // Creates a new permission rule for a role on a server with a stack pattern. Requires admin permissions.
    //
    //Future<ResponseMessageData> apiV1AdminRolesRoleIdStackPermissionsPost(int roleId, CreateStackPermissionRequest createStackPermissionRequest) async
    test('test apiV1AdminRolesRoleIdStackPermissionsPost', () async {
      // TODO
    });

    // List security audit logs
    //
    // Returns paginated list of security audit logs. Requires admin permissions.
    //
    //Future<ResponseSecurityAuditLogInfo> apiV1AdminSecurityAuditLogsGet(int perPage, { int page, String eventType, String eventCategory, String severity, String actorUserId, String success, String startDate, String endDate, String search }) async
    test('test apiV1AdminSecurityAuditLogsGet', () async {
      // TODO
    });

    // Get security audit log details
    //
    // Returns detailed information about a specific security audit log. Requires admin permissions.
    //
    //Future<ResponseSecurityAuditLogInfo2> apiV1AdminSecurityAuditLogsIdGet(int id) async
    test('test apiV1AdminSecurityAuditLogsIdGet', () async {
      // TODO
    });

    // Get security audit statistics
    //
    // Returns aggregated statistics for security audit logs. Requires admin permissions.
    //
    //Future<ResponseStatsResponseData> apiV1AdminSecurityAuditLogsStatsGet() async
    test('test apiV1AdminSecurityAuditLogsStatsGet', () async {
      // TODO
    });

    // List all servers
    //
    // Returns list of all servers. Requires admin access.
    //
    //Future<ResponseAdminListServersData> apiV1AdminServersGet() async
    test('test apiV1AdminServersGet', () async {
      // TODO
    });

    // Delete a server
    //
    // Delete a server connection. Requires admin access.
    //
    //Future<ResponseMessageData2> apiV1AdminServersIdDelete(int id) async
    test('test apiV1AdminServersIdDelete', () async {
      // TODO
    });

    // Get a server
    //
    // Returns a single server by ID. Requires admin access.
    //
    //Future<ResponseGetServerData> apiV1AdminServersIdGet(int id) async
    test('test apiV1AdminServersIdGet', () async {
      // TODO
    });

    // Update a server
    //
    // Update an existing server connection. Requires admin access.
    //
    //Future<ResponseAdminUpdateServerData> apiV1AdminServersIdPut(int id, ServerUpdateRequest serverUpdateRequest) async
    test('test apiV1AdminServersIdPut', () async {
      // TODO
    });

    // Test server connection
    //
    // Test the connection to a server. Requires admin access.
    //
    //Future<ResponseMessageData2> apiV1AdminServersIdTestPost(int id) async
    test('test apiV1AdminServersIdTestPost', () async {
      // TODO
    });

    // Create a new server
    //
    // Create a new server connection. Requires admin access.
    //
    //Future<ResponseAdminCreateServerData> apiV1AdminServersPost(ServerCreateRequest serverCreateRequest) async
    test('test apiV1AdminServersPost', () async {
      // TODO
    });

    // Assign a role to a user
    //
    // Assigns a role to a user. Requires admin permissions.
    //
    //Future<ResponseMessageData> apiV1AdminUsersAssignRolePost(AssignRoleRequest assignRoleRequest) async
    test('test apiV1AdminUsersAssignRolePost', () async {
      // TODO
    });

    // List all users
    //
    // List all users. Requires admin permissions.
    //
    //Future<ResponseListUsersData> apiV1AdminUsersGet() async
    test('test apiV1AdminUsersGet', () async {
      // TODO
    });

    // Get user with roles
    //
    // Returns user details and all available roles. Requires admin permissions.
    //
    //Future<ResponseGetUserRolesData> apiV1AdminUsersIdRolesGet(int id) async
    test('test apiV1AdminUsersIdRolesGet', () async {
      // TODO
    });

    // Create a new user
    //
    // Creates a new user account. Requires admin permissions.
    //
    //Future<ResponseUserInfo> apiV1AdminUsersPost(CreateUserRequest createUserRequest) async
    test('test apiV1AdminUsersPost', () async {
      // TODO
    });

    // Revoke a role from a user
    //
    // Revokes a role from a user. Requires admin permissions.
    //
    //Future<ResponseMessageData> apiV1AdminUsersRevokeRolePost(RevokeRoleRequest revokeRoleRequest) async
    test('test apiV1AdminUsersRevokeRolePost', () async {
      // TODO
    });

  });
}
