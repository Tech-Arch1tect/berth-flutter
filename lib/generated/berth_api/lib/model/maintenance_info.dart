//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MaintenanceInfo {
  /// Returns a new [MaintenanceInfo] instance.
  MaintenanceInfo({
    required this.buildCacheSummary,
    required this.containerSummary,
    required this.diskUsage,
    required this.imageSummary,
    required this.lastUpdated,
    required this.networkSummary,
    required this.systemInfo,
    required this.volumeSummary,
  });

  BuildCacheSummary buildCacheSummary;

  ContainerSummary containerSummary;

  DiskUsage diskUsage;

  ImageSummary imageSummary;

  DateTime lastUpdated;

  NetworkSummary networkSummary;

  SystemInfo systemInfo;

  VolumeSummary volumeSummary;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MaintenanceInfo &&
    other.buildCacheSummary == buildCacheSummary &&
    other.containerSummary == containerSummary &&
    other.diskUsage == diskUsage &&
    other.imageSummary == imageSummary &&
    other.lastUpdated == lastUpdated &&
    other.networkSummary == networkSummary &&
    other.systemInfo == systemInfo &&
    other.volumeSummary == volumeSummary;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (buildCacheSummary.hashCode) +
    (containerSummary.hashCode) +
    (diskUsage.hashCode) +
    (imageSummary.hashCode) +
    (lastUpdated.hashCode) +
    (networkSummary.hashCode) +
    (systemInfo.hashCode) +
    (volumeSummary.hashCode);

  @override
  String toString() => 'MaintenanceInfo[buildCacheSummary=$buildCacheSummary, containerSummary=$containerSummary, diskUsage=$diskUsage, imageSummary=$imageSummary, lastUpdated=$lastUpdated, networkSummary=$networkSummary, systemInfo=$systemInfo, volumeSummary=$volumeSummary]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'build_cache_summary'] = this.buildCacheSummary;
      json[r'container_summary'] = this.containerSummary;
      json[r'disk_usage'] = this.diskUsage;
      json[r'image_summary'] = this.imageSummary;
      json[r'last_updated'] = this.lastUpdated.toUtc().toIso8601String();
      json[r'network_summary'] = this.networkSummary;
      json[r'system_info'] = this.systemInfo;
      json[r'volume_summary'] = this.volumeSummary;
    return json;
  }

  /// Returns a new [MaintenanceInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MaintenanceInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MaintenanceInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MaintenanceInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MaintenanceInfo(
        buildCacheSummary: BuildCacheSummary.fromJson(json[r'build_cache_summary'])!,
        containerSummary: ContainerSummary.fromJson(json[r'container_summary'])!,
        diskUsage: DiskUsage.fromJson(json[r'disk_usage'])!,
        imageSummary: ImageSummary.fromJson(json[r'image_summary'])!,
        lastUpdated: mapDateTime(json, r'last_updated', r'')!,
        networkSummary: NetworkSummary.fromJson(json[r'network_summary'])!,
        systemInfo: SystemInfo.fromJson(json[r'system_info'])!,
        volumeSummary: VolumeSummary.fromJson(json[r'volume_summary'])!,
      );
    }
    return null;
  }

  static List<MaintenanceInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MaintenanceInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MaintenanceInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MaintenanceInfo> mapFromJson(dynamic json) {
    final map = <String, MaintenanceInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MaintenanceInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MaintenanceInfo-objects as value to a dart map
  static Map<String, List<MaintenanceInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MaintenanceInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MaintenanceInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'build_cache_summary',
    'container_summary',
    'disk_usage',
    'image_summary',
    'last_updated',
    'network_summary',
    'system_info',
    'volume_summary',
  };
}

