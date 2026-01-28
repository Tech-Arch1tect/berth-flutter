//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Network {
  /// Returns a new [Network] instance.
  Network({
    this.containers = const {},
    this.created,
    this.driver,
    required this.exists,
    this.external_,
    this.ipam,
    this.labels = const {},
    required this.name,
    this.options = const {},
  });

  Map<String, NetworkEndpoint> containers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? created;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? driver;

  bool exists;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? external_;

  NetworkIPAM? ipam;

  Map<String, String> labels;

  String name;

  Map<String, String> options;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Network &&
    _deepEquality.equals(other.containers, containers) &&
    other.created == created &&
    other.driver == driver &&
    other.exists == exists &&
    other.external_ == external_ &&
    other.ipam == ipam &&
    _deepEquality.equals(other.labels, labels) &&
    other.name == name &&
    _deepEquality.equals(other.options, options);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containers.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (driver == null ? 0 : driver!.hashCode) +
    (exists.hashCode) +
    (external_ == null ? 0 : external_!.hashCode) +
    (ipam == null ? 0 : ipam!.hashCode) +
    (labels.hashCode) +
    (name.hashCode) +
    (options.hashCode);

  @override
  String toString() => 'Network[containers=$containers, created=$created, driver=$driver, exists=$exists, external_=$external_, ipam=$ipam, labels=$labels, name=$name, options=$options]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'containers'] = this.containers;
    if (this.created != null) {
      json[r'created'] = this.created;
    } else {
      json[r'created'] = null;
    }
    if (this.driver != null) {
      json[r'driver'] = this.driver;
    } else {
      json[r'driver'] = null;
    }
      json[r'exists'] = this.exists;
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
      json[r'name'] = this.name;
      json[r'options'] = this.options;
    return json;
  }

  /// Returns a new [Network] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Network? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Network[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Network[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Network(
        containers: NetworkEndpoint.mapFromJson(json[r'containers']),
        created: mapValueOfType<String>(json, r'created'),
        driver: mapValueOfType<String>(json, r'driver'),
        exists: mapValueOfType<bool>(json, r'exists')!,
        external_: mapValueOfType<bool>(json, r'external'),
        ipam: NetworkIPAM.fromJson(json[r'ipam']),
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        name: mapValueOfType<String>(json, r'name')!,
        options: mapCastOfType<String, String>(json, r'options') ?? const {},
      );
    }
    return null;
  }

  static List<Network> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Network>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Network.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Network> mapFromJson(dynamic json) {
    final map = <String, Network>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Network.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Network-objects as value to a dart map
  static Map<String, List<Network>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Network>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Network.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'exists',
    'name',
  };
}

