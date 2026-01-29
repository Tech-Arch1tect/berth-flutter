//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthLogoutResponse {
  /// Returns a new [AuthLogoutResponse] instance.
  AuthLogoutResponse({
    required this.message,
    this.revokedTokens = const [],
  });

  String message;

  List<String> revokedTokens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthLogoutResponse &&
    other.message == message &&
    _deepEquality.equals(other.revokedTokens, revokedTokens);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (revokedTokens.hashCode);

  @override
  String toString() => 'AuthLogoutResponse[message=$message, revokedTokens=$revokedTokens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
      json[r'revoked_tokens'] = this.revokedTokens;
    return json;
  }

  /// Returns a new [AuthLogoutResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthLogoutResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthLogoutResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthLogoutResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthLogoutResponse(
        message: mapValueOfType<String>(json, r'message')!,
        revokedTokens: json[r'revoked_tokens'] is Iterable
            ? (json[r'revoked_tokens'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<AuthLogoutResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthLogoutResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthLogoutResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthLogoutResponse> mapFromJson(dynamic json) {
    final map = <String, AuthLogoutResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthLogoutResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthLogoutResponse-objects as value to a dart map
  static Map<String, List<AuthLogoutResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthLogoutResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthLogoutResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'revoked_tokens',
  };
}

