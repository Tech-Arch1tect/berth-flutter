//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Login with username and password
  ///
  /// Authenticates a user with username and password. If TOTP is enabled, returns a temporary token that must be used with /auth/totp/verify to complete authentication.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthLoginRequest] authLoginRequest (required):
  ///   Login credentials
  Future<Response> apiV1AuthLoginPostWithHttpInfo(AuthLoginRequest authLoginRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/login';

    // ignore: prefer_final_locals
    Object? postBody = authLoginRequest;

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

  /// Login with username and password
  ///
  /// Authenticates a user with username and password. If TOTP is enabled, returns a temporary token that must be used with /auth/totp/verify to complete authentication.
  ///
  /// Parameters:
  ///
  /// * [AuthLoginRequest] authLoginRequest (required):
  ///   Login credentials
  Future<AuthTOTPRequiredResponse?> apiV1AuthLoginPost(AuthLoginRequest authLoginRequest,) async {
    final response = await apiV1AuthLoginPostWithHttpInfo(authLoginRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthTOTPRequiredResponse',) as AuthTOTPRequiredResponse;
    
    }
    return null;
  }

  /// Logout and revoke tokens
  ///
  /// Revokes the access token and refresh token, effectively logging the user out. The refresh token must be provided in the request body.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthLogoutRequest] authLogoutRequest (required):
  ///   Refresh token to revoke
  Future<Response> apiV1AuthLogoutPostWithHttpInfo(AuthLogoutRequest authLogoutRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/logout';

    // ignore: prefer_final_locals
    Object? postBody = authLogoutRequest;

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

  /// Logout and revoke tokens
  ///
  /// Revokes the access token and refresh token, effectively logging the user out. The refresh token must be provided in the request body.
  ///
  /// Parameters:
  ///
  /// * [AuthLogoutRequest] authLogoutRequest (required):
  ///   Refresh token to revoke
  Future<AuthLogoutResponse?> apiV1AuthLogoutPost(AuthLogoutRequest authLogoutRequest,) async {
    final response = await apiV1AuthLogoutPostWithHttpInfo(authLogoutRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthLogoutResponse',) as AuthLogoutResponse;
    
    }
    return null;
  }

  /// Refresh access token
  ///
  /// Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthRefreshRequest] authRefreshRequest (required):
  ///   Refresh token
  Future<Response> apiV1AuthRefreshPostWithHttpInfo(AuthRefreshRequest authRefreshRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/refresh';

    // ignore: prefer_final_locals
    Object? postBody = authRefreshRequest;

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

  /// Refresh access token
  ///
  /// Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated.
  ///
  /// Parameters:
  ///
  /// * [AuthRefreshRequest] authRefreshRequest (required):
  ///   Refresh token
  Future<AuthRefreshResponse?> apiV1AuthRefreshPost(AuthRefreshRequest authRefreshRequest,) async {
    final response = await apiV1AuthRefreshPostWithHttpInfo(authRefreshRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthRefreshResponse',) as AuthRefreshResponse;
    
    }
    return null;
  }

  /// Verify TOTP code to complete login
  ///
  /// Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthTOTPVerifyRequest] authTOTPVerifyRequest (required):
  ///   TOTP verification code
  Future<Response> apiV1AuthTotpVerifyPostWithHttpInfo(AuthTOTPVerifyRequest authTOTPVerifyRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/totp/verify';

    // ignore: prefer_final_locals
    Object? postBody = authTOTPVerifyRequest;

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

  /// Verify TOTP code to complete login
  ///
  /// Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app.
  ///
  /// Parameters:
  ///
  /// * [AuthTOTPVerifyRequest] authTOTPVerifyRequest (required):
  ///   TOTP verification code
  Future<AuthLoginResponse?> apiV1AuthTotpVerifyPost(AuthTOTPVerifyRequest authTOTPVerifyRequest,) async {
    final response = await apiV1AuthTotpVerifyPostWithHttpInfo(authTOTPVerifyRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthLoginResponse',) as AuthLoginResponse;
    
    }
    return null;
  }
}
