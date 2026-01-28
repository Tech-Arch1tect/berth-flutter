//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TOTPStatusResponse {
  /// Returns a new [TOTPStatusResponse] instance.
  TOTPStatusResponse({
    required this.data,
    required this.success,
  });

  TOTPStatusData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TOTPStatusResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'TOTPStatusResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [TOTPStatusResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TOTPStatusResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TOTPStatusResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TOTPStatusResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TOTPStatusResponse(
        data: TOTPStatusData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<TOTPStatusResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TOTPStatusResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TOTPStatusResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TOTPStatusResponse> mapFromJson(dynamic json) {
    final map = <String, TOTPStatusResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TOTPStatusResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TOTPStatusResponse-objects as value to a dart map
  static Map<String, List<TOTPStatusResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TOTPStatusResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TOTPStatusResponse.listFromJson(entry.value, growable: growable,);
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

