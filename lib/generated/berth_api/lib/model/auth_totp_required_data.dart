//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthTOTPRequiredData {
  /// Returns a new [AuthTOTPRequiredData] instance.
  AuthTOTPRequiredData({
    required this.message,
    required this.temporaryToken,
    required this.totpRequired,
  });

  String message;

  String temporaryToken;

  bool totpRequired;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthTOTPRequiredData &&
    other.message == message &&
    other.temporaryToken == temporaryToken &&
    other.totpRequired == totpRequired;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (temporaryToken.hashCode) +
    (totpRequired.hashCode);

  @override
  String toString() => 'AuthTOTPRequiredData[message=$message, temporaryToken=$temporaryToken, totpRequired=$totpRequired]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
      json[r'temporary_token'] = this.temporaryToken;
      json[r'totp_required'] = this.totpRequired;
    return json;
  }

  /// Returns a new [AuthTOTPRequiredData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthTOTPRequiredData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthTOTPRequiredData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthTOTPRequiredData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthTOTPRequiredData(
        message: mapValueOfType<String>(json, r'message')!,
        temporaryToken: mapValueOfType<String>(json, r'temporary_token')!,
        totpRequired: mapValueOfType<bool>(json, r'totp_required')!,
      );
    }
    return null;
  }

  static List<AuthTOTPRequiredData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthTOTPRequiredData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthTOTPRequiredData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthTOTPRequiredData> mapFromJson(dynamic json) {
    final map = <String, AuthTOTPRequiredData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthTOTPRequiredData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthTOTPRequiredData-objects as value to a dart map
  static Map<String, List<AuthTOTPRequiredData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthTOTPRequiredData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthTOTPRequiredData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'temporary_token',
    'totp_required',
  };
}

