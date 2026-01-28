//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RevokeRoleRequest {
  /// Returns a new [RevokeRoleRequest] instance.
  RevokeRoleRequest({
    required this.roleId,
    required this.userId,
  });

  /// Minimum value: 0
  int roleId;

  /// Minimum value: 0
  int userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RevokeRoleRequest &&
    other.roleId == roleId &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (roleId.hashCode) +
    (userId.hashCode);

  @override
  String toString() => 'RevokeRoleRequest[roleId=$roleId, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'role_id'] = this.roleId;
      json[r'user_id'] = this.userId;
    return json;
  }

  /// Returns a new [RevokeRoleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RevokeRoleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RevokeRoleRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RevokeRoleRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RevokeRoleRequest(
        roleId: mapValueOfType<int>(json, r'role_id')!,
        userId: mapValueOfType<int>(json, r'user_id')!,
      );
    }
    return null;
  }

  static List<RevokeRoleRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RevokeRoleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RevokeRoleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RevokeRoleRequest> mapFromJson(dynamic json) {
    final map = <String, RevokeRoleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RevokeRoleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RevokeRoleRequest-objects as value to a dart map
  static Map<String, List<RevokeRoleRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RevokeRoleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RevokeRoleRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'role_id',
    'user_id',
  };
}

