//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationRequest {
  /// Returns a new [OperationRequest] instance.
  OperationRequest({
    required this.command,
    this.options = const [],
    this.registryCredentials = const [],
    this.services = const [],
  });

  String command;

  List<String> options;

  List<RegistryCredential> registryCredentials;

  List<String> services;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationRequest &&
    other.command == command &&
    _deepEquality.equals(other.options, options) &&
    _deepEquality.equals(other.registryCredentials, registryCredentials) &&
    _deepEquality.equals(other.services, services);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (command.hashCode) +
    (options.hashCode) +
    (registryCredentials.hashCode) +
    (services.hashCode);

  @override
  String toString() => 'OperationRequest[command=$command, options=$options, registryCredentials=$registryCredentials, services=$services]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'command'] = this.command;
      json[r'options'] = this.options;
      json[r'registry_credentials'] = this.registryCredentials;
      json[r'services'] = this.services;
    return json;
  }

  /// Returns a new [OperationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OperationRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OperationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OperationRequest(
        command: mapValueOfType<String>(json, r'command')!,
        options: json[r'options'] is Iterable
            ? (json[r'options'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        registryCredentials: RegistryCredential.listFromJson(json[r'registry_credentials']),
        services: json[r'services'] is Iterable
            ? (json[r'services'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<OperationRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationRequest> mapFromJson(dynamic json) {
    final map = <String, OperationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationRequest-objects as value to a dart map
  static Map<String, List<OperationRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'command',
    'options',
    'services',
  };
}

