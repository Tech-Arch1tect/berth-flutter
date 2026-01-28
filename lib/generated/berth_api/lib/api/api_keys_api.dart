//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ApiKeysApi {
  ApiKeysApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List API keys
  ///
  /// Returns all API keys belonging to the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1ApiKeysGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys';

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

  /// List API keys
  ///
  /// Returns all API keys belonging to the authenticated user.
  Future<ListAPIKeysResponse?> apiV1ApiKeysGet() async {
    final response = await apiV1ApiKeysGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListAPIKeysResponse',) as ListAPIKeysResponse;
    
    }
    return null;
  }

  /// Revoke API key
  ///
  /// Revokes (deletes) an API key. This action cannot be undone.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<Response> apiV1ApiKeysIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys/{id}'
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

  /// Revoke API key
  ///
  /// Revokes (deletes) an API key. This action cannot be undone.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<MessageResponse2?> apiV1ApiKeysIdDelete(int id,) async {
    final response = await apiV1ApiKeysIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse2',) as MessageResponse2;
    
    }
    return null;
  }

  /// Get API key
  ///
  /// Returns details of a specific API key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<Response> apiV1ApiKeysIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys/{id}'
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

  /// Get API key
  ///
  /// Returns details of a specific API key.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<GetAPIKeyResponse?> apiV1ApiKeysIdGet(int id,) async {
    final response = await apiV1ApiKeysIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAPIKeyResponse',) as GetAPIKeyResponse;
    
    }
    return null;
  }

  /// List API key scopes
  ///
  /// Returns all scopes configured for a specific API key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<Response> apiV1ApiKeysIdScopesGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys/{id}/scopes'
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

  /// List API key scopes
  ///
  /// Returns all scopes configured for a specific API key.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  Future<ListScopesResponse?> apiV1ApiKeysIdScopesGet(int id,) async {
    final response = await apiV1ApiKeysIdScopesGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListScopesResponse',) as ListScopesResponse;
    
    }
    return null;
  }

  /// Add scope to API key
  ///
  /// Adds a new permission scope to an API key. The scope limits what the API key can access.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  ///
  /// * [AddScopeRequest] addScopeRequest (required):
  ///   Scope details
  Future<Response> apiV1ApiKeysIdScopesPostWithHttpInfo(int id, AddScopeRequest addScopeRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys/{id}/scopes'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = addScopeRequest;

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

  /// Add scope to API key
  ///
  /// Adds a new permission scope to an API key. The scope limits what the API key can access.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  ///
  /// * [AddScopeRequest] addScopeRequest (required):
  ///   Scope details
  Future<MessageResponse2?> apiV1ApiKeysIdScopesPost(int id, AddScopeRequest addScopeRequest,) async {
    final response = await apiV1ApiKeysIdScopesPostWithHttpInfo(id, addScopeRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse2',) as MessageResponse2;
    
    }
    return null;
  }

  /// Remove scope from API key
  ///
  /// Removes a permission scope from an API key.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  ///
  /// * [int] scopeId (required):
  ///   Scope ID
  Future<Response> apiV1ApiKeysIdScopesScopeIdDeleteWithHttpInfo(int id, int scopeId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys/{id}/scopes/{scopeId}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{scopeId}', scopeId.toString());

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

  /// Remove scope from API key
  ///
  /// Removes a permission scope from an API key.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   API key ID
  ///
  /// * [int] scopeId (required):
  ///   Scope ID
  Future<MessageResponse2?> apiV1ApiKeysIdScopesScopeIdDelete(int id, int scopeId,) async {
    final response = await apiV1ApiKeysIdScopesScopeIdDeleteWithHttpInfo(id, scopeId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse2',) as MessageResponse2;
    
    }
    return null;
  }

  /// Create API key
  ///
  /// Creates a new API key for the authenticated user. The plain key is only returned once at creation time.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateAPIKeyRequest] createAPIKeyRequest (required):
  ///   API key creation request
  Future<Response> apiV1ApiKeysPostWithHttpInfo(CreateAPIKeyRequest createAPIKeyRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/api-keys';

    // ignore: prefer_final_locals
    Object? postBody = createAPIKeyRequest;

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

  /// Create API key
  ///
  /// Creates a new API key for the authenticated user. The plain key is only returned once at creation time.
  ///
  /// Parameters:
  ///
  /// * [CreateAPIKeyRequest] createAPIKeyRequest (required):
  ///   API key creation request
  Future<CreateAPIKeyResponse?> apiV1ApiKeysPost(CreateAPIKeyRequest createAPIKeyRequest,) async {
    final response = await apiV1ApiKeysPostWithHttpInfo(createAPIKeyRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateAPIKeyResponse',) as CreateAPIKeyResponse;
    
    }
    return null;
  }
}
