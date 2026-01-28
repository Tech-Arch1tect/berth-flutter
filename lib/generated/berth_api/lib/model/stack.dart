//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Stack {
  /// Returns a new [Stack] instance.
  Stack({
    required this.composeFile,
    required this.isHealthy,
    required this.name,
    required this.path,
    required this.runningContainers,
    required this.serverId,
    required this.serverName,
    required this.totalContainers,
  });

  String composeFile;

  bool isHealthy;

  String name;

  String path;

  int runningContainers;

  /// Minimum value: 0
  int serverId;

  String serverName;

  int totalContainers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stack &&
    other.composeFile == composeFile &&
    other.isHealthy == isHealthy &&
    other.name == name &&
    other.path == path &&
    other.runningContainers == runningContainers &&
    other.serverId == serverId &&
    other.serverName == serverName &&
    other.totalContainers == totalContainers;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (composeFile.hashCode) +
    (isHealthy.hashCode) +
    (name.hashCode) +
    (path.hashCode) +
    (runningContainers.hashCode) +
    (serverId.hashCode) +
    (serverName.hashCode) +
    (totalContainers.hashCode);

  @override
  String toString() => 'Stack[composeFile=$composeFile, isHealthy=$isHealthy, name=$name, path=$path, runningContainers=$runningContainers, serverId=$serverId, serverName=$serverName, totalContainers=$totalContainers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'compose_file'] = this.composeFile;
      json[r'is_healthy'] = this.isHealthy;
      json[r'name'] = this.name;
      json[r'path'] = this.path;
      json[r'running_containers'] = this.runningContainers;
      json[r'server_id'] = this.serverId;
      json[r'server_name'] = this.serverName;
      json[r'total_containers'] = this.totalContainers;
    return json;
  }

  /// Returns a new [Stack] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Stack? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Stack[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Stack[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Stack(
        composeFile: mapValueOfType<String>(json, r'compose_file')!,
        isHealthy: mapValueOfType<bool>(json, r'is_healthy')!,
        name: mapValueOfType<String>(json, r'name')!,
        path: mapValueOfType<String>(json, r'path')!,
        runningContainers: mapValueOfType<int>(json, r'running_containers')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        serverName: mapValueOfType<String>(json, r'server_name')!,
        totalContainers: mapValueOfType<int>(json, r'total_containers')!,
      );
    }
    return null;
  }

  static List<Stack> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Stack>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Stack.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Stack> mapFromJson(dynamic json) {
    final map = <String, Stack>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Stack.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Stack-objects as value to a dart map
  static Map<String, List<Stack>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Stack>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Stack.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'compose_file',
    'is_healthy',
    'name',
    'path',
    'running_containers',
    'server_id',
    'server_name',
    'total_containers',
  };
}

