//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackPermissionsResponse {
  /// Returns a new [StackPermissionsResponse] instance.
  StackPermissionsResponse({
    required this.data,
    required this.success,
  });

  StackPermissionsData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackPermissionsResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'StackPermissionsResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [StackPermissionsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackPermissionsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackPermissionsResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackPermissionsResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackPermissionsResponse(
        data: StackPermissionsData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<StackPermissionsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackPermissionsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackPermissionsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackPermissionsResponse> mapFromJson(dynamic json) {
    final map = <String, StackPermissionsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackPermissionsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackPermissionsResponse-objects as value to a dart map
  static Map<String, List<StackPermissionsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackPermissionsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackPermissionsResponse.listFromJson(entry.value, growable: growable,);
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

