//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Volume {
  /// Returns a new [Volume] instance.
  Volume({
    this.created,
    this.driver,
    this.driverOpts = const {},
    required this.exists,
    this.external_,
    this.labels = const {},
    this.mountpoint,
    required this.name,
    this.scope,
    this.usedBy = const [],
  });

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

  Map<String, String> driverOpts;

  bool exists;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? external_;

  Map<String, String> labels;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mountpoint;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? scope;

  List<VolumeUsage> usedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Volume &&
    other.created == created &&
    other.driver == driver &&
    _deepEquality.equals(other.driverOpts, driverOpts) &&
    other.exists == exists &&
    other.external_ == external_ &&
    _deepEquality.equals(other.labels, labels) &&
    other.mountpoint == mountpoint &&
    other.name == name &&
    other.scope == scope &&
    _deepEquality.equals(other.usedBy, usedBy);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (driver == null ? 0 : driver!.hashCode) +
    (driverOpts.hashCode) +
    (exists.hashCode) +
    (external_ == null ? 0 : external_!.hashCode) +
    (labels.hashCode) +
    (mountpoint == null ? 0 : mountpoint!.hashCode) +
    (name.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (usedBy.hashCode);

  @override
  String toString() => 'Volume[created=$created, driver=$driver, driverOpts=$driverOpts, exists=$exists, external_=$external_, labels=$labels, mountpoint=$mountpoint, name=$name, scope=$scope, usedBy=$usedBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
      json[r'driver_opts'] = this.driverOpts;
      json[r'exists'] = this.exists;
    if (this.external_ != null) {
      json[r'external'] = this.external_;
    } else {
      json[r'external'] = null;
    }
      json[r'labels'] = this.labels;
    if (this.mountpoint != null) {
      json[r'mountpoint'] = this.mountpoint;
    } else {
      json[r'mountpoint'] = null;
    }
      json[r'name'] = this.name;
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
      json[r'used_by'] = this.usedBy;
    return json;
  }

  /// Returns a new [Volume] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Volume? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Volume[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Volume[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Volume(
        created: mapValueOfType<String>(json, r'created'),
        driver: mapValueOfType<String>(json, r'driver'),
        driverOpts: mapCastOfType<String, String>(json, r'driver_opts') ?? const {},
        exists: mapValueOfType<bool>(json, r'exists')!,
        external_: mapValueOfType<bool>(json, r'external'),
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        mountpoint: mapValueOfType<String>(json, r'mountpoint'),
        name: mapValueOfType<String>(json, r'name')!,
        scope: mapValueOfType<String>(json, r'scope'),
        usedBy: VolumeUsage.listFromJson(json[r'used_by']),
      );
    }
    return null;
  }

  static List<Volume> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Volume>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Volume.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Volume> mapFromJson(dynamic json) {
    final map = <String, Volume>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Volume.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Volume-objects as value to a dart map
  static Map<String, List<Volume>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Volume>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Volume.listFromJson(entry.value, growable: growable,);
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

