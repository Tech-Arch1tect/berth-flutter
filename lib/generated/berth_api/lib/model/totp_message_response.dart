//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TOTPMessageResponse {
  /// Returns a new [TOTPMessageResponse] instance.
  TOTPMessageResponse({
    required this.data,
    required this.success,
  });

  TOTPMessageData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TOTPMessageResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'TOTPMessageResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [TOTPMessageResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TOTPMessageResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TOTPMessageResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TOTPMessageResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TOTPMessageResponse(
        data: TOTPMessageData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<TOTPMessageResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TOTPMessageResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TOTPMessageResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TOTPMessageResponse> mapFromJson(dynamic json) {
    final map = <String, TOTPMessageResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TOTPMessageResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TOTPMessageResponse-objects as value to a dart map
  static Map<String, List<TOTPMessageResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TOTPMessageResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TOTPMessageResponse.listFromJson(entry.value, growable: growable,);
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

