//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SessionsApi {
  SessionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List user sessions
  ///
  /// Returns all active sessions for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1SessionsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/sessions';

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

  /// List user sessions
  ///
  /// Returns all active sessions for the authenticated user.
  Future<ResponseGetSessionsData?> apiV1SessionsGet() async {
    final response = await apiV1SessionsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseGetSessionsData',) as ResponseGetSessionsData;
    
    }
    return null;
  }

  /// Revoke all other sessions
  ///
  /// Revokes all sessions for the authenticated user except the current one.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  ///   No body required
  Future<Response> apiV1SessionsRevokeAllOthersPostWithHttpInfo(Object body,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/sessions/revoke-all-others';

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Revoke all other sessions
  ///
  /// Revokes all sessions for the authenticated user except the current one.
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  ///   No body required
  Future<ResponseSessionMessageData?> apiV1SessionsRevokeAllOthersPost(Object body,) async {
    final response = await apiV1SessionsRevokeAllOthersPostWithHttpInfo(body,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseSessionMessageData',) as ResponseSessionMessageData;
    
    }
    return null;
  }

  /// Revoke a session
  ///
  /// Revokes a specific session by ID. The user will be logged out from that device.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RevokeSessionRequest] revokeSessionRequest (required):
  ///   Session to revoke
  Future<Response> apiV1SessionsRevokePostWithHttpInfo(RevokeSessionRequest revokeSessionRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/sessions/revoke';

    // ignore: prefer_final_locals
    Object? postBody = revokeSessionRequest;

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

  /// Revoke a session
  ///
  /// Revokes a specific session by ID. The user will be logged out from that device.
  ///
  /// Parameters:
  ///
  /// * [RevokeSessionRequest] revokeSessionRequest (required):
  ///   Session to revoke
  Future<ResponseSessionMessageData?> apiV1SessionsRevokePost(RevokeSessionRequest revokeSessionRequest,) async {
    final response = await apiV1SessionsRevokePostWithHttpInfo(revokeSessionRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseSessionMessageData',) as ResponseSessionMessageData;
    
    }
    return null;
  }
}
