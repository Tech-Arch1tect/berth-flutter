//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CanCreateStackResponse {
  /// Returns a new [CanCreateStackResponse] instance.
  CanCreateStackResponse({
    required this.data,
    required this.success,
  });

  CanCreateStackData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CanCreateStackResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'CanCreateStackResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [CanCreateStackResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CanCreateStackResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CanCreateStackResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CanCreateStackResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CanCreateStackResponse(
        data: CanCreateStackData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<CanCreateStackResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CanCreateStackResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CanCreateStackResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CanCreateStackResponse> mapFromJson(dynamic json) {
    final map = <String, CanCreateStackResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CanCreateStackResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CanCreateStackResponse-objects as value to a dart map
  static Map<String, List<CanCreateStackResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CanCreateStackResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CanCreateStackResponse.listFromJson(entry.value, growable: growable,);
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

