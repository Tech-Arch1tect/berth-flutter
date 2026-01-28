//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ResourceLimits {
  /// Returns a new [ResourceLimits] instance.
  ResourceLimits({
    this.cpuPeriod,
    this.cpuQuota,
    this.cpuShares,
    this.memory,
    this.memorySwap,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cpuPeriod;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cpuQuota;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cpuShares;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? memory;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? memorySwap;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResourceLimits &&
    other.cpuPeriod == cpuPeriod &&
    other.cpuQuota == cpuQuota &&
    other.cpuShares == cpuShares &&
    other.memory == memory &&
    other.memorySwap == memorySwap;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cpuPeriod == null ? 0 : cpuPeriod!.hashCode) +
    (cpuQuota == null ? 0 : cpuQuota!.hashCode) +
    (cpuShares == null ? 0 : cpuShares!.hashCode) +
    (memory == null ? 0 : memory!.hashCode) +
    (memorySwap == null ? 0 : memorySwap!.hashCode);

  @override
  String toString() => 'ResourceLimits[cpuPeriod=$cpuPeriod, cpuQuota=$cpuQuota, cpuShares=$cpuShares, memory=$memory, memorySwap=$memorySwap]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cpuPeriod != null) {
      json[r'cpu_period'] = this.cpuPeriod;
    } else {
      json[r'cpu_period'] = null;
    }
    if (this.cpuQuota != null) {
      json[r'cpu_quota'] = this.cpuQuota;
    } else {
      json[r'cpu_quota'] = null;
    }
    if (this.cpuShares != null) {
      json[r'cpu_shares'] = this.cpuShares;
    } else {
      json[r'cpu_shares'] = null;
    }
    if (this.memory != null) {
      json[r'memory'] = this.memory;
    } else {
      json[r'memory'] = null;
    }
    if (this.memorySwap != null) {
      json[r'memory_swap'] = this.memorySwap;
    } else {
      json[r'memory_swap'] = null;
    }
    return json;
  }

  /// Returns a new [ResourceLimits] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResourceLimits? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResourceLimits[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResourceLimits[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResourceLimits(
        cpuPeriod: mapValueOfType<int>(json, r'cpu_period'),
        cpuQuota: mapValueOfType<int>(json, r'cpu_quota'),
        cpuShares: mapValueOfType<int>(json, r'cpu_shares'),
        memory: mapValueOfType<int>(json, r'memory'),
        memorySwap: mapValueOfType<int>(json, r'memory_swap'),
      );
    }
    return null;
  }

  static List<ResourceLimits> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ResourceLimits>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResourceLimits.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResourceLimits> mapFromJson(dynamic json) {
    final map = <String, ResourceLimits>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResourceLimits.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResourceLimits-objects as value to a dart map
  static Map<String, List<ResourceLimits>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResourceLimits>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ResourceLimits.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

