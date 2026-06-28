//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackStatusEvent {
  /// Returns a new [StackStatusEvent] instance.
  StackStatusEvent({
    required this.running,
    required this.serverId,
    required this.services,
    required this.stackName,
    required this.status,
    required this.stopped,
    required this.timestamp,
    required this.type,
  });

  int running;

  int serverId;

  int services;

  String stackName;

  String status;

  int stopped;

  String timestamp;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackStatusEvent &&
    other.running == running &&
    other.serverId == serverId &&
    other.services == services &&
    other.stackName == stackName &&
    other.status == status &&
    other.stopped == stopped &&
    other.timestamp == timestamp &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (running.hashCode) +
    (serverId.hashCode) +
    (services.hashCode) +
    (stackName.hashCode) +
    (status.hashCode) +
    (stopped.hashCode) +
    (timestamp.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'StackStatusEvent[running=$running, serverId=$serverId, services=$services, stackName=$stackName, status=$status, stopped=$stopped, timestamp=$timestamp, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'running'] = this.running;
      json[r'server_id'] = this.serverId;
      json[r'services'] = this.services;
      json[r'stack_name'] = this.stackName;
      json[r'status'] = this.status;
      json[r'stopped'] = this.stopped;
      json[r'timestamp'] = this.timestamp;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [StackStatusEvent] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackStatusEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackStatusEvent[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackStatusEvent[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackStatusEvent(
        running: mapValueOfType<int>(json, r'running')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        services: mapValueOfType<int>(json, r'services')!,
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        status: mapValueOfType<String>(json, r'status')!,
        stopped: mapValueOfType<int>(json, r'stopped')!,
        timestamp: mapValueOfType<String>(json, r'timestamp')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<StackStatusEvent> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackStatusEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackStatusEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackStatusEvent> mapFromJson(dynamic json) {
    final map = <String, StackStatusEvent>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackStatusEvent.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackStatusEvent-objects as value to a dart map
  static Map<String, List<StackStatusEvent>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackStatusEvent>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackStatusEvent.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'running',
    'server_id',
    'services',
    'stack_name',
    'status',
    'stopped',
    'timestamp',
    'type',
  };
}

