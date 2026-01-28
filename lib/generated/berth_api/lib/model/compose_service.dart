//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ComposeService {
  /// Returns a new [ComposeService] instance.
  ComposeService({
    this.containers = const [],
    this.image,
    required this.name,
    this.ports = const [],
  });

  List<Container> containers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  String name;

  List<String> ports;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ComposeService &&
    _deepEquality.equals(other.containers, containers) &&
    other.image == image &&
    other.name == name &&
    _deepEquality.equals(other.ports, ports);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containers.hashCode) +
    (image == null ? 0 : image!.hashCode) +
    (name.hashCode) +
    (ports.hashCode);

  @override
  String toString() => 'ComposeService[containers=$containers, image=$image, name=$name, ports=$ports]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'containers'] = this.containers;
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
      json[r'name'] = this.name;
      json[r'ports'] = this.ports;
    return json;
  }

  /// Returns a new [ComposeService] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ComposeService? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ComposeService[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ComposeService[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ComposeService(
        containers: Container.listFromJson(json[r'containers']),
        image: mapValueOfType<String>(json, r'image'),
        name: mapValueOfType<String>(json, r'name')!,
        ports: json[r'ports'] is Iterable
            ? (json[r'ports'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ComposeService> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComposeService>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComposeService.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ComposeService> mapFromJson(dynamic json) {
    final map = <String, ComposeService>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ComposeService.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ComposeService-objects as value to a dart map
  static Map<String, List<ComposeService>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ComposeService>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ComposeService.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'containers',
    'name',
  };
}

