//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VolumeUsage {
  /// Returns a new [VolumeUsage] instance.
  VolumeUsage({
    required this.containerName,
    this.mounts = const [],
    required this.serviceName,
  });

  String containerName;

  List<VolumeMount> mounts;

  String serviceName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VolumeUsage &&
    other.containerName == containerName &&
    _deepEquality.equals(other.mounts, mounts) &&
    other.serviceName == serviceName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containerName.hashCode) +
    (mounts.hashCode) +
    (serviceName.hashCode);

  @override
  String toString() => 'VolumeUsage[containerName=$containerName, mounts=$mounts, serviceName=$serviceName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'container_name'] = this.containerName;
      json[r'mounts'] = this.mounts;
      json[r'service_name'] = this.serviceName;
    return json;
  }

  /// Returns a new [VolumeUsage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VolumeUsage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VolumeUsage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VolumeUsage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VolumeUsage(
        containerName: mapValueOfType<String>(json, r'container_name')!,
        mounts: VolumeMount.listFromJson(json[r'mounts']),
        serviceName: mapValueOfType<String>(json, r'service_name')!,
      );
    }
    return null;
  }

  static List<VolumeUsage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VolumeUsage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VolumeUsage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VolumeUsage> mapFromJson(dynamic json) {
    final map = <String, VolumeUsage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VolumeUsage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VolumeUsage-objects as value to a dart map
  static Map<String, List<VolumeUsage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VolumeUsage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VolumeUsage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'container_name',
    'mounts',
    'service_name',
  };
}

