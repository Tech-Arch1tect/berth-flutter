//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackEnvironmentData {
  /// Returns a new [StackEnvironmentData] instance.
  StackEnvironmentData({
    this.services = const {},
  });

  Map<String, List<ServiceEnvironment>> services;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackEnvironmentData &&
    _deepEquality.equals(other.services, services);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (services.hashCode);

  @override
  String toString() => 'StackEnvironmentData[services=$services]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'services'] = this.services;
    return json;
  }

  /// Returns a new [StackEnvironmentData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackEnvironmentData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackEnvironmentData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackEnvironmentData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackEnvironmentData(
        services: json[r'services'] == null
          ? const {}
            : ServiceEnvironment.mapListFromJson(json[r'services']),
      );
    }
    return null;
  }

  static List<StackEnvironmentData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackEnvironmentData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackEnvironmentData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackEnvironmentData> mapFromJson(dynamic json) {
    final map = <String, StackEnvironmentData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackEnvironmentData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackEnvironmentData-objects as value to a dart map
  static Map<String, List<StackEnvironmentData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackEnvironmentData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackEnvironmentData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'services',
  };
}

