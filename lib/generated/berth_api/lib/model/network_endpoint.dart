//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkEndpoint {
  /// Returns a new [NetworkEndpoint] instance.
  NetworkEndpoint({
    this.endpointId,
    this.ipv4Address,
    this.ipv6Address,
    this.macAddress,
    required this.name,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endpointId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipv4Address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipv6Address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? macAddress;

  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NetworkEndpoint &&
    other.endpointId == endpointId &&
    other.ipv4Address == ipv4Address &&
    other.ipv6Address == ipv6Address &&
    other.macAddress == macAddress &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (endpointId == null ? 0 : endpointId!.hashCode) +
    (ipv4Address == null ? 0 : ipv4Address!.hashCode) +
    (ipv6Address == null ? 0 : ipv6Address!.hashCode) +
    (macAddress == null ? 0 : macAddress!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'NetworkEndpoint[endpointId=$endpointId, ipv4Address=$ipv4Address, ipv6Address=$ipv6Address, macAddress=$macAddress, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.endpointId != null) {
      json[r'endpoint_id'] = this.endpointId;
    } else {
      json[r'endpoint_id'] = null;
    }
    if (this.ipv4Address != null) {
      json[r'ipv4_address'] = this.ipv4Address;
    } else {
      json[r'ipv4_address'] = null;
    }
    if (this.ipv6Address != null) {
      json[r'ipv6_address'] = this.ipv6Address;
    } else {
      json[r'ipv6_address'] = null;
    }
    if (this.macAddress != null) {
      json[r'mac_address'] = this.macAddress;
    } else {
      json[r'mac_address'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [NetworkEndpoint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NetworkEndpoint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NetworkEndpoint[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NetworkEndpoint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NetworkEndpoint(
        endpointId: mapValueOfType<String>(json, r'endpoint_id'),
        ipv4Address: mapValueOfType<String>(json, r'ipv4_address'),
        ipv6Address: mapValueOfType<String>(json, r'ipv6_address'),
        macAddress: mapValueOfType<String>(json, r'mac_address'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<NetworkEndpoint> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NetworkEndpoint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkEndpoint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NetworkEndpoint> mapFromJson(dynamic json) {
    final map = <String, NetworkEndpoint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NetworkEndpoint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NetworkEndpoint-objects as value to a dart map
  static Map<String, List<NetworkEndpoint>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NetworkEndpoint>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NetworkEndpoint.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

