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
  /// Authenticates a user with username and password. The 200 response is one of two shapes: AuthLoginData (full access and refresh tokens, plus user info) when login completes immediately, or AuthTOTPRequiredData (totp_required=true with a temporary token) when TOTP is enabled and the caller must complete /auth/totp/verify next. Clients should branch on the totp_required field. On full success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients; mobile/CLI clients can keep using the body-returned `refresh_token`.
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
  /// Authenticates a user with username and password. The 200 response is one of two shapes: AuthLoginData (full access and refresh tokens, plus user info) when login completes immediately, or AuthTOTPRequiredData (totp_required=true with a temporary token) when TOTP is enabled and the caller must complete /auth/totp/verify next. Clients should branch on the totp_required field. On full success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients; mobile/CLI clients can keep using the body-returned `refresh_token`.
  ///
  /// Parameters:
  ///
  /// * [AuthLoginRequest] authLoginRequest (required):
  ///   Login credentials
  Future<ApiV1AuthLoginPost200Response?> apiV1AuthLoginPost(AuthLoginRequest authLoginRequest,) async {
    final response = await apiV1AuthLoginPostWithHttpInfo(authLoginRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ApiV1AuthLoginPost200Response',) as ApiV1AuthLoginPost200Response;
    
    }
    return null;
  }

  /// Logout and revoke tokens
  ///
  /// Revokes the access token (from the `Authorization` header) and the refresh token, effectively logging the user out. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The `berth_refresh` cookie is always cleared on the response.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthLogoutRequest] authLogoutRequest (required):
  ///   Refresh token to revoke (optional - may be supplied via berth_refresh cookie instead)
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
  /// Revokes the access token (from the `Authorization` header) and the refresh token, effectively logging the user out. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The `berth_refresh` cookie is always cleared on the response.
  ///
  /// Parameters:
  ///
  /// * [AuthLogoutRequest] authLogoutRequest (required):
  ///   Refresh token to revoke (optional - may be supplied via berth_refresh cookie instead)
  Future<ResponseAuthLogoutData?> apiV1AuthLogoutPost(AuthLogoutRequest authLogoutRequest,) async {
    final response = await apiV1AuthLogoutPostWithHttpInfo(authLogoutRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthLogoutData',) as ResponseAuthLogoutData;
    
    }
    return null;
  }

  /// Complete a password reset
  ///
  /// Resets the user's password using a token previously emailed to them. The token is single-use; subsequent submissions return an error.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthPasswordResetConfirmRequest] authPasswordResetConfirmRequest (required):
  ///   Reset token plus new password and confirmation
  Future<Response> apiV1AuthPasswordResetConfirmPostWithHttpInfo(AuthPasswordResetConfirmRequest authPasswordResetConfirmRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/password-reset/confirm';

    // ignore: prefer_final_locals
    Object? postBody = authPasswordResetConfirmRequest;

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

  /// Complete a password reset
  ///
  /// Resets the user's password using a token previously emailed to them. The token is single-use; subsequent submissions return an error.
  ///
  /// Parameters:
  ///
  /// * [AuthPasswordResetConfirmRequest] authPasswordResetConfirmRequest (required):
  ///   Reset token plus new password and confirmation
  Future<ResponseAuthMessageData?> apiV1AuthPasswordResetConfirmPost(AuthPasswordResetConfirmRequest authPasswordResetConfirmRequest,) async {
    final response = await apiV1AuthPasswordResetConfirmPostWithHttpInfo(authPasswordResetConfirmRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthMessageData',) as ResponseAuthMessageData;
    
    }
    return null;
  }

  /// Request a password reset email
  ///
  /// Sends a password reset email to the supplied address if an account exists. Always returns 200 with a generic message to prevent account enumeration.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthPasswordResetRequest] authPasswordResetRequest (required):
  ///   Email address to send the reset link to
  Future<Response> apiV1AuthPasswordResetPostWithHttpInfo(AuthPasswordResetRequest authPasswordResetRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/password-reset';

    // ignore: prefer_final_locals
    Object? postBody = authPasswordResetRequest;

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

  /// Request a password reset email
  ///
  /// Sends a password reset email to the supplied address if an account exists. Always returns 200 with a generic message to prevent account enumeration.
  ///
  /// Parameters:
  ///
  /// * [AuthPasswordResetRequest] authPasswordResetRequest (required):
  ///   Email address to send the reset link to
  Future<ResponseAuthMessageData?> apiV1AuthPasswordResetPost(AuthPasswordResetRequest authPasswordResetRequest,) async {
    final response = await apiV1AuthPasswordResetPostWithHttpInfo(authPasswordResetRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthMessageData',) as ResponseAuthMessageData;
    
    }
    return null;
  }

  /// Refresh access token
  ///
  /// Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The rotated refresh token is written back to the `berth_refresh` cookie so browser clients stay current after rotation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthRefreshRequest] authRefreshRequest (required):
  ///   Refresh token (optional - may be supplied via berth_refresh cookie instead)
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
  /// Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The rotated refresh token is written back to the `berth_refresh` cookie so browser clients stay current after rotation.
  ///
  /// Parameters:
  ///
  /// * [AuthRefreshRequest] authRefreshRequest (required):
  ///   Refresh token (optional - may be supplied via berth_refresh cookie instead)
  Future<ResponseAuthRefreshData?> apiV1AuthRefreshPost(AuthRefreshRequest authRefreshRequest,) async {
    final response = await apiV1AuthRefreshPostWithHttpInfo(authRefreshRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthRefreshData',) as ResponseAuthRefreshData;
    
    }
    return null;
  }

  /// Request a new email verification link
  ///
  /// Sends a fresh verification email if an account with the supplied address exists and is unverified. Always returns 200 with a generic message to prevent account enumeration.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthResendVerificationRequest] authResendVerificationRequest (required):
  ///   Email address to send the verification link to
  Future<Response> apiV1AuthResendVerificationPostWithHttpInfo(AuthResendVerificationRequest authResendVerificationRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/resend-verification';

    // ignore: prefer_final_locals
    Object? postBody = authResendVerificationRequest;

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

  /// Request a new email verification link
  ///
  /// Sends a fresh verification email if an account with the supplied address exists and is unverified. Always returns 200 with a generic message to prevent account enumeration.
  ///
  /// Parameters:
  ///
  /// * [AuthResendVerificationRequest] authResendVerificationRequest (required):
  ///   Email address to send the verification link to
  Future<ResponseAuthMessageData?> apiV1AuthResendVerificationPost(AuthResendVerificationRequest authResendVerificationRequest,) async {
    final response = await apiV1AuthResendVerificationPostWithHttpInfo(authResendVerificationRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthMessageData',) as ResponseAuthMessageData;
    
    }
    return null;
  }

  /// Verify TOTP code to complete login
  ///
  /// Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app. On success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients.
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
  /// Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app. On success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients.
  ///
  /// Parameters:
  ///
  /// * [AuthTOTPVerifyRequest] authTOTPVerifyRequest (required):
  ///   TOTP verification code
  Future<ResponseAuthLoginData?> apiV1AuthTotpVerifyPost(AuthTOTPVerifyRequest authTOTPVerifyRequest,) async {
    final response = await apiV1AuthTotpVerifyPostWithHttpInfo(authTOTPVerifyRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthLoginData',) as ResponseAuthLoginData;
    
    }
    return null;
  }

  /// Verify an email address
  ///
  /// Marks the email address associated with the supplied token as verified. The token is single-use.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthVerifyEmailRequest] authVerifyEmailRequest (required):
  ///   Email verification token
  Future<Response> apiV1AuthVerifyEmailPostWithHttpInfo(AuthVerifyEmailRequest authVerifyEmailRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/auth/verify-email';

    // ignore: prefer_final_locals
    Object? postBody = authVerifyEmailRequest;

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

  /// Verify an email address
  ///
  /// Marks the email address associated with the supplied token as verified. The token is single-use.
  ///
  /// Parameters:
  ///
  /// * [AuthVerifyEmailRequest] authVerifyEmailRequest (required):
  ///   Email verification token
  Future<ResponseAuthMessageData?> apiV1AuthVerifyEmailPost(AuthVerifyEmailRequest authVerifyEmailRequest,) async {
    final response = await apiV1AuthVerifyEmailPostWithHttpInfo(authVerifyEmailRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResponseAuthMessageData',) as ResponseAuthMessageData;
    
    }
    return null;
  }
}
