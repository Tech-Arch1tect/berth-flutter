//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackVolumesData {
  /// Returns a new [StackVolumesData] instance.
  StackVolumesData({
    this.volumes = const [],
  });

  List<Volume> volumes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackVolumesData &&
    _deepEquality.equals(other.volumes, volumes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (volumes.hashCode);

  @override
  String toString() => 'StackVolumesData[volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'volumes'] = this.volumes;
    return json;
  }

  /// Returns a new [StackVolumesData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackVolumesData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackVolumesData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackVolumesData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackVolumesData(
        volumes: Volume.listFromJson(json[r'volumes']),
      );
    }
    return null;
  }

  static List<StackVolumesData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackVolumesData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackVolumesData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackVolumesData> mapFromJson(dynamic json) {
    final map = <String, StackVolumesData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackVolumesData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackVolumesData-objects as value to a dart map
  static Map<String, List<StackVolumesData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackVolumesData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackVolumesData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

