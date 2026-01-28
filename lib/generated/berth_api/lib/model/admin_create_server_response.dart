//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AdminCreateServerResponse {
  /// Returns a new [AdminCreateServerResponse] instance.
  AdminCreateServerResponse({
    required this.data,
    required this.success,
  });

  AdminCreateServerResponseData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AdminCreateServerResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'AdminCreateServerResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [AdminCreateServerResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AdminCreateServerResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AdminCreateServerResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AdminCreateServerResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AdminCreateServerResponse(
        data: AdminCreateServerResponseData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<AdminCreateServerResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AdminCreateServerResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AdminCreateServerResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AdminCreateServerResponse> mapFromJson(dynamic json) {
    final map = <String, AdminCreateServerResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AdminCreateServerResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AdminCreateServerResponse-objects as value to a dart map
  static Map<String, List<AdminCreateServerResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AdminCreateServerResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AdminCreateServerResponse.listFromJson(entry.value, growable: growable,);
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

