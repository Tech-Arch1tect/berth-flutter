//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackDetails {
  /// Returns a new [StackDetails] instance.
  StackDetails({
    required this.composeFile,
    required this.name,
    required this.path,
    required this.serverId,
    required this.serverName,
    this.services = const [],
  });

  String composeFile;

  String name;

  String path;

  /// Minimum value: 0
  int serverId;

  String serverName;

  List<ComposeService> services;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackDetails &&
    other.composeFile == composeFile &&
    other.name == name &&
    other.path == path &&
    other.serverId == serverId &&
    other.serverName == serverName &&
    _deepEquality.equals(other.services, services);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (composeFile.hashCode) +
    (name.hashCode) +
    (path.hashCode) +
    (serverId.hashCode) +
    (serverName.hashCode) +
    (services.hashCode);

  @override
  String toString() => 'StackDetails[composeFile=$composeFile, name=$name, path=$path, serverId=$serverId, serverName=$serverName, services=$services]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'compose_file'] = this.composeFile;
      json[r'name'] = this.name;
      json[r'path'] = this.path;
      json[r'server_id'] = this.serverId;
      json[r'server_name'] = this.serverName;
      json[r'services'] = this.services;
    return json;
  }

  /// Returns a new [StackDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackDetails(
        composeFile: mapValueOfType<String>(json, r'compose_file')!,
        name: mapValueOfType<String>(json, r'name')!,
        path: mapValueOfType<String>(json, r'path')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        serverName: mapValueOfType<String>(json, r'server_name')!,
        services: ComposeService.listFromJson(json[r'services']),
      );
    }
    return null;
  }

  static List<StackDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackDetails> mapFromJson(dynamic json) {
    final map = <String, StackDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackDetails-objects as value to a dart map
  static Map<String, List<StackDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'compose_file',
    'name',
    'path',
    'server_id',
    'server_name',
    'services',
  };
}

