//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetScansHistoryData {
  /// Returns a new [GetScansHistoryData] instance.
  GetScansHistoryData({
    this.scans = const [],
  });

  List<ScanWithSummary> scans;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetScansHistoryData &&
    _deepEquality.equals(other.scans, scans);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (scans.hashCode);

  @override
  String toString() => 'GetScansHistoryData[scans=$scans]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'scans'] = this.scans;
    return json;
  }

  /// Returns a new [GetScansHistoryData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetScansHistoryData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetScansHistoryData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetScansHistoryData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetScansHistoryData(
        scans: ScanWithSummary.listFromJson(json[r'scans']),
      );
    }
    return null;
  }

  static List<GetScansHistoryData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetScansHistoryData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetScansHistoryData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetScansHistoryData> mapFromJson(dynamic json) {
    final map = <String, GetScansHistoryData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetScansHistoryData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetScansHistoryData-objects as value to a dart map
  static Map<String, List<GetScansHistoryData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetScansHistoryData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetScansHistoryData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'scans',
  };
}

