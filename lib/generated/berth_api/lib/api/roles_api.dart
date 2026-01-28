//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RolesApi {
  RolesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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
  Future<DeleteRoleResponse?> apiV1AdminRolesIdDelete(int id,) async {
    final response = await apiV1AdminRolesIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteRoleResponse',) as DeleteRoleResponse;
    
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
  Future<UpdateRoleResponse?> apiV1AdminRolesIdPut(int id, UpdateRoleRequest updateRoleRequest,) async {
    final response = await apiV1AdminRolesIdPutWithHttpInfo(id, updateRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateRoleResponse',) as UpdateRoleResponse;
    
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
  Future<CreateRoleResponse?> apiV1AdminRolesPost(CreateRoleRequest createRoleRequest,) async {
    final response = await apiV1AdminRolesPostWithHttpInfo(createRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateRoleResponse',) as CreateRoleResponse;
    
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
  Future<ListRoleStackPermissionsResponse?> apiV1AdminRolesRoleIdStackPermissionsGet(int roleId,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsGetWithHttpInfo(roleId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListRoleStackPermissionsResponse',) as ListRoleStackPermissionsResponse;
    
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
  Future<DeleteStackPermissionResponse?> apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(int roleId, int permissionId,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsPermissionIdDeleteWithHttpInfo(roleId, permissionId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteStackPermissionResponse',) as DeleteStackPermissionResponse;
    
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
  Future<CreateStackPermissionResponse?> apiV1AdminRolesRoleIdStackPermissionsPost(int roleId, CreateStackPermissionRequest createStackPermissionRequest,) async {
    final response = await apiV1AdminRolesRoleIdStackPermissionsPostWithHttpInfo(roleId, createStackPermissionRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateStackPermissionResponse',) as CreateStackPermissionResponse;
    
    }
    return null;
  }
}
