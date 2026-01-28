//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListRolesResponseData {
  /// Returns a new [ListRolesResponseData] instance.
  ListRolesResponseData({
    this.roles = const [],
  });

  List<RoleWithPermissions> roles;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListRolesResponseData &&
    _deepEquality.equals(other.roles, roles);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (roles.hashCode);

  @override
  String toString() => 'ListRolesResponseData[roles=$roles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'roles'] = this.roles;
    return json;
  }

  /// Returns a new [ListRolesResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListRolesResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ListRolesResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListRolesResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ListRolesResponseData(
        roles: RoleWithPermissions.listFromJson(json[r'roles']),
      );
    }
    return null;
  }

  static List<ListRolesResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListRolesResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListRolesResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListRolesResponseData> mapFromJson(dynamic json) {
    final map = <String, ListRolesResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListRolesResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListRolesResponseData-objects as value to a dart map
  static Map<String, List<ListRolesResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListRolesResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListRolesResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'roles',
  };
}

