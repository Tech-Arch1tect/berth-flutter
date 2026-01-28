//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RegistryCredentialResponse {
  /// Returns a new [RegistryCredentialResponse] instance.
  RegistryCredentialResponse({
    required this.createdAt,
    required this.id,
    this.imagePattern,
    required this.registryUrl,
    required this.serverId,
    required this.stackPattern,
    required this.updatedAt,
    required this.username,
  });

  DateTime createdAt;

  /// Minimum value: 0
  int id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imagePattern;

  String registryUrl;

  /// Minimum value: 0
  int serverId;

  String stackPattern;

  DateTime updatedAt;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegistryCredentialResponse &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.imagePattern == imagePattern &&
    other.registryUrl == registryUrl &&
    other.serverId == serverId &&
    other.stackPattern == stackPattern &&
    other.updatedAt == updatedAt &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (id.hashCode) +
    (imagePattern == null ? 0 : imagePattern!.hashCode) +
    (registryUrl.hashCode) +
    (serverId.hashCode) +
    (stackPattern.hashCode) +
    (updatedAt.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'RegistryCredentialResponse[createdAt=$createdAt, id=$id, imagePattern=$imagePattern, registryUrl=$registryUrl, serverId=$serverId, stackPattern=$stackPattern, updatedAt=$updatedAt, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'id'] = this.id;
    if (this.imagePattern != null) {
      json[r'image_pattern'] = this.imagePattern;
    } else {
      json[r'image_pattern'] = null;
    }
      json[r'registry_url'] = this.registryUrl;
      json[r'server_id'] = this.serverId;
      json[r'stack_pattern'] = this.stackPattern;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [RegistryCredentialResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegistryCredentialResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegistryCredentialResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegistryCredentialResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegistryCredentialResponse(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        id: mapValueOfType<int>(json, r'id')!,
        imagePattern: mapValueOfType<String>(json, r'image_pattern'),
        registryUrl: mapValueOfType<String>(json, r'registry_url')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        stackPattern: mapValueOfType<String>(json, r'stack_pattern')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<RegistryCredentialResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegistryCredentialResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegistryCredentialResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegistryCredentialResponse> mapFromJson(dynamic json) {
    final map = <String, RegistryCredentialResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegistryCredentialResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegistryCredentialResponse-objects as value to a dart map
  static Map<String, List<RegistryCredentialResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegistryCredentialResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RegistryCredentialResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'id',
    'registry_url',
    'server_id',
    'stack_pattern',
    'updated_at',
    'username',
  };
}

