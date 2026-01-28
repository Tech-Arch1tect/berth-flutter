//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TotpApi {
  TotpApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Disable TOTP
  ///
  /// Disables two-factor authentication. Requires both the current TOTP code and password for security.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TOTPDisableRequest] tOTPDisableRequest (required):
  ///   TOTP code and password
  Future<Response> apiV1TotpDisablePostWithHttpInfo(TOTPDisableRequest tOTPDisableRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/totp/disable';

    // ignore: prefer_final_locals
    Object? postBody = tOTPDisableRequest;

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

  /// Disable TOTP
  ///
  /// Disables two-factor authentication. Requires both the current TOTP code and password for security.
  ///
  /// Parameters:
  ///
  /// * [TOTPDisableRequest] tOTPDisableRequest (required):
  ///   TOTP code and password
  Future<TOTPMessageResponse?> apiV1TotpDisablePost(TOTPDisableRequest tOTPDisableRequest,) async {
    final response = await apiV1TotpDisablePostWithHttpInfo(tOTPDisableRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TOTPMessageResponse',) as TOTPMessageResponse;
    
    }
    return null;
  }

  /// Enable TOTP
  ///
  /// Enables two-factor authentication after verifying the TOTP code from the authenticator app.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [TOTPEnableRequest] tOTPEnableRequest (required):
  ///   TOTP verification code
  Future<Response> apiV1TotpEnablePostWithHttpInfo(TOTPEnableRequest tOTPEnableRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/totp/enable';

    // ignore: prefer_final_locals
    Object? postBody = tOTPEnableRequest;

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

  /// Enable TOTP
  ///
  /// Enables two-factor authentication after verifying the TOTP code from the authenticator app.
  ///
  /// Parameters:
  ///
  /// * [TOTPEnableRequest] tOTPEnableRequest (required):
  ///   TOTP verification code
  Future<TOTPMessageResponse?> apiV1TotpEnablePost(TOTPEnableRequest tOTPEnableRequest,) async {
    final response = await apiV1TotpEnablePostWithHttpInfo(tOTPEnableRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TOTPMessageResponse',) as TOTPMessageResponse;
    
    }
    return null;
  }

  /// Get TOTP setup information
  ///
  /// Returns the QR code URI and secret for setting up two-factor authentication. Only available if TOTP is not already enabled.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1TotpSetupGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/totp/setup';

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

  /// Get TOTP setup information
  ///
  /// Returns the QR code URI and secret for setting up two-factor authentication. Only available if TOTP is not already enabled.
  Future<TOTPSetupResponse?> apiV1TotpSetupGet() async {
    final response = await apiV1TotpSetupGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TOTPSetupResponse',) as TOTPSetupResponse;
    
    }
    return null;
  }

  /// Get TOTP status
  ///
  /// Returns whether two-factor authentication is enabled for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1TotpStatusGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/totp/status';

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

  /// Get TOTP status
  ///
  /// Returns whether two-factor authentication is enabled for the authenticated user.
  Future<TOTPStatusResponse?> apiV1TotpStatusGet() async {
    final response = await apiV1TotpStatusGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TOTPStatusResponse',) as TOTPStatusResponse;
    
    }
    return null;
  }
}
