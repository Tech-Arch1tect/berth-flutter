//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResourcesConfig {
  /// Returns a new [ResourcesConfig] instance.
  ResourcesConfig({
    this.limits,
    this.reservations,
  });

  ResourceLimits2? limits;

  ResourceLimits2? reservations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResourcesConfig &&
    other.limits == limits &&
    other.reservations == reservations;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (limits == null ? 0 : limits!.hashCode) +
    (reservations == null ? 0 : reservations!.hashCode);

  @override
  String toString() => 'ResourcesConfig[limits=$limits, reservations=$reservations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.limits != null) {
      json[r'limits'] = this.limits;
    } else {
      json[r'limits'] = null;
    }
    if (this.reservations != null) {
      json[r'reservations'] = this.reservations;
    } else {
      json[r'reservations'] = null;
    }
    return json;
  }

  /// Returns a new [ResourcesConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResourcesConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResourcesConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResourcesConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResourcesConfig(
        limits: ResourceLimits2.fromJson(json[r'limits']),
        reservations: ResourceLimits2.fromJson(json[r'reservations']),
      );
    }
    return null;
  }

  static List<ResourcesConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ResourcesConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResourcesConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResourcesConfig> mapFromJson(dynamic json) {
    final map = <String, ResourcesConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResourcesConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResourcesConfig-objects as value to a dart map
  static Map<String, List<ResourcesConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResourcesConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ResourcesConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

