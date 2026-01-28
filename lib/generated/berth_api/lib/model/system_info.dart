//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SystemInfo {
  /// Returns a new [SystemInfo] instance.
  SystemInfo({
    required this.apiVersion,
    required this.architecture,
    required this.dockerRootDir,
    required this.kernelVersion,
    required this.ncpu,
    required this.os,
    required this.serverVersion,
    required this.storageDriver,
    required this.totalMemory,
    required this.version,
  });

  String apiVersion;

  String architecture;

  String dockerRootDir;

  String kernelVersion;

  int ncpu;

  String os;

  String serverVersion;

  String storageDriver;

  int totalMemory;

  String version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SystemInfo &&
    other.apiVersion == apiVersion &&
    other.architecture == architecture &&
    other.dockerRootDir == dockerRootDir &&
    other.kernelVersion == kernelVersion &&
    other.ncpu == ncpu &&
    other.os == os &&
    other.serverVersion == serverVersion &&
    other.storageDriver == storageDriver &&
    other.totalMemory == totalMemory &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (apiVersion.hashCode) +
    (architecture.hashCode) +
    (dockerRootDir.hashCode) +
    (kernelVersion.hashCode) +
    (ncpu.hashCode) +
    (os.hashCode) +
    (serverVersion.hashCode) +
    (storageDriver.hashCode) +
    (totalMemory.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'SystemInfo[apiVersion=$apiVersion, architecture=$architecture, dockerRootDir=$dockerRootDir, kernelVersion=$kernelVersion, ncpu=$ncpu, os=$os, serverVersion=$serverVersion, storageDriver=$storageDriver, totalMemory=$totalMemory, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'api_version'] = this.apiVersion;
      json[r'architecture'] = this.architecture;
      json[r'docker_root_dir'] = this.dockerRootDir;
      json[r'kernel_version'] = this.kernelVersion;
      json[r'ncpu'] = this.ncpu;
      json[r'os'] = this.os;
      json[r'server_version'] = this.serverVersion;
      json[r'storage_driver'] = this.storageDriver;
      json[r'total_memory'] = this.totalMemory;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [SystemInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SystemInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SystemInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SystemInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SystemInfo(
        apiVersion: mapValueOfType<String>(json, r'api_version')!,
        architecture: mapValueOfType<String>(json, r'architecture')!,
        dockerRootDir: mapValueOfType<String>(json, r'docker_root_dir')!,
        kernelVersion: mapValueOfType<String>(json, r'kernel_version')!,
        ncpu: mapValueOfType<int>(json, r'ncpu')!,
        os: mapValueOfType<String>(json, r'os')!,
        serverVersion: mapValueOfType<String>(json, r'server_version')!,
        storageDriver: mapValueOfType<String>(json, r'storage_driver')!,
        totalMemory: mapValueOfType<int>(json, r'total_memory')!,
        version: mapValueOfType<String>(json, r'version')!,
      );
    }
    return null;
  }

  static List<SystemInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SystemInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SystemInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SystemInfo> mapFromJson(dynamic json) {
    final map = <String, SystemInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SystemInfo-objects as value to a dart map
  static Map<String, List<SystemInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SystemInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SystemInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'api_version',
    'architecture',
    'docker_root_dir',
    'kernel_version',
    'ncpu',
    'os',
    'server_version',
    'storage_driver',
    'total_memory',
    'version',
  };
}

