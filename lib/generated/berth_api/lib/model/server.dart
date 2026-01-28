//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Server {
  /// Returns a new [Server] instance.
  Server({
    required this.createdAt,
    required this.deletedAt,
    required this.description,
    required this.host,
    required this.id,
    required this.isActive,
    required this.name,
    required this.port,
    required this.skipSslVerification,
    required this.updatedAt,
  });

  DateTime createdAt;

  DeletedAt deletedAt;

  String description;

  String host;

  /// Minimum value: 0
  int id;

  bool isActive;

  String name;

  int port;

  bool? skipSslVerification;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Server &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.description == description &&
    other.host == host &&
    other.id == id &&
    other.isActive == isActive &&
    other.name == name &&
    other.port == port &&
    other.skipSslVerification == skipSslVerification &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (deletedAt.hashCode) +
    (description.hashCode) +
    (host.hashCode) +
    (id.hashCode) +
    (isActive.hashCode) +
    (name.hashCode) +
    (port.hashCode) +
    (skipSslVerification == null ? 0 : skipSslVerification!.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'Server[createdAt=$createdAt, deletedAt=$deletedAt, description=$description, host=$host, id=$id, isActive=$isActive, name=$name, port=$port, skipSslVerification=$skipSslVerification, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'deleted_at'] = this.deletedAt;
      json[r'description'] = this.description;
      json[r'host'] = this.host;
      json[r'id'] = this.id;
      json[r'is_active'] = this.isActive;
      json[r'name'] = this.name;
      json[r'port'] = this.port;
    if (this.skipSslVerification != null) {
      json[r'skip_ssl_verification'] = this.skipSslVerification;
    } else {
      json[r'skip_ssl_verification'] = null;
    }
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [Server] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Server? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Server[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Server[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Server(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at'])!,
        description: mapValueOfType<String>(json, r'description')!,
        host: mapValueOfType<String>(json, r'host')!,
        id: mapValueOfType<int>(json, r'id')!,
        isActive: mapValueOfType<bool>(json, r'is_active')!,
        name: mapValueOfType<String>(json, r'name')!,
        port: mapValueOfType<int>(json, r'port')!,
        skipSslVerification: mapValueOfType<bool>(json, r'skip_ssl_verification'),
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<Server> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Server>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Server.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Server> mapFromJson(dynamic json) {
    final map = <String, Server>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Server.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Server-objects as value to a dart map
  static Map<String, List<Server>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Server>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Server.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'deleted_at',
    'description',
    'host',
    'id',
    'is_active',
    'name',
    'port',
    'skip_ssl_verification',
    'updated_at',
  };
}

