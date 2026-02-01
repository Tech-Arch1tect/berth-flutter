//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationLogStatsData {
  /// Returns a new [OperationLogStatsData] instance.
  OperationLogStatsData({
    required this.failedOperations,
    required this.incompleteOperations,
    required this.recentOperations,
    required this.successfulOperations,
    required this.totalOperations,
  });

  int failedOperations;

  int incompleteOperations;

  int recentOperations;

  int successfulOperations;

  int totalOperations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationLogStatsData &&
    other.failedOperations == failedOperations &&
    other.incompleteOperations == incompleteOperations &&
    other.recentOperations == recentOperations &&
    other.successfulOperations == successfulOperations &&
    other.totalOperations == totalOperations;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (failedOperations.hashCode) +
    (incompleteOperations.hashCode) +
    (recentOperations.hashCode) +
    (successfulOperations.hashCode) +
    (totalOperations.hashCode);

  @override
  String toString() => 'OperationLogStatsData[failedOperations=$failedOperations, incompleteOperations=$incompleteOperations, recentOperations=$recentOperations, successfulOperations=$successfulOperations, totalOperations=$totalOperations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'failed_operations'] = this.failedOperations;
      json[r'incomplete_operations'] = this.incompleteOperations;
      json[r'recent_operations'] = this.recentOperations;
      json[r'successful_operations'] = this.successfulOperations;
      json[r'total_operations'] = this.totalOperations;
    return json;
  }

  /// Returns a new [OperationLogStatsData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationLogStatsData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OperationLogStatsData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OperationLogStatsData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OperationLogStatsData(
        failedOperations: mapValueOfType<int>(json, r'failed_operations')!,
        incompleteOperations: mapValueOfType<int>(json, r'incomplete_operations')!,
        recentOperations: mapValueOfType<int>(json, r'recent_operations')!,
        successfulOperations: mapValueOfType<int>(json, r'successful_operations')!,
        totalOperations: mapValueOfType<int>(json, r'total_operations')!,
      );
    }
    return null;
  }

  static List<OperationLogStatsData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationLogStatsData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationLogStatsData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationLogStatsData> mapFromJson(dynamic json) {
    final map = <String, OperationLogStatsData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationLogStatsData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationLogStatsData-objects as value to a dart map
  static Map<String, List<OperationLogStatsData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationLogStatsData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationLogStatsData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'failed_operations',
    'incomplete_operations',
    'recent_operations',
    'successful_operations',
    'total_operations',
  };
}

