//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkInfo {
  /// Returns a new [NetworkInfo] instance.
  NetworkInfo({
    required this.created,
    required this.driver,
    required this.id,
    required this.internal,
    this.labels = const {},
    required this.name,
    required this.scope,
    required this.subnet,
    required this.unused,
  });

  DateTime created;

  String driver;

  String id;

  bool internal;

  Map<String, String> labels;

  String name;

  String scope;

  String subnet;

  bool unused;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NetworkInfo &&
    other.created == created &&
    other.driver == driver &&
    other.id == id &&
    other.internal == internal &&
    _deepEquality.equals(other.labels, labels) &&
    other.name == name &&
    other.scope == scope &&
    other.subnet == subnet &&
    other.unused == unused;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created.hashCode) +
    (driver.hashCode) +
    (id.hashCode) +
    (internal.hashCode) +
    (labels.hashCode) +
    (name.hashCode) +
    (scope.hashCode) +
    (subnet.hashCode) +
    (unused.hashCode);

  @override
  String toString() => 'NetworkInfo[created=$created, driver=$driver, id=$id, internal=$internal, labels=$labels, name=$name, scope=$scope, subnet=$subnet, unused=$unused]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created'] = this.created.toUtc().toIso8601String();
      json[r'driver'] = this.driver;
      json[r'id'] = this.id;
      json[r'internal'] = this.internal;
      json[r'labels'] = this.labels;
      json[r'name'] = this.name;
      json[r'scope'] = this.scope;
      json[r'subnet'] = this.subnet;
      json[r'unused'] = this.unused;
    return json;
  }

  /// Returns a new [NetworkInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NetworkInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NetworkInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NetworkInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NetworkInfo(
        created: mapDateTime(json, r'created', r'')!,
        driver: mapValueOfType<String>(json, r'driver')!,
        id: mapValueOfType<String>(json, r'id')!,
        internal: mapValueOfType<bool>(json, r'internal')!,
        labels: mapCastOfType<String, String>(json, r'labels')!,
        name: mapValueOfType<String>(json, r'name')!,
        scope: mapValueOfType<String>(json, r'scope')!,
        subnet: mapValueOfType<String>(json, r'subnet')!,
        unused: mapValueOfType<bool>(json, r'unused')!,
      );
    }
    return null;
  }

  static List<NetworkInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NetworkInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NetworkInfo> mapFromJson(dynamic json) {
    final map = <String, NetworkInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NetworkInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NetworkInfo-objects as value to a dart map
  static Map<String, List<NetworkInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NetworkInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NetworkInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'driver',
    'id',
    'internal',
    'labels',
    'name',
    'scope',
    'subnet',
    'unused',
  };
}

