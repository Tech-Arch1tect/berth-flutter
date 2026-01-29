//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:berth_api/api.dart';
import 'package:test/test.dart';


/// tests for AuthApi
void main() {
  // final instance = AuthApi();

  group('tests for AuthApi', () {
    // Login with username and password
    //
    // Authenticates a user with username and password. If TOTP is enabled, returns a temporary token that must be used with /auth/totp/verify to complete authentication.
    //
    //Future<AuthTOTPRequiredResponse> apiV1AuthLoginPost(AuthLoginRequest authLoginRequest) async
    test('test apiV1AuthLoginPost', () async {
      // TODO
    });

    // Logout and revoke tokens
    //
    // Revokes the access token and refresh token, effectively logging the user out. The refresh token must be provided in the request body.
    //
    //Future<AuthLogoutResponse> apiV1AuthLogoutPost(AuthLogoutRequest authLogoutRequest) async
    test('test apiV1AuthLogoutPost', () async {
      // TODO
    });

    // Refresh access token
    //
    // Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated.
    //
    //Future<AuthRefreshResponse> apiV1AuthRefreshPost(AuthRefreshRequest authRefreshRequest) async
    test('test apiV1AuthRefreshPost', () async {
      // TODO
    });

    // Verify TOTP code to complete login
    //
    // Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app.
    //
    //Future<AuthLoginResponse> apiV1AuthTotpVerifyPost(AuthTOTPVerifyRequest authTOTPVerifyRequest) async
    test('test apiV1AuthTotpVerifyPost', () async {
      // TODO
    });

  });
}
