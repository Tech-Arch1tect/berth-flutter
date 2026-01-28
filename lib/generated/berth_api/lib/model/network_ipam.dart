//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkIPAM {
  /// Returns a new [NetworkIPAM] instance.
  NetworkIPAM({
    this.config = const [],
    this.driver,
  });

  List<NetworkIPAMConfig> config;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? driver;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NetworkIPAM &&
    _deepEquality.equals(other.config, config) &&
    other.driver == driver;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (config.hashCode) +
    (driver == null ? 0 : driver!.hashCode);

  @override
  String toString() => 'NetworkIPAM[config=$config, driver=$driver]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'config'] = this.config;
    if (this.driver != null) {
      json[r'driver'] = this.driver;
    } else {
      json[r'driver'] = null;
    }
    return json;
  }

  /// Returns a new [NetworkIPAM] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NetworkIPAM? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NetworkIPAM[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NetworkIPAM[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NetworkIPAM(
        config: NetworkIPAMConfig.listFromJson(json[r'config']),
        driver: mapValueOfType<String>(json, r'driver'),
      );
    }
    return null;
  }

  static List<NetworkIPAM> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NetworkIPAM>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkIPAM.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NetworkIPAM> mapFromJson(dynamic json) {
    final map = <String, NetworkIPAM>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NetworkIPAM.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NetworkIPAM-objects as value to a dart map
  static Map<String, List<NetworkIPAM>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NetworkIPAM>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NetworkIPAM.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

