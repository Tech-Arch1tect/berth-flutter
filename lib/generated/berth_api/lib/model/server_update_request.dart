//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServerUpdateRequest {
  /// Returns a new [ServerUpdateRequest] instance.
  ServerUpdateRequest({
    required this.accessToken,
    required this.description,
    required this.host,
    required this.isActive,
    required this.name,
    required this.port,
    required this.skipSslVerification,
  });

  String accessToken;

  String description;

  String host;

  bool isActive;

  String name;

  int port;

  bool? skipSslVerification;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServerUpdateRequest &&
    other.accessToken == accessToken &&
    other.description == description &&
    other.host == host &&
    other.isActive == isActive &&
    other.name == name &&
    other.port == port &&
    other.skipSslVerification == skipSslVerification;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken.hashCode) +
    (description.hashCode) +
    (host.hashCode) +
    (isActive.hashCode) +
    (name.hashCode) +
    (port.hashCode) +
    (skipSslVerification == null ? 0 : skipSslVerification!.hashCode);

  @override
  String toString() => 'ServerUpdateRequest[accessToken=$accessToken, description=$description, host=$host, isActive=$isActive, name=$name, port=$port, skipSslVerification=$skipSslVerification]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'access_token'] = this.accessToken;
      json[r'description'] = this.description;
      json[r'host'] = this.host;
      json[r'is_active'] = this.isActive;
      json[r'name'] = this.name;
      json[r'port'] = this.port;
    if (this.skipSslVerification != null) {
      json[r'skip_ssl_verification'] = this.skipSslVerification;
    } else {
      json[r'skip_ssl_verification'] = null;
    }
    return json;
  }

  /// Returns a new [ServerUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServerUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServerUpdateRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServerUpdateRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServerUpdateRequest(
        accessToken: mapValueOfType<String>(json, r'access_token')!,
        description: mapValueOfType<String>(json, r'description')!,
        host: mapValueOfType<String>(json, r'host')!,
        isActive: mapValueOfType<bool>(json, r'is_active')!,
        name: mapValueOfType<String>(json, r'name')!,
        port: mapValueOfType<int>(json, r'port')!,
        skipSslVerification: mapValueOfType<bool>(json, r'skip_ssl_verification'),
      );
    }
    return null;
  }

  static List<ServerUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServerUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServerUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServerUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, ServerUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServerUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServerUpdateRequest-objects as value to a dart map
  static Map<String, List<ServerUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServerUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServerUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'access_token',
    'description',
    'host',
    'is_active',
    'name',
    'port',
    'skip_ssl_verification',
  };
}

