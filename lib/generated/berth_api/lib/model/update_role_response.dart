//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateRoleResponse {
  /// Returns a new [UpdateRoleResponse] instance.
  UpdateRoleResponse({
    required this.data,
    required this.success,
  });

  RoleWithPermissions data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateRoleResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'UpdateRoleResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [UpdateRoleResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateRoleResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateRoleResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateRoleResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateRoleResponse(
        data: RoleWithPermissions.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<UpdateRoleResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateRoleResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateRoleResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateRoleResponse> mapFromJson(dynamic json) {
    final map = <String, UpdateRoleResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateRoleResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateRoleResponse-objects as value to a dart map
  static Map<String, List<UpdateRoleResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateRoleResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateRoleResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'data',
    'success',
  };
}

