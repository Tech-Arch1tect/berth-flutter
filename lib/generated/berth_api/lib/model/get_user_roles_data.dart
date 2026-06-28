//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetUserRolesData {
  /// Returns a new [GetUserRolesData] instance.
  GetUserRolesData({
    this.allRoles = const [],
    required this.user,
  });

  List<RoleInfo> allRoles;

  UserInfo user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetUserRolesData &&
    _deepEquality.equals(other.allRoles, allRoles) &&
    other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (allRoles.hashCode) +
    (user.hashCode);

  @override
  String toString() => 'GetUserRolesData[allRoles=$allRoles, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'all_roles'] = this.allRoles;
      json[r'user'] = this.user;
    return json;
  }

  /// Returns a new [GetUserRolesData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetUserRolesData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetUserRolesData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetUserRolesData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetUserRolesData(
        allRoles: RoleInfo.listFromJson(json[r'all_roles']),
        user: UserInfo.fromJson(json[r'user'])!,
      );
    }
    return null;
  }

  static List<GetUserRolesData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetUserRolesData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetUserRolesData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetUserRolesData> mapFromJson(dynamic json) {
    final map = <String, GetUserRolesData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetUserRolesData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetUserRolesData-objects as value to a dart map
  static Map<String, List<GetUserRolesData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetUserRolesData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetUserRolesData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'all_roles',
    'user',
  };
}

