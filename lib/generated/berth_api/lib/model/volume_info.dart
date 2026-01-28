//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VolumeInfo {
  /// Returns a new [VolumeInfo] instance.
  VolumeInfo({
    required this.created,
    required this.driver,
    this.labels = const {},
    required this.mountpoint,
    required this.name,
    required this.size,
    required this.unused,
  });

  DateTime created;

  String driver;

  Map<String, String> labels;

  String mountpoint;

  String name;

  int size;

  bool unused;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VolumeInfo &&
    other.created == created &&
    other.driver == driver &&
    _deepEquality.equals(other.labels, labels) &&
    other.mountpoint == mountpoint &&
    other.name == name &&
    other.size == size &&
    other.unused == unused;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created.hashCode) +
    (driver.hashCode) +
    (labels.hashCode) +
    (mountpoint.hashCode) +
    (name.hashCode) +
    (size.hashCode) +
    (unused.hashCode);

  @override
  String toString() => 'VolumeInfo[created=$created, driver=$driver, labels=$labels, mountpoint=$mountpoint, name=$name, size=$size, unused=$unused]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created'] = this.created.toUtc().toIso8601String();
      json[r'driver'] = this.driver;
      json[r'labels'] = this.labels;
      json[r'mountpoint'] = this.mountpoint;
      json[r'name'] = this.name;
      json[r'size'] = this.size;
      json[r'unused'] = this.unused;
    return json;
  }

  /// Returns a new [VolumeInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VolumeInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VolumeInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VolumeInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VolumeInfo(
        created: mapDateTime(json, r'created', r'')!,
        driver: mapValueOfType<String>(json, r'driver')!,
        labels: mapCastOfType<String, String>(json, r'labels')!,
        mountpoint: mapValueOfType<String>(json, r'mountpoint')!,
        name: mapValueOfType<String>(json, r'name')!,
        size: mapValueOfType<int>(json, r'size')!,
        unused: mapValueOfType<bool>(json, r'unused')!,
      );
    }
    return null;
  }

  static List<VolumeInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VolumeInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VolumeInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VolumeInfo> mapFromJson(dynamic json) {
    final map = <String, VolumeInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VolumeInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VolumeInfo-objects as value to a dart map
  static Map<String, List<VolumeInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VolumeInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VolumeInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'driver',
    'labels',
    'mountpoint',
    'name',
    'size',
    'unused',
  };
}

