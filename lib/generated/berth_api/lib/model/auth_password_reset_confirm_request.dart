//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthPasswordResetConfirmRequest {
  /// Returns a new [AuthPasswordResetConfirmRequest] instance.
  AuthPasswordResetConfirmRequest({
    required this.password,
    required this.passwordConfirmation,
    required this.token,
  });

  String password;

  String passwordConfirmation;

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthPasswordResetConfirmRequest &&
    other.password == password &&
    other.passwordConfirmation == passwordConfirmation &&
    other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (password.hashCode) +
    (passwordConfirmation.hashCode) +
    (token.hashCode);

  @override
  String toString() => 'AuthPasswordResetConfirmRequest[password=$password, passwordConfirmation=$passwordConfirmation, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'password'] = this.password;
      json[r'password_confirmation'] = this.passwordConfirmation;
      json[r'token'] = this.token;
    return json;
  }

  /// Returns a new [AuthPasswordResetConfirmRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthPasswordResetConfirmRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthPasswordResetConfirmRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthPasswordResetConfirmRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthPasswordResetConfirmRequest(
        password: mapValueOfType<String>(json, r'password')!,
        passwordConfirmation: mapValueOfType<String>(json, r'password_confirmation')!,
        token: mapValueOfType<String>(json, r'token')!,
      );
    }
    return null;
  }

  static List<AuthPasswordResetConfirmRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthPasswordResetConfirmRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthPasswordResetConfirmRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthPasswordResetConfirmRequest> mapFromJson(dynamic json) {
    final map = <String, AuthPasswordResetConfirmRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthPasswordResetConfirmRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthPasswordResetConfirmRequest-objects as value to a dart map
  static Map<String, List<AuthPasswordResetConfirmRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthPasswordResetConfirmRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthPasswordResetConfirmRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'password',
    'password_confirmation',
    'token',
  };
}

