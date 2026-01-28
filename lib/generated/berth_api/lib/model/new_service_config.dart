//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NewServiceConfig {
  /// Returns a new [NewServiceConfig] instance.
  NewServiceConfig({
    this.environment = const {},
    required this.image,
    this.ports = const [],
    this.restart,
    this.volumes = const [],
  });

  Map<String, String> environment;

  String image;

  List<PortMapping> ports;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? restart;

  List<VolumeMount2> volumes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewServiceConfig &&
    _deepEquality.equals(other.environment, environment) &&
    other.image == image &&
    _deepEquality.equals(other.ports, ports) &&
    other.restart == restart &&
    _deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (environment.hashCode) +
    (image.hashCode) +
    (ports.hashCode) +
    (restart == null ? 0 : restart!.hashCode) +
    (volumes.hashCode);

  @override
  String toString() => 'NewServiceConfig[environment=$environment, image=$image, ports=$ports, restart=$restart, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'environment'] = this.environment;
      json[r'image'] = this.image;
      json[r'ports'] = this.ports;
    if (this.restart != null) {
      json[r'restart'] = this.restart;
    } else {
      json[r'restart'] = null;
    }
      json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [NewServiceConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NewServiceConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NewServiceConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NewServiceConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NewServiceConfig(
        environment: mapCastOfType<String, String>(json, r'environment') ?? const {},
        image: mapValueOfType<String>(json, r'image')!,
        ports: PortMapping.listFromJson(json[r'ports']),
        restart: mapValueOfType<String>(json, r'restart'),
        volumes: VolumeMount2.listFromJson(json[r'volumes']),
      );
    }
    return null;
  }

  static List<NewServiceConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NewServiceConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NewServiceConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NewServiceConfig> mapFromJson(dynamic json) {
    final map = <String, NewServiceConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NewServiceConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NewServiceConfig-objects as value to a dart map
  static Map<String, List<NewServiceConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NewServiceConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NewServiceConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'image',
  };
}

