//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServerInfo {
  /// Returns a new [ServerInfo] instance.
  ServerInfo({
    required this.description,
    required this.host,
    required this.id,
    required this.isActive,
    required this.name,
    required this.port,
  });

  String description;

  String host;

  /// Minimum value: 0
  int id;

  bool isActive;

  String name;

  int port;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServerInfo &&
    other.description == description &&
    other.host == host &&
    other.id == id &&
    other.isActive == isActive &&
    other.name == name &&
    other.port == port;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (host.hashCode) +
    (id.hashCode) +
    (isActive.hashCode) +
    (name.hashCode) +
    (port.hashCode);

  @override
  String toString() => 'ServerInfo[description=$description, host=$host, id=$id, isActive=$isActive, name=$name, port=$port]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'host'] = this.host;
      json[r'id'] = this.id;
      json[r'is_active'] = this.isActive;
      json[r'name'] = this.name;
      json[r'port'] = this.port;
    return json;
  }

  /// Returns a new [ServerInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServerInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServerInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServerInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServerInfo(
        description: mapValueOfType<String>(json, r'description')!,
        host: mapValueOfType<String>(json, r'host')!,
        id: mapValueOfType<int>(json, r'id')!,
        isActive: mapValueOfType<bool>(json, r'is_active')!,
        name: mapValueOfType<String>(json, r'name')!,
        port: mapValueOfType<int>(json, r'port')!,
      );
    }
    return null;
  }

  static List<ServerInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServerInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServerInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServerInfo> mapFromJson(dynamic json) {
    final map = <String, ServerInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServerInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServerInfo-objects as value to a dart map
  static Map<String, List<ServerInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServerInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServerInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'host',
    'id',
    'is_active',
    'name',
    'port',
  };
}

