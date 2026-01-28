//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PlacementPreference {
  /// Returns a new [PlacementPreference] instance.
  PlacementPreference({
    required this.spread,
  });

  String spread;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PlacementPreference &&
    other.spread == spread;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spread.hashCode);

  @override
  String toString() => 'PlacementPreference[spread=$spread]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spread'] = this.spread;
    return json;
  }

  /// Returns a new [PlacementPreference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PlacementPreference? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PlacementPreference[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PlacementPreference[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PlacementPreference(
        spread: mapValueOfType<String>(json, r'spread')!,
      );
    }
    return null;
  }

  static List<PlacementPreference> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PlacementPreference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PlacementPreference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PlacementPreference> mapFromJson(dynamic json) {
    final map = <String, PlacementPreference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PlacementPreference.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PlacementPreference-objects as value to a dart map
  static Map<String, List<PlacementPreference>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PlacementPreference>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PlacementPreference.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spread',
  };
}

