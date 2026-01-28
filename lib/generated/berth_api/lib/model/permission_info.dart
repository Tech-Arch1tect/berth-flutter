//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermissionInfo {
  /// Returns a new [PermissionInfo] instance.
  PermissionInfo({
    required this.action,
    required this.description,
    required this.id,
    required this.isApiKeyOnly,
    required this.name,
    required this.resource,
  });

  String action;

  String description;

  /// Minimum value: 0
  int id;

  bool isApiKeyOnly;

  String name;

  String resource;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermissionInfo &&
    other.action == action &&
    other.description == description &&
    other.id == id &&
    other.isApiKeyOnly == isApiKeyOnly &&
    other.name == name &&
    other.resource == resource;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action.hashCode) +
    (description.hashCode) +
    (id.hashCode) +
    (isApiKeyOnly.hashCode) +
    (name.hashCode) +
    (resource.hashCode);

  @override
  String toString() => 'PermissionInfo[action=$action, description=$description, id=$id, isApiKeyOnly=$isApiKeyOnly, name=$name, resource=$resource]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'action'] = this.action;
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'is_api_key_only'] = this.isApiKeyOnly;
      json[r'name'] = this.name;
      json[r'resource'] = this.resource;
    return json;
  }

  /// Returns a new [PermissionInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermissionInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PermissionInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PermissionInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PermissionInfo(
        action: mapValueOfType<String>(json, r'action')!,
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<int>(json, r'id')!,
        isApiKeyOnly: mapValueOfType<bool>(json, r'is_api_key_only')!,
        name: mapValueOfType<String>(json, r'name')!,
        resource: mapValueOfType<String>(json, r'resource')!,
      );
    }
    return null;
  }

  static List<PermissionInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermissionInfo> mapFromJson(dynamic json) {
    final map = <String, PermissionInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermissionInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermissionInfo-objects as value to a dart map
  static Map<String, List<PermissionInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermissionInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermissionInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'action',
    'description',
    'id',
    'is_api_key_only',
    'name',
    'resource',
  };
}

