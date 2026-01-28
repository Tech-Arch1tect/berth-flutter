//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NetworkSummary {
  /// Returns a new [NetworkSummary] instance.
  NetworkSummary({
    this.networks = const [],
    required this.totalCount,
    required this.unusedCount,
  });

  List<NetworkInfo> networks;

  int totalCount;

  int unusedCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NetworkSummary &&
    _deepEquality.equals(other.networks, networks) &&
    other.totalCount == totalCount &&
    other.unusedCount == unusedCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (networks.hashCode) +
    (totalCount.hashCode) +
    (unusedCount.hashCode);

  @override
  String toString() => 'NetworkSummary[networks=$networks, totalCount=$totalCount, unusedCount=$unusedCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'networks'] = this.networks;
      json[r'total_count'] = this.totalCount;
      json[r'unused_count'] = this.unusedCount;
    return json;
  }

  /// Returns a new [NetworkSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NetworkSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NetworkSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NetworkSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NetworkSummary(
        networks: NetworkInfo.listFromJson(json[r'networks']),
        totalCount: mapValueOfType<int>(json, r'total_count')!,
        unusedCount: mapValueOfType<int>(json, r'unused_count')!,
      );
    }
    return null;
  }

  static List<NetworkSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NetworkSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NetworkSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NetworkSummary> mapFromJson(dynamic json) {
    final map = <String, NetworkSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NetworkSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NetworkSummary-objects as value to a dart map
  static Map<String, List<NetworkSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NetworkSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NetworkSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'networks',
    'total_count',
    'unused_count',
  };
}

