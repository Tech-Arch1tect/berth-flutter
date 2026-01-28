//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetLatestScanData {
  /// Returns a new [GetLatestScanData] instance.
  GetLatestScanData({
    required this.scan,
    required this.summary,
  });

  ImageScan scan;

  VulnerabilitySummary? summary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetLatestScanData &&
    other.scan == scan &&
    other.summary == summary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (scan.hashCode) +
    (summary == null ? 0 : summary!.hashCode);

  @override
  String toString() => 'GetLatestScanData[scan=$scan, summary=$summary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'scan'] = this.scan;
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    return json;
  }

  /// Returns a new [GetLatestScanData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetLatestScanData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetLatestScanData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetLatestScanData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetLatestScanData(
        scan: ImageScan.fromJson(json[r'scan'])!,
        summary: VulnerabilitySummary.fromJson(json[r'summary']),
      );
    }
    return null;
  }

  static List<GetLatestScanData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetLatestScanData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetLatestScanData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetLatestScanData> mapFromJson(dynamic json) {
    final map = <String, GetLatestScanData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetLatestScanData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetLatestScanData-objects as value to a dart map
  static Map<String, List<GetLatestScanData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetLatestScanData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetLatestScanData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'scan',
    'summary',
  };
}

