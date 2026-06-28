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
    // Authenticates a user with username and password. The 200 response is one of two shapes: AuthLoginData (full access and refresh tokens, plus user info) when login completes immediately, or AuthTOTPRequiredData (totp_required=true with a temporary token) when TOTP is enabled and the caller must complete /auth/totp/verify next. Clients should branch on the totp_required field. On full success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients; mobile/CLI clients can keep using the body-returned `refresh_token`.
    //
    //Future<ApiV1AuthLoginPost200Response> apiV1AuthLoginPost(AuthLoginRequest authLoginRequest) async
    test('test apiV1AuthLoginPost', () async {
      // TODO
    });

    // Logout and revoke tokens
    //
    // Revokes the access token (from the `Authorization` header) and the refresh token, effectively logging the user out. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The `berth_refresh` cookie is always cleared on the response.
    //
    //Future<ResponseAuthLogoutData> apiV1AuthLogoutPost(AuthLogoutRequest authLogoutRequest) async
    test('test apiV1AuthLogoutPost', () async {
      // TODO
    });

    // Complete a password reset
    //
    // Resets the user's password using a token previously emailed to them. The token is single-use; subsequent submissions return an error.
    //
    //Future<ResponseAuthMessageData> apiV1AuthPasswordResetConfirmPost(AuthPasswordResetConfirmRequest authPasswordResetConfirmRequest) async
    test('test apiV1AuthPasswordResetConfirmPost', () async {
      // TODO
    });

    // Request a password reset email
    //
    // Sends a password reset email to the supplied address if an account exists. Always returns 200 with a generic message to prevent account enumeration.
    //
    //Future<ResponseAuthMessageData> apiV1AuthPasswordResetPost(AuthPasswordResetRequest authPasswordResetRequest) async
    test('test apiV1AuthPasswordResetPost', () async {
      // TODO
    });

    // Refresh access token
    //
    // Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated. The refresh token may be supplied either in the request body's `refresh_token` field (mobile/CLI) or via the `berth_refresh` cookie (browser); when both are present the body wins. The rotated refresh token is written back to the `berth_refresh` cookie so browser clients stay current after rotation.
    //
    //Future<ResponseAuthRefreshData> apiV1AuthRefreshPost(AuthRefreshRequest authRefreshRequest) async
    test('test apiV1AuthRefreshPost', () async {
      // TODO
    });

    // Request a new email verification link
    //
    // Sends a fresh verification email if an account with the supplied address exists and is unverified. Always returns 200 with a generic message to prevent account enumeration.
    //
    //Future<ResponseAuthMessageData> apiV1AuthResendVerificationPost(AuthResendVerificationRequest authResendVerificationRequest) async
    test('test apiV1AuthResendVerificationPost', () async {
      // TODO
    });

    // Verify TOTP code to complete login
    //
    // Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app. On success the response also sets a `berth_refresh` cookie (HttpOnly, Secure, SameSite=Strict, Path=/api/v1/auth) carrying the refresh token for browser clients.
    //
    //Future<ResponseAuthLoginData> apiV1AuthTotpVerifyPost(AuthTOTPVerifyRequest authTOTPVerifyRequest) async
    test('test apiV1AuthTotpVerifyPost', () async {
      // TODO
    });

    // Verify an email address
    //
    // Marks the email address associated with the supplied token as verified. The token is single-use.
    //
    //Future<ResponseAuthMessageData> apiV1AuthVerifyEmailPost(AuthVerifyEmailRequest authVerifyEmailRequest) async
    test('test apiV1AuthVerifyEmailPost', () async {
      // TODO
    });

  });
}
