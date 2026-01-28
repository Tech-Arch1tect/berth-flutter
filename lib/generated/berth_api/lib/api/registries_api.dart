//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RegistriesApi {
  RegistriesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List registry credentials
  ///
  /// Returns all registry credentials for a server. Requires registries.manage permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridRegistriesGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/registries'
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

  /// List registry credentials
  ///
  /// Returns all registry credentials for a server. Requires registries.manage permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<ListCredentialsResponse?> apiV1ServersServeridRegistriesGet(int serverid,) async {
    final response = await apiV1ServersServeridRegistriesGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListCredentialsResponse',) as ListCredentialsResponse;
    
    }
    return null;
  }

  /// Delete registry credential
  ///
  /// Deletes a registry credential. Requires registries.manage permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  Future<Response> apiV1ServersServeridRegistriesIdDeleteWithHttpInfo(int serverid, int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/registries/{id}'
      .replaceAll('{serverid}', serverid.toString())
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

  /// Delete registry credential
  ///
  /// Deletes a registry credential. Requires registries.manage permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  Future<DeleteCredentialResponse?> apiV1ServersServeridRegistriesIdDelete(int serverid, int id,) async {
    final response = await apiV1ServersServeridRegistriesIdDeleteWithHttpInfo(serverid, id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteCredentialResponse',) as DeleteCredentialResponse;
    
    }
    return null;
  }

  /// Get registry credential
  ///
  /// Returns a specific registry credential by ID. Requires registries.manage permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  Future<Response> apiV1ServersServeridRegistriesIdGetWithHttpInfo(int serverid, int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/registries/{id}'
      .replaceAll('{serverid}', serverid.toString())
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

  /// Get registry credential
  ///
  /// Returns a specific registry credential by ID. Requires registries.manage permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  Future<GetCredentialResponse?> apiV1ServersServeridRegistriesIdGet(int serverid, int id,) async {
    final response = await apiV1ServersServeridRegistriesIdGetWithHttpInfo(serverid, id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetCredentialResponse',) as GetCredentialResponse;
    
    }
    return null;
  }

  /// Update registry credential
  ///
  /// Updates an existing registry credential. Requires registries.manage permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  ///
  /// * [UpdateCredentialRequest] updateCredentialRequest (required):
  ///   Updated registry credential details
  Future<Response> apiV1ServersServeridRegistriesIdPutWithHttpInfo(int serverid, int id, UpdateCredentialRequest updateCredentialRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/registries/{id}'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateCredentialRequest;

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

  /// Update registry credential
  ///
  /// Updates an existing registry credential. Requires registries.manage permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [int] id (required):
  ///   Credential ID
  ///
  /// * [UpdateCredentialRequest] updateCredentialRequest (required):
  ///   Updated registry credential details
  Future<UpdateCredentialResponse?> apiV1ServersServeridRegistriesIdPut(int serverid, int id, UpdateCredentialRequest updateCredentialRequest,) async {
    final response = await apiV1ServersServeridRegistriesIdPutWithHttpInfo(serverid, id, updateCredentialRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateCredentialResponse',) as UpdateCredentialResponse;
    
    }
    return null;
  }

  /// Create registry credential
  ///
  /// Creates a new registry credential for a server. Requires registries.manage permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [CreateCredentialRequest] createCredentialRequest (required):
  ///   Registry credential details
  Future<Response> apiV1ServersServeridRegistriesPostWithHttpInfo(int serverid, CreateCredentialRequest createCredentialRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/registries'
      .replaceAll('{serverid}', serverid.toString());

    // ignore: prefer_final_locals
    Object? postBody = createCredentialRequest;

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

  /// Create registry credential
  ///
  /// Creates a new registry credential for a server. Requires registries.manage permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [CreateCredentialRequest] createCredentialRequest (required):
  ///   Registry credential details
  Future<CreateCredentialResponse?> apiV1ServersServeridRegistriesPost(int serverid, CreateCredentialRequest createCredentialRequest,) async {
    final response = await apiV1ServersServeridRegistriesPostWithHttpInfo(serverid, createCredentialRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateCredentialResponse',) as CreateCredentialResponse;
    
    }
    return null;
  }
}
