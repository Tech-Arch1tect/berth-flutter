//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetScanTrendData {
  /// Returns a new [GetScanTrendData] instance.
  GetScanTrendData({
    this.perImageTrend = const [],
    this.scopeWarning,
    this.stackTrend = const [],
  });

  List<PerImageTrend> perImageTrend;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scopeWarning;

  List<ScanTrendPoint> stackTrend;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetScanTrendData &&
    _deepEquality.equals(other.perImageTrend, perImageTrend) &&
    other.scopeWarning == scopeWarning &&
    _deepEquality.equals(other.stackTrend, stackTrend);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (perImageTrend.hashCode) +
    (scopeWarning == null ? 0 : scopeWarning!.hashCode) +
    (stackTrend.hashCode);

  @override
  String toString() => 'GetScanTrendData[perImageTrend=$perImageTrend, scopeWarning=$scopeWarning, stackTrend=$stackTrend]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'per_image_trend'] = this.perImageTrend;
    if (this.scopeWarning != null) {
      json[r'scope_warning'] = this.scopeWarning;
    } else {
      json[r'scope_warning'] = null;
    }
      json[r'stack_trend'] = this.stackTrend;
    return json;
  }

  /// Returns a new [GetScanTrendData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetScanTrendData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetScanTrendData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetScanTrendData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetScanTrendData(
        perImageTrend: PerImageTrend.listFromJson(json[r'per_image_trend']),
        scopeWarning: mapValueOfType<String>(json, r'scope_warning'),
        stackTrend: ScanTrendPoint.listFromJson(json[r'stack_trend']),
      );
    }
    return null;
  }

  static List<GetScanTrendData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetScanTrendData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetScanTrendData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetScanTrendData> mapFromJson(dynamic json) {
    final map = <String, GetScanTrendData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetScanTrendData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetScanTrendData-objects as value to a dart map
  static Map<String, List<GetScanTrendData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetScanTrendData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetScanTrendData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'per_image_trend',
    'stack_trend',
  };
}

