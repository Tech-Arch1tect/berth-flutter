//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceChanges {
  /// Returns a new [ServiceChanges] instance.
  ServiceChanges({
    this.build,
    this.command,
    this.dependsOn = const {},
    this.deploy,
    this.entrypoint,
    this.environment = const {},
    this.healthcheck,
    this.image,
    this.labels = const {},
    this.networks = const {},
    this.ports = const [],
    this.restart,
    this.volumes = const [],
  });

  BuildConfig? build;

  CommandConfig? command;

  Map<String, DependsOnConfig> dependsOn;

  DeployConfig? deploy;

  CommandConfig? entrypoint;

  Map<String, String> environment;

  HealthcheckConfig? healthcheck;

  String? image;

  Map<String, String> labels;

  Map<String, ServiceNetworkConfig> networks;

  List<PortMapping> ports;

  String? restart;

  List<VolumeMount2> volumes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceChanges &&
    other.build == build &&
    other.command == command &&
    _deepEquality.equals(other.dependsOn, dependsOn) &&
    other.deploy == deploy &&
    other.entrypoint == entrypoint &&
    _deepEquality.equals(other.environment, environment) &&
    other.healthcheck == healthcheck &&
    other.image == image &&
    _deepEquality.equals(other.labels, labels) &&
    _deepEquality.equals(other.networks, networks) &&
    _deepEquality.equals(other.ports, ports) &&
    other.restart == restart &&
    _deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (build == null ? 0 : build!.hashCode) +
    (command == null ? 0 : command!.hashCode) +
    (dependsOn.hashCode) +
    (deploy == null ? 0 : deploy!.hashCode) +
    (entrypoint == null ? 0 : entrypoint!.hashCode) +
    (environment.hashCode) +
    (healthcheck == null ? 0 : healthcheck!.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (labels.hashCode) +
    (networks.hashCode) +
    (ports.hashCode) +
    (restart == null ? 0 : restart!.hashCode) +
    (volumes.hashCode);

  @override
  String toString() => 'ServiceChanges[build=$build, command=$command, dependsOn=$dependsOn, deploy=$deploy, entrypoint=$entrypoint, environment=$environment, healthcheck=$healthcheck, image=$image, labels=$labels, networks=$networks, ports=$ports, restart=$restart, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.build != null) {
      json[r'build'] = this.build;
    } else {
      json[r'build'] = null;
    }
    if (this.command != null) {
      json[r'command'] = this.command;
    } else {
      json[r'command'] = null;
    }
      json[r'depends_on'] = this.dependsOn;
    if (this.deploy != null) {
      json[r'deploy'] = this.deploy;
    } else {
      json[r'deploy'] = null;
    }
    if (this.entrypoint != null) {
      json[r'entrypoint'] = this.entrypoint;
    } else {
      json[r'entrypoint'] = null;
    }
      json[r'environment'] = this.environment;
    if (this.healthcheck != null) {
      json[r'healthcheck'] = this.healthcheck;
    } else {
      json[r'healthcheck'] = null;
    }
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
      json[r'labels'] = this.labels;
      json[r'networks'] = this.networks;
      json[r'ports'] = this.ports;
    if (this.restart != null) {
      json[r'restart'] = this.restart;
    } else {
      json[r'restart'] = null;
    }
      json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [ServiceChanges] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceChanges? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServiceChanges[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServiceChanges[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServiceChanges(
        build: BuildConfig.fromJson(json[r'build']),
        command: CommandConfig.fromJson(json[r'command']),
        dependsOn: DependsOnConfig.mapFromJson(json[r'depends_on']),
        deploy: DeployConfig.fromJson(json[r'deploy']),
        entrypoint: CommandConfig.fromJson(json[r'entrypoint']),
        environment: mapCastOfType<String, String>(json, r'environment') ?? const {},
        healthcheck: HealthcheckConfig.fromJson(json[r'healthcheck']),
        image: mapValueOfType<String>(json, r'image'),
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        networks: ServiceNetworkConfig.mapFromJson(json[r'networks']),
        ports: PortMapping.listFromJson(json[r'ports']),
        restart: mapValueOfType<String>(json, r'restart'),
        volumes: VolumeMount2.listFromJson(json[r'volumes']),
      );
    }
    return null;
  }

  static List<ServiceChanges> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceChanges>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceChanges.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceChanges> mapFromJson(dynamic json) {
    final map = <String, ServiceChanges>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceChanges.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceChanges-objects as value to a dart map
  static Map<String, List<ServiceChanges>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceChanges>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceChanges.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

