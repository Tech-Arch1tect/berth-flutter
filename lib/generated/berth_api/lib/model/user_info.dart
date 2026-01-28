//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserInfo {
  /// Returns a new [UserInfo] instance.
  UserInfo({
    required this.createdAt,
    required this.email,
    required this.emailVerifiedAt,
    required this.id,
    required this.lastLoginAt,
    this.roles = const [],
    required this.totpEnabled,
    required this.updatedAt,
    required this.username,
  });

  String createdAt;

  String email;

  String? emailVerifiedAt;

  /// Minimum value: 0
  int id;

  String? lastLoginAt;

  List<RoleInfo> roles;

  bool totpEnabled;

  String updatedAt;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserInfo &&
    other.createdAt == createdAt &&
    other.email == email &&
    other.emailVerifiedAt == emailVerifiedAt &&
    other.id == id &&
    other.lastLoginAt == lastLoginAt &&
    _deepEquality.equals(other.roles, roles) &&
    other.totpEnabled == totpEnabled &&
    other.updatedAt == updatedAt &&
    other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (email.hashCode) +
    (emailVerifiedAt == null ? 0 : emailVerifiedAt!.hashCode) +
    (id.hashCode) +
    (lastLoginAt == null ? 0 : lastLoginAt!.hashCode) +
    (roles.hashCode) +
    (totpEnabled.hashCode) +
    (updatedAt.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'UserInfo[createdAt=$createdAt, email=$email, emailVerifiedAt=$emailVerifiedAt, id=$id, lastLoginAt=$lastLoginAt, roles=$roles, totpEnabled=$totpEnabled, updatedAt=$updatedAt, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt;
      json[r'email'] = this.email;
    if (this.emailVerifiedAt != null) {
      json[r'email_verified_at'] = this.emailVerifiedAt;
    } else {
      json[r'email_verified_at'] = null;
    }
      json[r'id'] = this.id;
    if (this.lastLoginAt != null) {
      json[r'last_login_at'] = this.lastLoginAt;
    } else {
      json[r'last_login_at'] = null;
    }
      json[r'roles'] = this.roles;
      json[r'totp_enabled'] = this.totpEnabled;
      json[r'updated_at'] = this.updatedAt;
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [UserInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserInfo(
        createdAt: mapValueOfType<String>(json, r'created_at')!,
        email: mapValueOfType<String>(json, r'email')!,
        emailVerifiedAt: mapValueOfType<String>(json, r'email_verified_at'),
        id: mapValueOfType<int>(json, r'id')!,
        lastLoginAt: mapValueOfType<String>(json, r'last_login_at'),
        roles: RoleInfo.listFromJson(json[r'roles']),
        totpEnabled: mapValueOfType<bool>(json, r'totp_enabled')!,
        updatedAt: mapValueOfType<String>(json, r'updated_at')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<UserInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserInfo> mapFromJson(dynamic json) {
    final map = <String, UserInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserInfo-objects as value to a dart map
  static Map<String, List<UserInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'email',
    'email_verified_at',
    'id',
    'last_login_at',
    'roles',
    'totp_enabled',
    'updated_at',
    'username',
  };
}

