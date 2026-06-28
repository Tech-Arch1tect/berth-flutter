//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResponseStackVolumesData {
  /// Returns a new [ResponseStackVolumesData] instance.
  ResponseStackVolumesData({
    required this.data,
    this.error,
    this.meta,
    required this.success,
  });

  StackVolumesData data;

  Error? error;

  Meta? meta;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResponseStackVolumesData &&
    other.data == data &&
    other.error == error &&
    other.meta == meta &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (error == null ? 0 : error!.hashCode) +
    (meta == null ? 0 : meta!.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'ResponseStackVolumesData[data=$data, error=$error, meta=$meta, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [ResponseStackVolumesData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResponseStackVolumesData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResponseStackVolumesData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResponseStackVolumesData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResponseStackVolumesData(
        data: StackVolumesData.fromJson(json[r'data'])!,
        error: Error.fromJson(json[r'error']),
        meta: Meta.fromJson(json[r'meta']),
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<ResponseStackVolumesData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ResponseStackVolumesData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResponseStackVolumesData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResponseStackVolumesData> mapFromJson(dynamic json) {
    final map = <String, ResponseStackVolumesData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResponseStackVolumesData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResponseStackVolumesData-objects as value to a dart map
  static Map<String, List<ResponseStackVolumesData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResponseStackVolumesData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ResponseStackVolumesData.listFromJson(entry.value, growable: growable,);
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

