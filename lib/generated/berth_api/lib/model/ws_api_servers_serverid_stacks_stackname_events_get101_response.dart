//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WsApiServersServeridStacksStacknameEventsGet101Response {
  /// Returns a new [WsApiServersServeridStacksStacknameEventsGet101Response] instance.
  WsApiServersServeridStacksStacknameEventsGet101Response({
    required this.containerId,
    required this.containerName,
    this.health,
    required this.image,
    this.ports = const [],
    required this.serverId,
    required this.serviceName,
    required this.stackName,
    required this.status,
    required this.timestamp,
    required this.type,
    required this.running,
    required this.services,
    required this.stopped,
  });

  String containerId;

  String containerName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? health;

  String image;

  List<Port> ports;

  int serverId;

  String serviceName;

  String stackName;

  String status;

  String timestamp;

  String type;

  int running;

  int services;

  int stopped;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WsApiServersServeridStacksStacknameEventsGet101Response &&
    other.containerId == containerId &&
    other.containerName == containerName &&
    other.health == health &&
    other.image == image &&
    _deepEquality.equals(other.ports, ports) &&
    other.serverId == serverId &&
    other.serviceName == serviceName &&
    other.stackName == stackName &&
    other.status == status &&
    other.timestamp == timestamp &&
    other.type == type &&
    other.running == running &&
    other.services == services &&
    other.stopped == stopped;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containerId.hashCode) +
    (containerName.hashCode) +
    (health == null ? 0 : health!.hashCode) +
    (image.hashCode) +
    (ports.hashCode) +
    (serverId.hashCode) +
    (serviceName.hashCode) +
    (stackName.hashCode) +
    (status.hashCode) +
    (timestamp.hashCode) +
    (type.hashCode) +
    (running.hashCode) +
    (services.hashCode) +
    (stopped.hashCode);

  @override
  String toString() => 'WsApiServersServeridStacksStacknameEventsGet101Response[containerId=$containerId, containerName=$containerName, health=$health, image=$image, ports=$ports, serverId=$serverId, serviceName=$serviceName, stackName=$stackName, status=$status, timestamp=$timestamp, type=$type, running=$running, services=$services, stopped=$stopped]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'container_id'] = this.containerId;
      json[r'container_name'] = this.containerName;
    if (this.health != null) {
      json[r'health'] = this.health;
    } else {
      json[r'health'] = null;
    }
      json[r'image'] = this.image;
      json[r'ports'] = this.ports;
      json[r'server_id'] = this.serverId;
      json[r'service_name'] = this.serviceName;
      json[r'stack_name'] = this.stackName;
      json[r'status'] = this.status;
      json[r'timestamp'] = this.timestamp;
      json[r'type'] = this.type;
      json[r'running'] = this.running;
      json[r'services'] = this.services;
      json[r'stopped'] = this.stopped;
    return json;
  }

  /// Returns a new [WsApiServersServeridStacksStacknameEventsGet101Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WsApiServersServeridStacksStacknameEventsGet101Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WsApiServersServeridStacksStacknameEventsGet101Response[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WsApiServersServeridStacksStacknameEventsGet101Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WsApiServersServeridStacksStacknameEventsGet101Response(
        containerId: mapValueOfType<String>(json, r'container_id')!,
        containerName: mapValueOfType<String>(json, r'container_name')!,
        health: mapValueOfType<String>(json, r'health'),
        image: mapValueOfType<String>(json, r'image')!,
        ports: Port.listFromJson(json[r'ports']),
        serverId: mapValueOfType<int>(json, r'server_id')!,
        serviceName: mapValueOfType<String>(json, r'service_name')!,
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        status: mapValueOfType<String>(json, r'status')!,
        timestamp: mapValueOfType<String>(json, r'timestamp')!,
        type: mapValueOfType<String>(json, r'type')!,
        running: mapValueOfType<int>(json, r'running')!,
        services: mapValueOfType<int>(json, r'services')!,
        stopped: mapValueOfType<int>(json, r'stopped')!,
      );
    }
    return null;
  }

  static List<WsApiServersServeridStacksStacknameEventsGet101Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WsApiServersServeridStacksStacknameEventsGet101Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WsApiServersServeridStacksStacknameEventsGet101Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WsApiServersServeridStacksStacknameEventsGet101Response> mapFromJson(dynamic json) {
    final map = <String, WsApiServersServeridStacksStacknameEventsGet101Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WsApiServersServeridStacksStacknameEventsGet101Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WsApiServersServeridStacksStacknameEventsGet101Response-objects as value to a dart map
  static Map<String, List<WsApiServersServeridStacksStacknameEventsGet101Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WsApiServersServeridStacksStacknameEventsGet101Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WsApiServersServeridStacksStacknameEventsGet101Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'container_id',
    'container_name',
    'image',
    'server_id',
    'service_name',
    'stack_name',
    'status',
    'timestamp',
    'type',
    'running',
    'services',
    'stopped',
  };
}

