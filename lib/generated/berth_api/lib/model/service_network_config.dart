//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceNetworkConfig {
  /// Returns a new [ServiceNetworkConfig] instance.
  ServiceNetworkConfig({
    this.aliases = const [],
    this.ipv4Address,
    this.ipv6Address,
    this.priority,
  });

  List<String> aliases;

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
  int? priority;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceNetworkConfig &&
    _deepEquality.equals(other.aliases, aliases) &&
    other.ipv4Address == ipv4Address &&
    other.ipv6Address == ipv6Address &&
    other.priority == priority;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (aliases.hashCode) +
    (ipv4Address == null ? 0 : ipv4Address!.hashCode) +
    (ipv6Address == null ? 0 : ipv6Address!.hashCode) +
    (priority == null ? 0 : priority!.hashCode);

  @override
  String toString() => 'ServiceNetworkConfig[aliases=$aliases, ipv4Address=$ipv4Address, ipv6Address=$ipv6Address, priority=$priority]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'aliases'] = this.aliases;
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
    if (this.priority != null) {
      json[r'priority'] = this.priority;
    } else {
      json[r'priority'] = null;
    }
    return json;
  }

  /// Returns a new [ServiceNetworkConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceNetworkConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServiceNetworkConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServiceNetworkConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServiceNetworkConfig(
        aliases: json[r'aliases'] is Iterable
            ? (json[r'aliases'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        ipv4Address: mapValueOfType<String>(json, r'ipv4_address'),
        ipv6Address: mapValueOfType<String>(json, r'ipv6_address'),
        priority: mapValueOfType<int>(json, r'priority'),
      );
    }
    return null;
  }

  static List<ServiceNetworkConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceNetworkConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceNetworkConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceNetworkConfig> mapFromJson(dynamic json) {
    final map = <String, ServiceNetworkConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceNetworkConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceNetworkConfig-objects as value to a dart map
  static Map<String, List<ServiceNetworkConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceNetworkConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceNetworkConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

