//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RawComposeConfig {
  /// Returns a new [RawComposeConfig] instance.
  RawComposeConfig({
    required this.composeFile,
    this.configs = const {},
    this.networks = const {},
    this.secrets = const {},
    this.services = const {},
    this.volumes = const {},
  });

  String composeFile;

  Map<String, Object> configs;

  Map<String, Object> networks;

  Map<String, Object> secrets;

  Map<String, Object> services;

  Map<String, Object> volumes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RawComposeConfig &&
    other.composeFile == composeFile &&
    _deepEquality.equals(other.configs, configs) &&
    _deepEquality.equals(other.networks, networks) &&
    _deepEquality.equals(other.secrets, secrets) &&
    _deepEquality.equals(other.services, services) &&
    _deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (composeFile.hashCode) +
    (configs.hashCode) +
    (networks.hashCode) +
    (secrets.hashCode) +
    (services.hashCode) +
    (volumes.hashCode);

  @override
  String toString() => 'RawComposeConfig[composeFile=$composeFile, configs=$configs, networks=$networks, secrets=$secrets, services=$services, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'compose_file'] = this.composeFile;
      json[r'configs'] = this.configs;
      json[r'networks'] = this.networks;
      json[r'secrets'] = this.secrets;
      json[r'services'] = this.services;
      json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [RawComposeConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RawComposeConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RawComposeConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RawComposeConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RawComposeConfig(
        composeFile: mapValueOfType<String>(json, r'compose_file')!,
        configs: mapCastOfType<String, Object>(json, r'configs') ?? const {},
        networks: mapCastOfType<String, Object>(json, r'networks') ?? const {},
        secrets: mapCastOfType<String, Object>(json, r'secrets') ?? const {},
        services: mapCastOfType<String, Object>(json, r'services')!,
        volumes: mapCastOfType<String, Object>(json, r'volumes') ?? const {},
      );
    }
    return null;
  }

  static List<RawComposeConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RawComposeConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RawComposeConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RawComposeConfig> mapFromJson(dynamic json) {
    final map = <String, RawComposeConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RawComposeConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RawComposeConfig-objects as value to a dart map
  static Map<String, List<RawComposeConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RawComposeConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RawComposeConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'compose_file',
    'services',
  };
}

