//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackHealthDetails {
  /// Returns a new [StackHealthDetails] instance.
  StackHealthDetails({
    required this.healthyCount,
    required this.percentage,
    this.reasons = const [],
    required this.stoppedCount,
    required this.unhealthyCount,
  });

  int healthyCount;

  int percentage;

  List<String> reasons;

  int stoppedCount;

  int unhealthyCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackHealthDetails &&
    other.healthyCount == healthyCount &&
    other.percentage == percentage &&
    _deepEquality.equals(other.reasons, reasons) &&
    other.stoppedCount == stoppedCount &&
    other.unhealthyCount == unhealthyCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (healthyCount.hashCode) +
    (percentage.hashCode) +
    (reasons.hashCode) +
    (stoppedCount.hashCode) +
    (unhealthyCount.hashCode);

  @override
  String toString() => 'StackHealthDetails[healthyCount=$healthyCount, percentage=$percentage, reasons=$reasons, stoppedCount=$stoppedCount, unhealthyCount=$unhealthyCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'healthy_count'] = this.healthyCount;
      json[r'percentage'] = this.percentage;
      json[r'reasons'] = this.reasons;
      json[r'stopped_count'] = this.stoppedCount;
      json[r'unhealthy_count'] = this.unhealthyCount;
    return json;
  }

  /// Returns a new [StackHealthDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackHealthDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackHealthDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackHealthDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackHealthDetails(
        healthyCount: mapValueOfType<int>(json, r'healthy_count')!,
        percentage: mapValueOfType<int>(json, r'percentage')!,
        reasons: json[r'reasons'] is Iterable
            ? (json[r'reasons'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        stoppedCount: mapValueOfType<int>(json, r'stopped_count')!,
        unhealthyCount: mapValueOfType<int>(json, r'unhealthy_count')!,
      );
    }
    return null;
  }

  static List<StackHealthDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackHealthDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackHealthDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackHealthDetails> mapFromJson(dynamic json) {
    final map = <String, StackHealthDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackHealthDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackHealthDetails-objects as value to a dart map
  static Map<String, List<StackHealthDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackHealthDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackHealthDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'healthy_count',
    'percentage',
    'reasons',
    'stopped_count',
    'unhealthy_count',
  };
}

