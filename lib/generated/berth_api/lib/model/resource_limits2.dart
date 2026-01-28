//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResourceLimits2 {
  /// Returns a new [ResourceLimits2] instance.
  ResourceLimits2({
    this.cpus,
    this.memory,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cpus;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? memory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResourceLimits2 &&
    other.cpus == cpus &&
    other.memory == memory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cpus == null ? 0 : cpus!.hashCode) +
    (memory == null ? 0 : memory!.hashCode);

  @override
  String toString() => 'ResourceLimits2[cpus=$cpus, memory=$memory]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cpus != null) {
      json[r'cpus'] = this.cpus;
    } else {
      json[r'cpus'] = null;
    }
    if (this.memory != null) {
      json[r'memory'] = this.memory;
    } else {
      json[r'memory'] = null;
    }
    return json;
  }

  /// Returns a new [ResourceLimits2] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResourceLimits2? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResourceLimits2[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResourceLimits2[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResourceLimits2(
        cpus: mapValueOfType<String>(json, r'cpus'),
        memory: mapValueOfType<String>(json, r'memory'),
      );
    }
    return null;
  }

  static List<ResourceLimits2> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ResourceLimits2>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResourceLimits2.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResourceLimits2> mapFromJson(dynamic json) {
    final map = <String, ResourceLimits2>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResourceLimits2.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResourceLimits2-objects as value to a dart map
  static Map<String, List<ResourceLimits2>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResourceLimits2>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ResourceLimits2.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

