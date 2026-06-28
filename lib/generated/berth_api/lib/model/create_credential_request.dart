//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateCredentialRequest {
  /// Returns a new [CreateCredentialRequest] instance.
  CreateCredentialRequest({
    this.imagePattern,
    required this.password,
    required this.registryUrl,
    this.stackPattern,
    required this.username,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imagePattern;

  String password;

  String registryUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stackPattern;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateCredentialRequest &&
    other.imagePattern == imagePattern &&
    other.password == password &&
    other.registryUrl == registryUrl &&
    other.stackPattern == stackPattern &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (imagePattern == null ? 0 : imagePattern!.hashCode) +
    (password.hashCode) +
    (registryUrl.hashCode) +
    (stackPattern == null ? 0 : stackPattern!.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'CreateCredentialRequest[imagePattern=$imagePattern, password=$password, registryUrl=$registryUrl, stackPattern=$stackPattern, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.imagePattern != null) {
      json[r'image_pattern'] = this.imagePattern;
    } else {
      json[r'image_pattern'] = null;
    }
      json[r'password'] = this.password;
      json[r'registry_url'] = this.registryUrl;
    if (this.stackPattern != null) {
      json[r'stack_pattern'] = this.stackPattern;
    } else {
      json[r'stack_pattern'] = null;
    }
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [CreateCredentialRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateCredentialRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateCredentialRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateCredentialRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateCredentialRequest(
        imagePattern: mapValueOfType<String>(json, r'image_pattern'),
        password: mapValueOfType<String>(json, r'password')!,
        registryUrl: mapValueOfType<String>(json, r'registry_url')!,
        stackPattern: mapValueOfType<String>(json, r'stack_pattern'),
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<CreateCredentialRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCredentialRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCredentialRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateCredentialRequest> mapFromJson(dynamic json) {
    final map = <String, CreateCredentialRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateCredentialRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateCredentialRequest-objects as value to a dart map
  static Map<String, List<CreateCredentialRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateCredentialRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateCredentialRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'password',
    'registry_url',
    'username',
  };
}

