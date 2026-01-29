//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    required this.createdAt,
    this.deletedAt,
    required this.email,
    this.emailVerifiedAt,
    required this.id,
    this.lastLoginAt,
    this.roles = const [],
    required this.updatedAt,
    required this.username,
  });

  DateTime createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DeletedAt? deletedAt;

  String email;

  DateTime? emailVerifiedAt;

  /// Minimum value: 0
  int id;

  DateTime? lastLoginAt;

  List<Role> roles;

  DateTime updatedAt;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.email == email &&
    other.emailVerifiedAt == emailVerifiedAt &&
    other.id == id &&
    other.lastLoginAt == lastLoginAt &&
    _deepEquality.equals(other.roles, roles) &&
    other.updatedAt == updatedAt &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (email.hashCode) +
    (emailVerifiedAt == null ? 0 : emailVerifiedAt!.hashCode) +
    (id.hashCode) +
    (lastLoginAt == null ? 0 : lastLoginAt!.hashCode) +
    (roles.hashCode) +
    (updatedAt.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'User[createdAt=$createdAt, deletedAt=$deletedAt, email=$email, emailVerifiedAt=$emailVerifiedAt, id=$id, lastLoginAt=$lastLoginAt, roles=$roles, updatedAt=$updatedAt, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
    if (this.deletedAt != null) {
      json[r'deleted_at'] = this.deletedAt;
    } else {
      json[r'deleted_at'] = null;
    }
      json[r'email'] = this.email;
    if (this.emailVerifiedAt != null) {
      json[r'email_verified_at'] = this.emailVerifiedAt!.toUtc().toIso8601String();
    } else {
      json[r'email_verified_at'] = null;
    }
      json[r'id'] = this.id;
    if (this.lastLoginAt != null) {
      json[r'last_login_at'] = this.lastLoginAt!.toUtc().toIso8601String();
    } else {
      json[r'last_login_at'] = null;
    }
      json[r'roles'] = this.roles;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "User[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "User[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return User(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at']),
        email: mapValueOfType<String>(json, r'email')!,
        emailVerifiedAt: mapDateTime(json, r'email_verified_at', r''),
        id: mapValueOfType<int>(json, r'id')!,
        lastLoginAt: mapDateTime(json, r'last_login_at', r''),
        roles: Role.listFromJson(json[r'roles']),
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<User> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = User.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'email',
    'id',
    'updated_at',
    'username',
  };
}

