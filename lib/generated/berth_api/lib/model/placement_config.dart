//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacementConfig {
  /// Returns a new [PlacementConfig] instance.
  PlacementConfig({
    this.constraints = const [],
    this.preferences = const [],
  });

  List<String> constraints;

  List<PlacementPreference> preferences;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacementConfig &&
    _deepEquality.equals(other.constraints, constraints) &&
    _deepEquality.equals(other.preferences, preferences);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (constraints.hashCode) +
    (preferences.hashCode);

  @override
  String toString() => 'PlacementConfig[constraints=$constraints, preferences=$preferences]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'constraints'] = this.constraints;
      json[r'preferences'] = this.preferences;
    return json;
  }

  /// Returns a new [PlacementConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlacementConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PlacementConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PlacementConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlacementConfig(
        constraints: json[r'constraints'] is Iterable
            ? (json[r'constraints'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        preferences: PlacementPreference.listFromJson(json[r'preferences']),
      );
    }
    return null;
  }

  static List<PlacementConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlacementConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlacementConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlacementConfig> mapFromJson(dynamic json) {
    final map = <String, PlacementConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlacementConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlacementConfig-objects as value to a dart map
  static Map<String, List<PlacementConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PlacementConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PlacementConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

