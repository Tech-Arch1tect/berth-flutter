//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminApi {
  AdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Export data
  ///
  /// Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ExportRequest] exportRequest (required):
  ///   Export password (min 12 characters)
  Future<Response> apiV1AdminMigrationExportPostWithHttpInfo(ExportRequest exportRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/migration/export';

    // ignore: prefer_final_locals
    Object? postBody = exportRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Export data
  ///
  /// Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.
  ///
  /// Parameters:
  ///
  /// * [ExportRequest] exportRequest (required):
  ///   Export password (min 12 characters)
  Future<MultipartFile?> apiV1AdminMigrationExportPost(ExportRequest exportRequest,) async {
    final response = await apiV1AdminMigrationExportPostWithHttpInfo(exportRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultipartFile',) as MultipartFile;
    
    }
    return null;
  }

  /// Import data
  ///
  /// Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] backupFile (required):
  ///
  /// * [String] password (required):
  Future<Response> apiV1AdminMigrationImportPostWithHttpInfo(MultipartFile backupFile, String password,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/migration/import';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (backupFile != null) {
      hasFields = true;
      mp.fields[r'backup_file'] = backupFile.field;
      mp.files.add(backupFile);
    }
    if (password != null) {
      hasFields = true;
      mp.fields[r'password'] = parameterToString(password);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Import data
  ///
  /// Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] backupFile (required):
  ///
  /// * [String] password (required):
  Future<ResponseImportData?> apiV1AdminMigrationImportPost(MultipartFile backupFile, String password,) async {
    final response = await apiV1AdminMigrationImportPostWithHttpInfo(backupFile, password,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseImportData',) as ResponseImportData;
    
    }
    return null;
  }

  /// List all operation logs
  ///
  /// Returns paginated list of all operation logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<Response> apiV1AdminOperationLogsGetWithHttpInfo({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'page_size', pageSize));
    }
    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
    }
    if (serverId != null) {
      queryParams.addAll(_queryParams('', 'server_id', serverId));
    }
    if (stackName != null) {
      queryParams.addAll(_queryParams('', 'stack_name', stackName));
    }
    if (command != null) {
      queryParams.addAll(_queryParams('', 'command', command));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (daysBack != null) {
      queryParams.addAll(_queryParams('', 'days_back', daysBack));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all operation logs
  ///
  /// Returns paginated list of all operation logs. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<ResponseOperationLogInfo?> apiV1AdminOperationLogsGet({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    final response = await apiV1AdminOperationLogsGetWithHttpInfo( page: page, pageSize: pageSize, search: search, serverId: serverId, stackName: stackName, command: command, status: status, daysBack: daysBack, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseOperationLogInfo',) as ResponseOperationLogInfo;
    
    }
    return null;
  }

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<Response> apiV1AdminOperationLogsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<ResponseOperationLogDetailData?> apiV1AdminOperationLogsIdGet(int id,) async {
    final response = await apiV1AdminOperationLogsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseOperationLogDetailData',) as ResponseOperationLogDetailData;
    
    }
    return null;
  }

  /// Get operation logs statistics
  ///
  /// Returns aggregated statistics for all operation logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminOperationLogsStatsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs/stats';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get operation logs statistics
  ///
  /// Returns aggregated statistics for all operation logs. Requires admin permissions.
  Future<ResponseOperationLogStatsData?> apiV1AdminOperationLogsStatsGet() async {
    final response = await apiV1AdminOperationLogsStatsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseOperationLogStatsData',) as ResponseOperationLogStatsData;
    
    }
    return null;
  }

  /// List all permissions
  ///
  /// Returns list of all permissions. Use ?type=role to filter out API-key-only permissions. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type:
  ///   Filter type - use 'role' to exclude API-key-only permissions
  Future<Response> apiV1AdminPermissionsGetWithHttpInfo({ String? type, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/permissions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (type != null) {
      queryParams.addAll(_queryParams('', 'type', type));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all permissions
  ///
  /// Returns list of all permissions. Use ?type=role to filter out API-key-only permissions. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [String] type:
  ///   Filter type - use 'role' to exclude API-key-only permissions
  Future<ResponseListPermissionsData?> apiV1AdminPermissionsGet({ String? type, }) async {
    final response = await apiV1AdminPermissionsGetWithHttpInfo( type: type, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseListPermissionsData',) as ResponseListPermissionsData;
    
    }
    return null;
  }

  /// List all roles
  ///
  /// List all roles. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminRolesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all roles
  ///
  /// List all roles. Requires admin permissions.
  Future<ResponseListRolesData?> apiV1AdminRolesGet() async {
    final response = await apiV1AdminRolesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseListRolesData',) as ResponseListRolesData;
    
    }
    return null;
  }

  /// Delete a role
  ///
  /// Deletes a role. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Role ID
  Future<Response> apiV1AdminRolesIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a role
  ///
  /// Deletes a role. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Role ID
  Future<ResponseMessageData?> apiV1AdminRolesIdDelete(int id,) async {
    final response = await apiV1AdminRolesIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData',) as ResponseMessageData;
    
    }
    return null;
  }

  /// Update a role
  ///
  /// Updates an existing role. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Role ID
  ///
  /// * [UpdateRoleRequest] updateRoleRequest (required):
  ///   Role details
  Future<Response> apiV1AdminRolesIdPutWithHttpInfo(int id, UpdateRoleRequest updateRoleRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateRoleRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update a role
  ///
  /// Updates an existing role. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Role ID
  ///
  /// * [UpdateRoleRequest] updateRoleRequest (required):
  ///   Role details
  Future<ResponseRoleWithPermissions?> apiV1AdminRolesIdPut(int id, UpdateRoleRequest updateRoleRequest,) async {
    final response = await apiV1AdminRolesIdPutWithHttpInfo(id, updateRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseRoleWithPermissions',) as ResponseRoleWithPermissions;
    
    }
    return null;
  }

  /// Create a new role
  ///
  /// Creates a new role. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateRoleRequest] createRoleRequest (required):
  ///   Role details
  Future<Response> apiV1AdminRolesPostWithHttpInfo(CreateRoleRequest createRoleRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles';

    // ignore: prefer_final_locals
    Object? postBody = createRoleRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new role
  ///
  /// Creates a new role. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [CreateRoleRequest] createRoleRequest (required):
  ///   Role details
  Future<ResponseRoleWithPermissions?> apiV1AdminRolesPost(CreateRoleRequest createRoleRequest,) async {
    final response = await apiV1AdminRolesPostWithHttpInfo(createRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseRoleWithPermissions',) as ResponseRoleWithPermissions;
    
    }
    return null;
  }

  /// List role stack permissions
  ///
  /// Returns the role details, available servers, permissions, and current permission rules. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  Future<Response> apiV1AdminRolesRoleIdStackPermissionsGetWithHttpInfo(int roleId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles/{roleId}/stack-permissions'
      .replaceAll('{roleId}', roleId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List role stack permissions
  ///
  /// Returns the role details, available servers, permissions, and current permission rules. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  Future<ResponseListRoleStackPermissionsData?> apiV1AdminRolesRoleIdStackPermissionsGet(int roleId,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsGetWithHttpInfo(roleId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseListRoleStackPermissionsData',) as ResponseListRoleStackPermissionsData;
    
    }
    return null;
  }

  /// Delete a role stack permission
  ///
  /// Deletes a permission rule from a role. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  ///
  /// * [int] permissionId (required):
  ///   Permission rule ID
  Future<Response> apiV1AdminRolesRoleIdStackPermissionsPermissionIdDeleteWithHttpInfo(int roleId, int permissionId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles/{roleId}/stack-permissions/{permissionId}'
      .replaceAll('{roleId}', roleId.toString())
      .replaceAll('{permissionId}', permissionId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a role stack permission
  ///
  /// Deletes a permission rule from a role. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  ///
  /// * [int] permissionId (required):
  ///   Permission rule ID
  Future<ResponseMessageData?> apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(int roleId, int permissionId,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsPermissionIdDeleteWithHttpInfo(roleId, permissionId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData',) as ResponseMessageData;
    
    }
    return null;
  }

  /// Create a role stack permission
  ///
  /// Creates a new permission rule for a role on a server with a stack pattern. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  ///
  /// * [CreateStackPermissionRequest] createStackPermissionRequest (required):
  ///   Permission rule details
  Future<Response> apiV1AdminRolesRoleIdStackPermissionsPostWithHttpInfo(int roleId, CreateStackPermissionRequest createStackPermissionRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/roles/{roleId}/stack-permissions'
      .replaceAll('{roleId}', roleId.toString());

    // ignore: prefer_final_locals
    Object? postBody = createStackPermissionRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a role stack permission
  ///
  /// Creates a new permission rule for a role on a server with a stack pattern. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] roleId (required):
  ///   Role ID
  ///
  /// * [CreateStackPermissionRequest] createStackPermissionRequest (required):
  ///   Permission rule details
  Future<ResponseMessageData?> apiV1AdminRolesRoleIdStackPermissionsPost(int roleId, CreateStackPermissionRequest createStackPermissionRequest,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsPostWithHttpInfo(roleId, createStackPermissionRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData',) as ResponseMessageData;
    
    }
    return null;
  }

  /// List security audit logs
  ///
  /// Returns paginated list of security audit logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] perPage (required):
  ///   Number of items per page
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [String] eventType:
  ///   Filter by event type
  ///
  /// * [String] eventCategory:
  ///   Filter by event category
  ///
  /// * [String] severity:
  ///   Filter by severity
  ///
  /// * [String] actorUserId:
  ///   Filter by actor user ID
  ///
  /// * [String] success:
  ///   Filter by success status (true/false)
  ///
  /// * [String] startDate:
  ///   Filter by start date (RFC3339 format)
  ///
  /// * [String] endDate:
  ///   Filter by end date (RFC3339 format)
  ///
  /// * [String] search:
  ///   Search in actor username, target name, or event type
  Future<Response> apiV1AdminSecurityAuditLogsGetWithHttpInfo(int perPage, { int? page, String? eventType, String? eventCategory, String? severity, String? actorUserId, String? success, String? startDate, String? endDate, String? search, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
      queryParams.addAll(_queryParams('', 'per_page', perPage));
    if (eventType != null) {
      queryParams.addAll(_queryParams('', 'event_type', eventType));
    }
    if (eventCategory != null) {
      queryParams.addAll(_queryParams('', 'event_category', eventCategory));
    }
    if (severity != null) {
      queryParams.addAll(_queryParams('', 'severity', severity));
    }
    if (actorUserId != null) {
      queryParams.addAll(_queryParams('', 'actor_user_id', actorUserId));
    }
    if (success != null) {
      queryParams.addAll(_queryParams('', 'success', success));
    }
    if (startDate != null) {
      queryParams.addAll(_queryParams('', 'start_date', startDate));
    }
    if (endDate != null) {
      queryParams.addAll(_queryParams('', 'end_date', endDate));
    }
    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List security audit logs
  ///
  /// Returns paginated list of security audit logs. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] perPage (required):
  ///   Number of items per page
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [String] eventType:
  ///   Filter by event type
  ///
  /// * [String] eventCategory:
  ///   Filter by event category
  ///
  /// * [String] severity:
  ///   Filter by severity
  ///
  /// * [String] actorUserId:
  ///   Filter by actor user ID
  ///
  /// * [String] success:
  ///   Filter by success status (true/false)
  ///
  /// * [String] startDate:
  ///   Filter by start date (RFC3339 format)
  ///
  /// * [String] endDate:
  ///   Filter by end date (RFC3339 format)
  ///
  /// * [String] search:
  ///   Search in actor username, target name, or event type
  Future<ResponseSecurityAuditLogInfo?> apiV1AdminSecurityAuditLogsGet(int perPage, { int? page, String? eventType, String? eventCategory, String? severity, String? actorUserId, String? success, String? startDate, String? endDate, String? search, }) async {
    final response = await apiV1AdminSecurityAuditLogsGetWithHttpInfo(perPage,  page: page, eventType: eventType, eventCategory: eventCategory, severity: severity, actorUserId: actorUserId, success: success, startDate: startDate, endDate: endDate, search: search, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseSecurityAuditLogInfo',) as ResponseSecurityAuditLogInfo;
    
    }
    return null;
  }

  /// Get security audit log details
  ///
  /// Returns detailed information about a specific security audit log. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Security audit log ID
  Future<Response> apiV1AdminSecurityAuditLogsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get security audit log details
  ///
  /// Returns detailed information about a specific security audit log. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Security audit log ID
  Future<ResponseSecurityAuditLogInfo2?> apiV1AdminSecurityAuditLogsIdGet(int id,) async {
    final response = await apiV1AdminSecurityAuditLogsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseSecurityAuditLogInfo2',) as ResponseSecurityAuditLogInfo2;
    
    }
    return null;
  }

  /// Get security audit statistics
  ///
  /// Returns aggregated statistics for security audit logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminSecurityAuditLogsStatsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs/stats';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get security audit statistics
  ///
  /// Returns aggregated statistics for security audit logs. Requires admin permissions.
  Future<ResponseStatsResponseData?> apiV1AdminSecurityAuditLogsStatsGet() async {
    final response = await apiV1AdminSecurityAuditLogsStatsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseStatsResponseData',) as ResponseStatsResponseData;
    
    }
    return null;
  }

  /// List all servers
  ///
  /// Returns list of all servers. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminServersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all servers
  ///
  /// Returns list of all servers. Requires admin access.
  Future<ResponseAdminListServersData?> apiV1AdminServersGet() async {
    final response = await apiV1AdminServersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAdminListServersData',) as ResponseAdminListServersData;
    
    }
    return null;
  }

  /// Delete a server
  ///
  /// Delete a server connection. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<Response> apiV1AdminServersIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete a server
  ///
  /// Delete a server connection. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<ResponseMessageData2?> apiV1AdminServersIdDelete(int id,) async {
    final response = await apiV1AdminServersIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData2',) as ResponseMessageData2;
    
    }
    return null;
  }

  /// Get a server
  ///
  /// Returns a single server by ID. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<Response> apiV1AdminServersIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get a server
  ///
  /// Returns a single server by ID. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<ResponseGetServerData?> apiV1AdminServersIdGet(int id,) async {
    final response = await apiV1AdminServersIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseGetServerData',) as ResponseGetServerData;
    
    }
    return null;
  }

  /// Update a server
  ///
  /// Update an existing server connection. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  ///
  /// * [ServerUpdateRequest] serverUpdateRequest (required):
  ///   Server details
  Future<Response> apiV1AdminServersIdPutWithHttpInfo(int id, ServerUpdateRequest serverUpdateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = serverUpdateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update a server
  ///
  /// Update an existing server connection. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  ///
  /// * [ServerUpdateRequest] serverUpdateRequest (required):
  ///   Server details
  Future<ResponseAdminUpdateServerData?> apiV1AdminServersIdPut(int id, ServerUpdateRequest serverUpdateRequest,) async {
    final response = await apiV1AdminServersIdPutWithHttpInfo(id, serverUpdateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAdminUpdateServerData',) as ResponseAdminUpdateServerData;
    
    }
    return null;
  }

  /// Test server connection
  ///
  /// Test the connection to a server. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<Response> apiV1AdminServersIdTestPostWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers/{id}/test'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Test server connection
  ///
  /// Test the connection to a server. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Server ID
  Future<ResponseMessageData2?> apiV1AdminServersIdTestPost(int id,) async {
    final response = await apiV1AdminServersIdTestPostWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData2',) as ResponseMessageData2;
    
    }
    return null;
  }

  /// Create a new server
  ///
  /// Create a new server connection. Requires admin access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ServerCreateRequest] serverCreateRequest (required):
  ///   Server details
  Future<Response> apiV1AdminServersPostWithHttpInfo(ServerCreateRequest serverCreateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/servers';

    // ignore: prefer_final_locals
    Object? postBody = serverCreateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new server
  ///
  /// Create a new server connection. Requires admin access.
  ///
  /// Parameters:
  ///
  /// * [ServerCreateRequest] serverCreateRequest (required):
  ///   Server details
  Future<ResponseAdminCreateServerData?> apiV1AdminServersPost(ServerCreateRequest serverCreateRequest,) async {
    final response = await apiV1AdminServersPostWithHttpInfo(serverCreateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAdminCreateServerData',) as ResponseAdminCreateServerData;
    
    }
    return null;
  }

  /// Assign a role to a user
  ///
  /// Assigns a role to a user. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AssignRoleRequest] assignRoleRequest (required):
  ///   User and role IDs
  Future<Response> apiV1AdminUsersAssignRolePostWithHttpInfo(AssignRoleRequest assignRoleRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/users/assign-role';

    // ignore: prefer_final_locals
    Object? postBody = assignRoleRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Assign a role to a user
  ///
  /// Assigns a role to a user. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [AssignRoleRequest] assignRoleRequest (required):
  ///   User and role IDs
  Future<ResponseMessageData?> apiV1AdminUsersAssignRolePost(AssignRoleRequest assignRoleRequest,) async {
    final response = await apiV1AdminUsersAssignRolePostWithHttpInfo(assignRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData',) as ResponseMessageData;
    
    }
    return null;
  }

  /// List all users
  ///
  /// List all users. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminUsersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/users';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all users
  ///
  /// List all users. Requires admin permissions.
  Future<ResponseListUsersData?> apiV1AdminUsersGet() async {
    final response = await apiV1AdminUsersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseListUsersData',) as ResponseListUsersData;
    
    }
    return null;
  }

  /// Get user with roles
  ///
  /// Returns user details and all available roles. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   User ID
  Future<Response> apiV1AdminUsersIdRolesGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/users/{id}/roles'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get user with roles
  ///
  /// Returns user details and all available roles. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   User ID
  Future<ResponseGetUserRolesData?> apiV1AdminUsersIdRolesGet(int id,) async {
    final response = await apiV1AdminUsersIdRolesGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseGetUserRolesData',) as ResponseGetUserRolesData;
    
    }
    return null;
  }

  /// Create a new user
  ///
  /// Creates a new user account. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateUserRequest] createUserRequest (required):
  ///   User details
  Future<Response> apiV1AdminUsersPostWithHttpInfo(CreateUserRequest createUserRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/users';

    // ignore: prefer_final_locals
    Object? postBody = createUserRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new user
  ///
  /// Creates a new user account. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [CreateUserRequest] createUserRequest (required):
  ///   User details
  Future<ResponseUserInfo?> apiV1AdminUsersPost(CreateUserRequest createUserRequest,) async {
    final response = await apiV1AdminUsersPostWithHttpInfo(createUserRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseUserInfo',) as ResponseUserInfo;
    
    }
    return null;
  }

  /// Revoke a role from a user
  ///
  /// Revokes a role from a user. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RevokeRoleRequest] revokeRoleRequest (required):
  ///   User and role IDs
  Future<Response> apiV1AdminUsersRevokeRolePostWithHttpInfo(RevokeRoleRequest revokeRoleRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/users/revoke-role';

    // ignore: prefer_final_locals
    Object? postBody = revokeRoleRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Revoke a role from a user
  ///
  /// Revokes a role from a user. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [RevokeRoleRequest] revokeRoleRequest (required):
  ///   User and role IDs
  Future<ResponseMessageData?> apiV1AdminUsersRevokeRolePost(RevokeRoleRequest revokeRoleRequest,) async {
    final response = await apiV1AdminUsersRevokeRolePostWithHttpInfo(revokeRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseMessageData',) as ResponseMessageData;
    
    }
    return null;
  }
}
