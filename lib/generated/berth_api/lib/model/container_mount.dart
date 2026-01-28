//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerMount {
  /// Returns a new [ContainerMount] instance.
  ContainerMount({
    required this.destination,
    this.driver,
    this.mode,
    this.propagation,
    required this.rw,
    required this.source_,
    required this.type,
  });

  String destination;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? driver;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? propagation;

  bool rw;

  String source_;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerMount &&
    other.destination == destination &&
    other.driver == driver &&
    other.mode == mode &&
    other.propagation == propagation &&
    other.rw == rw &&
    other.source_ == source_ &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (destination.hashCode) +
    (driver == null ? 0 : driver!.hashCode) +
    (mode == null ? 0 : mode!.hashCode) +
    (propagation == null ? 0 : propagation!.hashCode) +
    (rw.hashCode) +
    (source_.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'ContainerMount[destination=$destination, driver=$driver, mode=$mode, propagation=$propagation, rw=$rw, source_=$source_, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'destination'] = this.destination;
    if (this.driver != null) {
      json[r'driver'] = this.driver;
    } else {
      json[r'driver'] = null;
    }
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    if (this.propagation != null) {
      json[r'propagation'] = this.propagation;
    } else {
      json[r'propagation'] = null;
    }
      json[r'rw'] = this.rw;
      json[r'source'] = this.source_;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [ContainerMount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerMount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerMount[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerMount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerMount(
        destination: mapValueOfType<String>(json, r'destination')!,
        driver: mapValueOfType<String>(json, r'driver'),
        mode: mapValueOfType<String>(json, r'mode'),
        propagation: mapValueOfType<String>(json, r'propagation'),
        rw: mapValueOfType<bool>(json, r'rw')!,
        source_: mapValueOfType<String>(json, r'source')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<ContainerMount> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerMount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerMount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerMount> mapFromJson(dynamic json) {
    final map = <String, ContainerMount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerMount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerMount-objects as value to a dart map
  static Map<String, List<ContainerMount>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerMount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerMount.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'destination',
    'rw',
    'source',
    'type',
  };
}

