//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ServersApi {
  ServersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

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
  Future<AdminListServersResponse?> apiV1AdminServersGet() async {
    final response = await apiV1AdminServersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminListServersResponse',) as AdminListServersResponse;
    
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
  Future<AdminDeleteServerResponse?> apiV1AdminServersIdDelete(int id,) async {
    final response = await apiV1AdminServersIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminDeleteServerResponse',) as AdminDeleteServerResponse;
    
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
  Future<AdminUpdateServerResponse?> apiV1AdminServersIdPut(int id, ServerUpdateRequest serverUpdateRequest,) async {
    final response = await apiV1AdminServersIdPutWithHttpInfo(id, serverUpdateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminUpdateServerResponse',) as AdminUpdateServerResponse;
    
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
  Future<AdminTestConnectionResponse?> apiV1AdminServersIdTestPost(int id,) async {
    final response = await apiV1AdminServersIdTestPostWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminTestConnectionResponse',) as AdminTestConnectionResponse;
    
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
  Future<AdminCreateServerResponse?> apiV1AdminServersPost(ServerCreateRequest serverCreateRequest,) async {
    final response = await apiV1AdminServersPostWithHttpInfo(serverCreateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminCreateServerResponse',) as AdminCreateServerResponse;
    
    }
    return null;
  }

  /// List accessible servers
  ///
  /// Returns all servers the authenticated user has permission to access
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1ServersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers';

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

  /// List accessible servers
  ///
  /// Returns all servers the authenticated user has permission to access
  Future<ListServersResponse?> apiV1ServersGet() async {
    final response = await apiV1ServersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListServersResponse',) as ListServersResponse;
    
    }
    return null;
  }

  /// Get server statistics
  ///
  /// Returns stack statistics for a specific server
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridStatisticsGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/statistics'
      .replaceAll('{serverid}', serverid.toString());

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

  /// Get server statistics
  ///
  /// Returns stack statistics for a specific server
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<ServerStatisticsResponse?> apiV1ServersServeridStatisticsGet(int serverid,) async {
    final response = await apiV1ServersServeridStatisticsGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ServerStatisticsResponse',) as ServerStatisticsResponse;
    
    }
    return null;
  }
}
