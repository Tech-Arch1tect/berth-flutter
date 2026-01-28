//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkConfig {
  /// Returns a new [NetworkConfig] instance.
  NetworkConfig({
    this.driver,
    this.driverOpts = const {},
    this.external_,
    this.ipam,
    this.labels = const {},
    this.name,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? driver;

  Map<String, String> driverOpts;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? external_;

  IpamConfig? ipam;

  Map<String, String> labels;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NetworkConfig &&
    other.driver == driver &&
    _deepEquality.equals(other.driverOpts, driverOpts) &&
    other.external_ == external_ &&
    other.ipam == ipam &&
    _deepEquality.equals(other.labels, labels) &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (driver == null ? 0 : driver!.hashCode) +
    (driverOpts.hashCode) +
    (external_ == null ? 0 : external_!.hashCode) +
    (ipam == null ? 0 : ipam!.hashCode) +
    (labels.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'NetworkConfig[driver=$driver, driverOpts=$driverOpts, external_=$external_, ipam=$ipam, labels=$labels, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.driver != null) {
      json[r'driver'] = this.driver;
    } else {
      json[r'driver'] = null;
    }
      json[r'driver_opts'] = this.driverOpts;
    if (this.external_ != null) {
      json[r'external'] = this.external_;
    } else {
      json[r'external'] = null;
    }
    if (this.ipam != null) {
      json[r'ipam'] = this.ipam;
    } else {
      json[r'ipam'] = null;
    }
      json[r'labels'] = this.labels;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [NetworkConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NetworkConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NetworkConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NetworkConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NetworkConfig(
        driver: mapValueOfType<String>(json, r'driver'),
        driverOpts: mapCastOfType<String, String>(json, r'driver_opts') ?? const {},
        external_: mapValueOfType<bool>(json, r'external'),
        ipam: IpamConfig.fromJson(json[r'ipam']),
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<NetworkConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NetworkConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NetworkConfig> mapFromJson(dynamic json) {
    final map = <String, NetworkConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NetworkConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NetworkConfig-objects as value to a dart map
  static Map<String, List<NetworkConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NetworkConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NetworkConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

