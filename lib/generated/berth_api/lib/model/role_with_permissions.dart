//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleWithPermissions {
  /// Returns a new [RoleWithPermissions] instance.
  RoleWithPermissions({
    required this.description,
    required this.id,
    required this.isAdmin,
    required this.name,
    this.permissions = const [],
  });

  String description;

  /// Minimum value: 0
  int id;

  bool isAdmin;

  String name;

  List<PermissionInfo> permissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RoleWithPermissions &&
    other.description == description &&
    other.id == id &&
    other.isAdmin == isAdmin &&
    other.name == name &&
    _deepEquality.equals(other.permissions, permissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (id.hashCode) +
    (isAdmin.hashCode) +
    (name.hashCode) +
    (permissions.hashCode);

  @override
  String toString() => 'RoleWithPermissions[description=$description, id=$id, isAdmin=$isAdmin, name=$name, permissions=$permissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'is_admin'] = this.isAdmin;
      json[r'name'] = this.name;
      json[r'permissions'] = this.permissions;
    return json;
  }

  /// Returns a new [RoleWithPermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoleWithPermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RoleWithPermissions[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RoleWithPermissions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoleWithPermissions(
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<int>(json, r'id')!,
        isAdmin: mapValueOfType<bool>(json, r'is_admin')!,
        name: mapValueOfType<String>(json, r'name')!,
        permissions: PermissionInfo.listFromJson(json[r'permissions']),
      );
    }
    return null;
  }

  static List<RoleWithPermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RoleWithPermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleWithPermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoleWithPermissions> mapFromJson(dynamic json) {
    final map = <String, RoleWithPermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoleWithPermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoleWithPermissions-objects as value to a dart map
  static Map<String, List<RoleWithPermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RoleWithPermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RoleWithPermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
    'is_admin',
    'name',
    'permissions',
  };
}

