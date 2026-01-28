//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerSummary {
  /// Returns a new [ContainerSummary] instance.
  ContainerSummary({
    this.containers = const [],
    required this.runningCount,
    required this.stoppedCount,
    required this.totalCount,
    required this.totalSize,
  });

  List<ContainerInfo> containers;

  int runningCount;

  int stoppedCount;

  int totalCount;

  int totalSize;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerSummary &&
    _deepEquality.equals(other.containers, containers) &&
    other.runningCount == runningCount &&
    other.stoppedCount == stoppedCount &&
    other.totalCount == totalCount &&
    other.totalSize == totalSize;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containers.hashCode) +
    (runningCount.hashCode) +
    (stoppedCount.hashCode) +
    (totalCount.hashCode) +
    (totalSize.hashCode);

  @override
  String toString() => 'ContainerSummary[containers=$containers, runningCount=$runningCount, stoppedCount=$stoppedCount, totalCount=$totalCount, totalSize=$totalSize]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'containers'] = this.containers;
      json[r'running_count'] = this.runningCount;
      json[r'stopped_count'] = this.stoppedCount;
      json[r'total_count'] = this.totalCount;
      json[r'total_size'] = this.totalSize;
    return json;
  }

  /// Returns a new [ContainerSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerSummary(
        containers: ContainerInfo.listFromJson(json[r'containers']),
        runningCount: mapValueOfType<int>(json, r'running_count')!,
        stoppedCount: mapValueOfType<int>(json, r'stopped_count')!,
        totalCount: mapValueOfType<int>(json, r'total_count')!,
        totalSize: mapValueOfType<int>(json, r'total_size')!,
      );
    }
    return null;
  }

  static List<ContainerSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerSummary> mapFromJson(dynamic json) {
    final map = <String, ContainerSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerSummary-objects as value to a dart map
  static Map<String, List<ContainerSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'containers',
    'running_count',
    'stopped_count',
    'total_count',
    'total_size',
  };
}

