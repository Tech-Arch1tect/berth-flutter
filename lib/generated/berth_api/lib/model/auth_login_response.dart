//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthLoginResponse {
  /// Returns a new [AuthLoginResponse] instance.
  AuthLoginResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.user,
  });

  String accessToken;

  int expiresIn;

  int refreshExpiresIn;

  String refreshToken;

  String tokenType;

  UserInfo user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthLoginResponse &&
    other.accessToken == accessToken &&
    other.expiresIn == expiresIn &&
    other.refreshExpiresIn == refreshExpiresIn &&
    other.refreshToken == refreshToken &&
    other.tokenType == tokenType &&
    other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken.hashCode) +
    (expiresIn.hashCode) +
    (refreshExpiresIn.hashCode) +
    (refreshToken.hashCode) +
    (tokenType.hashCode) +
    (user.hashCode);

  @override
  String toString() => 'AuthLoginResponse[accessToken=$accessToken, expiresIn=$expiresIn, refreshExpiresIn=$refreshExpiresIn, refreshToken=$refreshToken, tokenType=$tokenType, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'access_token'] = this.accessToken;
      json[r'expires_in'] = this.expiresIn;
      json[r'refresh_expires_in'] = this.refreshExpiresIn;
      json[r'refresh_token'] = this.refreshToken;
      json[r'token_type'] = this.tokenType;
      json[r'user'] = this.user;
    return json;
  }

  /// Returns a new [AuthLoginResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthLoginResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthLoginResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthLoginResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthLoginResponse(
        accessToken: mapValueOfType<String>(json, r'access_token')!,
        expiresIn: mapValueOfType<int>(json, r'expires_in')!,
        refreshExpiresIn: mapValueOfType<int>(json, r'refresh_expires_in')!,
        refreshToken: mapValueOfType<String>(json, r'refresh_token')!,
        tokenType: mapValueOfType<String>(json, r'token_type')!,
        user: UserInfo.fromJson(json[r'user'])!,
      );
    }
    return null;
  }

  static List<AuthLoginResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthLoginResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthLoginResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthLoginResponse> mapFromJson(dynamic json) {
    final map = <String, AuthLoginResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthLoginResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthLoginResponse-objects as value to a dart map
  static Map<String, List<AuthLoginResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthLoginResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthLoginResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'access_token',
    'expires_in',
    'refresh_expires_in',
    'refresh_token',
    'token_type',
    'user',
  };
}

