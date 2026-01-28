//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerNetwork {
  /// Returns a new [ContainerNetwork] instance.
  ContainerNetwork({
    this.aliases = const [],
    this.gateway,
    this.ipAddress,
    this.macAddress,
    required this.name,
    this.networkId,
  });

  List<String> aliases;

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
  String? ipAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? macAddress;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? networkId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerNetwork &&
    _deepEquality.equals(other.aliases, aliases) &&
    other.gateway == gateway &&
    other.ipAddress == ipAddress &&
    other.macAddress == macAddress &&
    other.name == name &&
    other.networkId == networkId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (aliases.hashCode) +
    (gateway == null ? 0 : gateway!.hashCode) +
    (ipAddress == null ? 0 : ipAddress!.hashCode) +
    (macAddress == null ? 0 : macAddress!.hashCode) +
    (name.hashCode) +
    (networkId == null ? 0 : networkId!.hashCode);

  @override
  String toString() => 'ContainerNetwork[aliases=$aliases, gateway=$gateway, ipAddress=$ipAddress, macAddress=$macAddress, name=$name, networkId=$networkId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'aliases'] = this.aliases;
    if (this.gateway != null) {
      json[r'gateway'] = this.gateway;
    } else {
      json[r'gateway'] = null;
    }
    if (this.ipAddress != null) {
      json[r'ip_address'] = this.ipAddress;
    } else {
      json[r'ip_address'] = null;
    }
    if (this.macAddress != null) {
      json[r'mac_address'] = this.macAddress;
    } else {
      json[r'mac_address'] = null;
    }
      json[r'name'] = this.name;
    if (this.networkId != null) {
      json[r'network_id'] = this.networkId;
    } else {
      json[r'network_id'] = null;
    }
    return json;
  }

  /// Returns a new [ContainerNetwork] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerNetwork? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerNetwork[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerNetwork[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerNetwork(
        aliases: json[r'aliases'] is Iterable
            ? (json[r'aliases'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        gateway: mapValueOfType<String>(json, r'gateway'),
        ipAddress: mapValueOfType<String>(json, r'ip_address'),
        macAddress: mapValueOfType<String>(json, r'mac_address'),
        name: mapValueOfType<String>(json, r'name')!,
        networkId: mapValueOfType<String>(json, r'network_id'),
      );
    }
    return null;
  }

  static List<ContainerNetwork> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerNetwork>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerNetwork.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerNetwork> mapFromJson(dynamic json) {
    final map = <String, ContainerNetwork>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerNetwork.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerNetwork-objects as value to a dart map
  static Map<String, List<ContainerNetwork>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerNetwork>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerNetwork.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

