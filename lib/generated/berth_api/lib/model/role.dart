//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Role {
  /// Returns a new [Role] instance.
  Role({
    required this.createdAt,
    this.deletedAt,
    required this.description,
    required this.id,
    required this.isAdmin,
    required this.name,
    required this.updatedAt,
    this.users = const [],
  });

  DateTime createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DeletedAt? deletedAt;

  String description;

  /// Minimum value: 0
  int id;

  bool isAdmin;

  String name;

  DateTime updatedAt;

  List<User> users;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Role &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.description == description &&
    other.id == id &&
    other.isAdmin == isAdmin &&
    other.name == name &&
    other.updatedAt == updatedAt &&
    _deepEquality.equals(other.users, users);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (description.hashCode) +
    (id.hashCode) +
    (isAdmin.hashCode) +
    (name.hashCode) +
    (updatedAt.hashCode) +
    (users.hashCode);

  @override
  String toString() => 'Role[createdAt=$createdAt, deletedAt=$deletedAt, description=$description, id=$id, isAdmin=$isAdmin, name=$name, updatedAt=$updatedAt, users=$users]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
    if (this.deletedAt != null) {
      json[r'deleted_at'] = this.deletedAt;
    } else {
      json[r'deleted_at'] = null;
    }
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'is_admin'] = this.isAdmin;
      json[r'name'] = this.name;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'users'] = this.users;
    return json;
  }

  /// Returns a new [Role] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Role? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Role[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Role[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Role(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at']),
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<int>(json, r'id')!,
        isAdmin: mapValueOfType<bool>(json, r'is_admin')!,
        name: mapValueOfType<String>(json, r'name')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        users: User.listFromJson(json[r'users']),
      );
    }
    return null;
  }

  static List<Role> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Role>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Role.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Role> mapFromJson(dynamic json) {
    final map = <String, Role>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Role.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Role-objects as value to a dart map
  static Map<String, List<Role>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Role>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Role.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'description',
    'id',
    'is_admin',
    'name',
    'updated_at',
    'users',
  };
}

