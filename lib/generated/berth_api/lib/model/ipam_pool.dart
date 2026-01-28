//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IpamPool {
  /// Returns a new [IpamPool] instance.
  IpamPool({
    this.gateway,
    this.ipRange,
    this.subnet,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? gateway;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipRange;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subnet;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IpamPool &&
    other.gateway == gateway &&
    other.ipRange == ipRange &&
    other.subnet == subnet;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (gateway == null ? 0 : gateway!.hashCode) +
    (ipRange == null ? 0 : ipRange!.hashCode) +
    (subnet == null ? 0 : subnet!.hashCode);

  @override
  String toString() => 'IpamPool[gateway=$gateway, ipRange=$ipRange, subnet=$subnet]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.gateway != null) {
      json[r'gateway'] = this.gateway;
    } else {
      json[r'gateway'] = null;
    }
    if (this.ipRange != null) {
      json[r'ip_range'] = this.ipRange;
    } else {
      json[r'ip_range'] = null;
    }
    if (this.subnet != null) {
      json[r'subnet'] = this.subnet;
    } else {
      json[r'subnet'] = null;
    }
    return json;
  }

  /// Returns a new [IpamPool] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IpamPool? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "IpamPool[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "IpamPool[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IpamPool(
        gateway: mapValueOfType<String>(json, r'gateway'),
        ipRange: mapValueOfType<String>(json, r'ip_range'),
        subnet: mapValueOfType<String>(json, r'subnet'),
      );
    }
    return null;
  }

  static List<IpamPool> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IpamPool>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IpamPool.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IpamPool> mapFromJson(dynamic json) {
    final map = <String, IpamPool>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IpamPool.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IpamPool-objects as value to a dart map
  static Map<String, List<IpamPool>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IpamPool>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IpamPool.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

