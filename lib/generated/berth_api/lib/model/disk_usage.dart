//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DiskUsage {
  /// Returns a new [DiskUsage] instance.
  DiskUsage({
    required this.buildCacheSize,
    required this.containersSize,
    required this.imagesSize,
    required this.layersSize,
    required this.totalSize,
    required this.volumesSize,
  });

  int buildCacheSize;

  int containersSize;

  int imagesSize;

  int layersSize;

  int totalSize;

  int volumesSize;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DiskUsage &&
    other.buildCacheSize == buildCacheSize &&
    other.containersSize == containersSize &&
    other.imagesSize == imagesSize &&
    other.layersSize == layersSize &&
    other.totalSize == totalSize &&
    other.volumesSize == volumesSize;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (buildCacheSize.hashCode) +
    (containersSize.hashCode) +
    (imagesSize.hashCode) +
    (layersSize.hashCode) +
    (totalSize.hashCode) +
    (volumesSize.hashCode);

  @override
  String toString() => 'DiskUsage[buildCacheSize=$buildCacheSize, containersSize=$containersSize, imagesSize=$imagesSize, layersSize=$layersSize, totalSize=$totalSize, volumesSize=$volumesSize]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'build_cache_size'] = this.buildCacheSize;
      json[r'containers_size'] = this.containersSize;
      json[r'images_size'] = this.imagesSize;
      json[r'layers_size'] = this.layersSize;
      json[r'total_size'] = this.totalSize;
      json[r'volumes_size'] = this.volumesSize;
    return json;
  }

  /// Returns a new [DiskUsage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DiskUsage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DiskUsage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DiskUsage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DiskUsage(
        buildCacheSize: mapValueOfType<int>(json, r'build_cache_size')!,
        containersSize: mapValueOfType<int>(json, r'containers_size')!,
        imagesSize: mapValueOfType<int>(json, r'images_size')!,
        layersSize: mapValueOfType<int>(json, r'layers_size')!,
        totalSize: mapValueOfType<int>(json, r'total_size')!,
        volumesSize: mapValueOfType<int>(json, r'volumes_size')!,
      );
    }
    return null;
  }

  static List<DiskUsage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DiskUsage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DiskUsage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DiskUsage> mapFromJson(dynamic json) {
    final map = <String, DiskUsage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DiskUsage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DiskUsage-objects as value to a dart map
  static Map<String, List<DiskUsage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DiskUsage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DiskUsage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'build_cache_size',
    'containers_size',
    'images_size',
    'layers_size',
    'total_size',
    'volumes_size',
  };
}

