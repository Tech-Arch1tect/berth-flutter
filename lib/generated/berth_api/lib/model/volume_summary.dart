//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VolumeSummary {
  /// Returns a new [VolumeSummary] instance.
  VolumeSummary({
    required this.totalCount,
    required this.totalSize,
    required this.unusedCount,
    required this.unusedSize,
    this.volumes = const [],
  });

  int totalCount;

  int totalSize;

  int unusedCount;

  int unusedSize;

  List<VolumeInfo> volumes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VolumeSummary &&
    other.totalCount == totalCount &&
    other.totalSize == totalSize &&
    other.unusedCount == unusedCount &&
    other.unusedSize == unusedSize &&
    _deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (totalCount.hashCode) +
    (totalSize.hashCode) +
    (unusedCount.hashCode) +
    (unusedSize.hashCode) +
    (volumes.hashCode);

  @override
  String toString() => 'VolumeSummary[totalCount=$totalCount, totalSize=$totalSize, unusedCount=$unusedCount, unusedSize=$unusedSize, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'total_count'] = this.totalCount;
      json[r'total_size'] = this.totalSize;
      json[r'unused_count'] = this.unusedCount;
      json[r'unused_size'] = this.unusedSize;
      json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [VolumeSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VolumeSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VolumeSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VolumeSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VolumeSummary(
        totalCount: mapValueOfType<int>(json, r'total_count')!,
        totalSize: mapValueOfType<int>(json, r'total_size')!,
        unusedCount: mapValueOfType<int>(json, r'unused_count')!,
        unusedSize: mapValueOfType<int>(json, r'unused_size')!,
        volumes: VolumeInfo.listFromJson(json[r'volumes']),
      );
    }
    return null;
  }

  static List<VolumeSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VolumeSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VolumeSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VolumeSummary> mapFromJson(dynamic json) {
    final map = <String, VolumeSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VolumeSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VolumeSummary-objects as value to a dart map
  static Map<String, List<VolumeSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VolumeSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VolumeSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'total_count',
    'total_size',
    'unused_count',
    'unused_size',
    'volumes',
  };
}

