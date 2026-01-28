//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackStatistics {
  /// Returns a new [StackStatistics] instance.
  StackStatistics({
    required this.healthyStacks,
    required this.totalStacks,
    required this.unhealthyStacks,
  });

  int healthyStacks;

  int totalStacks;

  int unhealthyStacks;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackStatistics &&
    other.healthyStacks == healthyStacks &&
    other.totalStacks == totalStacks &&
    other.unhealthyStacks == unhealthyStacks;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (healthyStacks.hashCode) +
    (totalStacks.hashCode) +
    (unhealthyStacks.hashCode);

  @override
  String toString() => 'StackStatistics[healthyStacks=$healthyStacks, totalStacks=$totalStacks, unhealthyStacks=$unhealthyStacks]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'healthy_stacks'] = this.healthyStacks;
      json[r'total_stacks'] = this.totalStacks;
      json[r'unhealthy_stacks'] = this.unhealthyStacks;
    return json;
  }

  /// Returns a new [StackStatistics] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackStatistics? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackStatistics[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackStatistics[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackStatistics(
        healthyStacks: mapValueOfType<int>(json, r'healthy_stacks')!,
        totalStacks: mapValueOfType<int>(json, r'total_stacks')!,
        unhealthyStacks: mapValueOfType<int>(json, r'unhealthy_stacks')!,
      );
    }
    return null;
  }

  static List<StackStatistics> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackStatistics>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackStatistics.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackStatistics> mapFromJson(dynamic json) {
    final map = <String, StackStatistics>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackStatistics.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackStatistics-objects as value to a dart map
  static Map<String, List<StackStatistics>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackStatistics>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackStatistics.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'healthy_stacks',
    'total_stacks',
    'unhealthy_stacks',
  };
}

