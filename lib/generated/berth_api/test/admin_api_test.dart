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
    //Future<ImportResponse> apiV1AdminMigrationImportPost(MultipartFile backupFile, String password) async
    test('test apiV1AdminMigrationImportPost', () async {
      // TODO
    });

    // List all operation logs
    //
    // Returns paginated list of all operation logs. Requires admin permissions.
    //
    //Future<PaginatedOperationLogs> apiV1AdminOperationLogsGet({ int page, int pageSize, String search, String serverId, String stackName, String command, String status, int daysBack }) async
    test('test apiV1AdminOperationLogsGet', () async {
      // TODO
    });

    // Get operation log details
    //
    // Returns detailed information about a specific operation log including all messages. Requires admin permissions.
    //
    //Future<OperationLogDetail> apiV1AdminOperationLogsIdGet(int id) async
    test('test apiV1AdminOperationLogsIdGet', () async {
      // TODO
    });

    // Get operation logs statistics
    //
    // Returns aggregated statistics for all operation logs. Requires admin permissions.
    //
    //Future<OperationLogStats> apiV1AdminOperationLogsStatsGet() async
    test('test apiV1AdminOperationLogsStatsGet', () async {
      // TODO
    });

    // List all roles
    //
    // List all roles. Requires admin permissions.
    //
    //Future<ListRolesResponse> apiV1AdminRolesGet() async
    test('test apiV1AdminRolesGet', () async {
      // TODO
    });

    // Delete a role
    //
    // Deletes a role. Requires admin permissions.
    //
    //Future<DeleteRoleResponse> apiV1AdminRolesIdDelete(int id) async
    test('test apiV1AdminRolesIdDelete', () async {
      // TODO
    });

    // Update a role
    //
    // Updates an existing role. Requires admin permissions.
    //
    //Future<UpdateRoleResponse> apiV1AdminRolesIdPut(int id, UpdateRoleRequest updateRoleRequest) async
    test('test apiV1AdminRolesIdPut', () async {
      // TODO
    });

    // Create a new role
    //
    // Creates a new role. Requires admin permissions.
    //
    //Future<CreateRoleResponse> apiV1AdminRolesPost(CreateRoleRequest createRoleRequest) async
    test('test apiV1AdminRolesPost', () async {
      // TODO
    });

    // List role stack permissions
    //
    // Returns the role details, available servers, permissions, and current permission rules. Requires admin permissions.
    //
    //Future<ListRoleStackPermissionsResponse> apiV1AdminRolesRoleIdStackPermissionsGet(int roleId) async
    test('test apiV1AdminRolesRoleIdStackPermissionsGet', () async {
      // TODO
    });

    // Delete a role stack permission
    //
    // Deletes a permission rule from a role. Requires admin permissions.
    //
    //Future<DeleteStackPermissionResponse> apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(int roleId, int permissionId) async
    test('test apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete', () async {
      // TODO
    });

    // Create a role stack permission
    //
    // Creates a new permission rule for a role on a server with a stack pattern. Requires admin permissions.
    //
    //Future<CreateStackPermissionResponse> apiV1AdminRolesRoleIdStackPermissionsPost(int roleId, CreateStackPermissionRequest createStackPermissionRequest) async
    test('test apiV1AdminRolesRoleIdStackPermissionsPost', () async {
      // TODO
    });

    // List security audit logs
    //
    // Returns paginated list of security audit logs. Requires admin permissions.
    //
    //Future<ListLogsAPIResponse> apiV1AdminSecurityAuditLogsGet({ int page, int perPage, String eventType, String eventCategory, String severity, String actorUserId, String success, String startDate, String endDate, String search }) async
    test('test apiV1AdminSecurityAuditLogsGet', () async {
      // TODO
    });

    // Get security audit log details
    //
    // Returns detailed information about a specific security audit log. Requires admin permissions.
    //
    //Future<GetLogAPIResponse> apiV1AdminSecurityAuditLogsIdGet(int id) async
    test('test apiV1AdminSecurityAuditLogsIdGet', () async {
      // TODO
    });

    // Get security audit statistics
    //
    // Returns aggregated statistics for security audit logs. Requires admin permissions.
    //
    //Future<GetStatsAPIResponse> apiV1AdminSecurityAuditLogsStatsGet() async
    test('test apiV1AdminSecurityAuditLogsStatsGet', () async {
      // TODO
    });

    // List all servers
    //
    // Returns list of all servers. Requires admin access.
    //
    //Future<AdminListServersResponse> apiV1AdminServersGet() async
    test('test apiV1AdminServersGet', () async {
      // TODO
    });

    // Delete a server
    //
    // Delete a server connection. Requires admin access.
    //
    //Future<AdminDeleteServerResponse> apiV1AdminServersIdDelete(int id) async
    test('test apiV1AdminServersIdDelete', () async {
      // TODO
    });

    // Update a server
    //
    // Update an existing server connection. Requires admin access.
    //
    //Future<AdminUpdateServerResponse> apiV1AdminServersIdPut(int id, ServerUpdateRequest serverUpdateRequest) async
    test('test apiV1AdminServersIdPut', () async {
      // TODO
    });

    // Test server connection
    //
    // Test the connection to a server. Requires admin access.
    //
    //Future<AdminTestConnectionResponse> apiV1AdminServersIdTestPost(int id) async
    test('test apiV1AdminServersIdTestPost', () async {
      // TODO
    });

    // Create a new server
    //
    // Create a new server connection. Requires admin access.
    //
    //Future<AdminCreateServerResponse> apiV1AdminServersPost(ServerCreateRequest serverCreateRequest) async
    test('test apiV1AdminServersPost', () async {
      // TODO
    });

    // Assign a role to a user
    //
    // Assigns a role to a user. Requires admin permissions.
    //
    //Future<AssignRoleResponse> apiV1AdminUsersAssignRolePost(AssignRoleRequest assignRoleRequest) async
    test('test apiV1AdminUsersAssignRolePost', () async {
      // TODO
    });

    // List all users
    //
    // List all users. Requires admin permissions.
    //
    //Future<ListUsersResponse> apiV1AdminUsersGet() async
    test('test apiV1AdminUsersGet', () async {
      // TODO
    });

    // Get user with roles
    //
    // Returns user details and all available roles. Requires admin permissions.
    //
    //Future<GetUserRolesResponse> apiV1AdminUsersIdRolesGet(int id) async
    test('test apiV1AdminUsersIdRolesGet', () async {
      // TODO
    });

    // Create a new user
    //
    // Creates a new user account. Requires admin permissions.
    //
    //Future<CreateUserResponse> apiV1AdminUsersPost(CreateUserRequest createUserRequest) async
    test('test apiV1AdminUsersPost', () async {
      // TODO
    });

    // Revoke a role from a user
    //
    // Revokes a role from a user. Requires admin permissions.
    //
    //Future<RevokeRoleResponse> apiV1AdminUsersRevokeRolePost(RevokeRoleRequest revokeRoleRequest) async
    test('test apiV1AdminUsersRevokeRolePost', () async {
      // TODO
    });

  });
}
