//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetScanData {
  /// Returns a new [GetScanData] instance.
  GetScanData({
    required this.scan,
  });

  ImageScan scan;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetScanData &&
    other.scan == scan;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (scan.hashCode);

  @override
  String toString() => 'GetScanData[scan=$scan]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'scan'] = this.scan;
    return json;
  }

  /// Returns a new [GetScanData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetScanData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetScanData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetScanData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetScanData(
        scan: ImageScan.fromJson(json[r'scan'])!,
      );
    }
    return null;
  }

  static List<GetScanData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetScanData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetScanData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetScanData> mapFromJson(dynamic json) {
    final map = <String, GetScanData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetScanData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetScanData-objects as value to a dart map
  static Map<String, List<GetScanData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetScanData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetScanData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'scan',
  };
}

