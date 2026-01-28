//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersApi {
  UsersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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
  Future<AssignRoleResponse?> apiV1AdminUsersAssignRolePost(AssignRoleRequest assignRoleRequest,) async {
    final response = await apiV1AdminUsersAssignRolePostWithHttpInfo(assignRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AssignRoleResponse',) as AssignRoleResponse;
    
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
  Future<CreateUserResponse?> apiV1AdminUsersPost(CreateUserRequest createUserRequest,) async {
    final response = await apiV1AdminUsersPostWithHttpInfo(createUserRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateUserResponse',) as CreateUserResponse;
    
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
  Future<RevokeRoleResponse?> apiV1AdminUsersRevokeRolePost(RevokeRoleRequest revokeRoleRequest,) async {
    final response = await apiV1AdminUsersRevokeRolePostWithHttpInfo(revokeRoleRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RevokeRoleResponse',) as RevokeRoleResponse;
    
    }
    return null;
  }
}
