//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Container {
  /// Returns a new [Container] instance.
  Container({
    this.command = const [],
    this.created,
    this.exitCode,
    this.finished,
    this.health,
    required this.image,
    this.labels = const {},
    this.mounts = const [],
    required this.name,
    this.networks = const [],
    this.ports = const [],
    this.resourceLimits,
    this.restartPolicy,
    this.started,
    required this.state,
    this.user,
    this.workingDir,
  });

  List<String> command;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? created;

  int? exitCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? finished;

  HealthStatus? health;

  String image;

  Map<String, String> labels;

  List<ContainerMount> mounts;

  String name;

  List<ContainerNetwork> networks;

  List<Port> ports;

  ResourceLimits? resourceLimits;

  RestartPolicy? restartPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? started;

  String state;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workingDir;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Container &&
    _deepEquality.equals(other.command, command) &&
    other.created == created &&
    other.exitCode == exitCode &&
    other.finished == finished &&
    other.health == health &&
    other.image == image &&
    _deepEquality.equals(other.labels, labels) &&
    _deepEquality.equals(other.mounts, mounts) &&
    other.name == name &&
    _deepEquality.equals(other.networks, networks) &&
    _deepEquality.equals(other.ports, ports) &&
    other.resourceLimits == resourceLimits &&
    other.restartPolicy == restartPolicy &&
    other.started == started &&
    other.state == state &&
    other.user == user &&
    other.workingDir == workingDir;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (command.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (exitCode == null ? 0 : exitCode!.hashCode) +
    (finished == null ? 0 : finished!.hashCode) +
    (health == null ? 0 : health!.hashCode) +
    (image.hashCode) +
    (labels.hashCode) +
    (mounts.hashCode) +
    (name.hashCode) +
    (networks.hashCode) +
    (ports.hashCode) +
    (resourceLimits == null ? 0 : resourceLimits!.hashCode) +
    (restartPolicy == null ? 0 : restartPolicy!.hashCode) +
    (started == null ? 0 : started!.hashCode) +
    (state.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (workingDir == null ? 0 : workingDir!.hashCode);

  @override
  String toString() => 'Container[command=$command, created=$created, exitCode=$exitCode, finished=$finished, health=$health, image=$image, labels=$labels, mounts=$mounts, name=$name, networks=$networks, ports=$ports, resourceLimits=$resourceLimits, restartPolicy=$restartPolicy, started=$started, state=$state, user=$user, workingDir=$workingDir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'command'] = this.command;
    if (this.created != null) {
      json[r'created'] = this.created;
    } else {
      json[r'created'] = null;
    }
    if (this.exitCode != null) {
      json[r'exit_code'] = this.exitCode;
    } else {
      json[r'exit_code'] = null;
    }
    if (this.finished != null) {
      json[r'finished'] = this.finished;
    } else {
      json[r'finished'] = null;
    }
    if (this.health != null) {
      json[r'health'] = this.health;
    } else {
      json[r'health'] = null;
    }
      json[r'image'] = this.image;
      json[r'labels'] = this.labels;
      json[r'mounts'] = this.mounts;
      json[r'name'] = this.name;
      json[r'networks'] = this.networks;
      json[r'ports'] = this.ports;
    if (this.resourceLimits != null) {
      json[r'resource_limits'] = this.resourceLimits;
    } else {
      json[r'resource_limits'] = null;
    }
    if (this.restartPolicy != null) {
      json[r'restart_policy'] = this.restartPolicy;
    } else {
      json[r'restart_policy'] = null;
    }
    if (this.started != null) {
      json[r'started'] = this.started;
    } else {
      json[r'started'] = null;
    }
      json[r'state'] = this.state;
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.workingDir != null) {
      json[r'working_dir'] = this.workingDir;
    } else {
      json[r'working_dir'] = null;
    }
    return json;
  }

  /// Returns a new [Container] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Container? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Container[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Container[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Container(
        command: json[r'command'] is Iterable
            ? (json[r'command'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        created: mapValueOfType<String>(json, r'created'),
        exitCode: mapValueOfType<int>(json, r'exit_code'),
        finished: mapValueOfType<String>(json, r'finished'),
        health: HealthStatus.fromJson(json[r'health']),
        image: mapValueOfType<String>(json, r'image')!,
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        mounts: ContainerMount.listFromJson(json[r'mounts']),
        name: mapValueOfType<String>(json, r'name')!,
        networks: ContainerNetwork.listFromJson(json[r'networks']),
        ports: Port.listFromJson(json[r'ports']),
        resourceLimits: ResourceLimits.fromJson(json[r'resource_limits']),
        restartPolicy: RestartPolicy.fromJson(json[r'restart_policy']),
        started: mapValueOfType<String>(json, r'started'),
        state: mapValueOfType<String>(json, r'state')!,
        user: mapValueOfType<String>(json, r'user'),
        workingDir: mapValueOfType<String>(json, r'working_dir'),
      );
    }
    return null;
  }

  static List<Container> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Container>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Container.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Container> mapFromJson(dynamic json) {
    final map = <String, Container>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Container.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Container-objects as value to a dart map
  static Map<String, List<Container>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Container>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Container.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'image',
    'name',
    'state',
  };
}

