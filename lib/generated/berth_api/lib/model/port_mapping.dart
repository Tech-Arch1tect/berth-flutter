//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PortMapping {
  /// Returns a new [PortMapping] instance.
  PortMapping({
    this.hostIp,
    this.protocol,
    this.published,
    required this.target,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostIp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? protocol;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? published;

  String target;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PortMapping &&
    other.hostIp == hostIp &&
    other.protocol == protocol &&
    other.published == published &&
    other.target == target;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hostIp == null ? 0 : hostIp!.hashCode) +
    (protocol == null ? 0 : protocol!.hashCode) +
    (published == null ? 0 : published!.hashCode) +
    (target.hashCode);

  @override
  String toString() => 'PortMapping[hostIp=$hostIp, protocol=$protocol, published=$published, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hostIp != null) {
      json[r'host_ip'] = this.hostIp;
    } else {
      json[r'host_ip'] = null;
    }
    if (this.protocol != null) {
      json[r'protocol'] = this.protocol;
    } else {
      json[r'protocol'] = null;
    }
    if (this.published != null) {
      json[r'published'] = this.published;
    } else {
      json[r'published'] = null;
    }
      json[r'target'] = this.target;
    return json;
  }

  /// Returns a new [PortMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PortMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PortMapping[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PortMapping[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PortMapping(
        hostIp: mapValueOfType<String>(json, r'host_ip'),
        protocol: mapValueOfType<String>(json, r'protocol'),
        published: mapValueOfType<String>(json, r'published'),
        target: mapValueOfType<String>(json, r'target')!,
      );
    }
    return null;
  }

  static List<PortMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PortMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PortMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PortMapping> mapFromJson(dynamic json) {
    final map = <String, PortMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PortMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PortMapping-objects as value to a dart map
  static Map<String, List<PortMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PortMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PortMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'target',
  };
}

