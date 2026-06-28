//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RegistryCredential {
  /// Returns a new [RegistryCredential] instance.
  RegistryCredential({
    required this.password,
    required this.registry,
    required this.username,
  });

  String password;

  String registry;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegistryCredential &&
    other.password == password &&
    other.registry == registry &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (password.hashCode) +
    (registry.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'RegistryCredential[password=$password, registry=$registry, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'password'] = this.password;
      json[r'registry'] = this.registry;
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [RegistryCredential] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegistryCredential? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegistryCredential[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegistryCredential[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegistryCredential(
        password: mapValueOfType<String>(json, r'password')!,
        registry: mapValueOfType<String>(json, r'registry')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<RegistryCredential> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegistryCredential>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegistryCredential.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegistryCredential> mapFromJson(dynamic json) {
    final map = <String, RegistryCredential>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegistryCredential.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegistryCredential-objects as value to a dart map
  static Map<String, List<RegistryCredential>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegistryCredential>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RegistryCredential.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'password',
    'registry',
    'username',
  };
}

