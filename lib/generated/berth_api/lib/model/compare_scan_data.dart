//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CompareScanData {
  /// Returns a new [CompareScanData] instance.
  CompareScanData({
    required this.comparison,
  });

  ScanComparison comparison;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompareScanData &&
    other.comparison == comparison;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (comparison.hashCode);

  @override
  String toString() => 'CompareScanData[comparison=$comparison]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'comparison'] = this.comparison;
    return json;
  }

  /// Returns a new [CompareScanData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CompareScanData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CompareScanData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CompareScanData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CompareScanData(
        comparison: ScanComparison.fromJson(json[r'comparison'])!,
      );
    }
    return null;
  }

  static List<CompareScanData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompareScanData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompareScanData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CompareScanData> mapFromJson(dynamic json) {
    final map = <String, CompareScanData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompareScanData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CompareScanData-objects as value to a dart map
  static Map<String, List<CompareScanData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CompareScanData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CompareScanData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'comparison',
  };
}

