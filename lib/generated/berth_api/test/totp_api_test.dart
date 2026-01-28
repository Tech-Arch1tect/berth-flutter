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


/// tests for TotpApi
void main() {
  // final instance = TotpApi();

  group('tests for TotpApi', () {
    // Disable TOTP
    //
    // Disables two-factor authentication. Requires both the current TOTP code and password for security.
    //
    //Future<TOTPMessageResponse> apiV1TotpDisablePost(TOTPDisableRequest tOTPDisableRequest) async
    test('test apiV1TotpDisablePost', () async {
      // TODO
    });

    // Enable TOTP
    //
    // Enables two-factor authentication after verifying the TOTP code from the authenticator app.
    //
    //Future<TOTPMessageResponse> apiV1TotpEnablePost(TOTPEnableRequest tOTPEnableRequest) async
    test('test apiV1TotpEnablePost', () async {
      // TODO
    });

    // Get TOTP setup information
    //
    // Returns the QR code URI and secret for setting up two-factor authentication. Only available if TOTP is not already enabled.
    //
    //Future<TOTPSetupResponse> apiV1TotpSetupGet() async
    test('test apiV1TotpSetupGet', () async {
      // TODO
    });

    // Get TOTP status
    //
    // Returns whether two-factor authentication is enabled for the authenticated user.
    //
    //Future<TOTPStatusResponse> apiV1TotpStatusGet() async
    test('test apiV1TotpStatusGet', () async {
      // TODO
    });

  });
}
