//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PruneRequest {
  /// Returns a new [PruneRequest] instance.
  PruneRequest({
    required this.all,
    required this.filters,
    required this.force,
    required this.type,
  });

  bool all;

  String filters;

  bool force;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PruneRequest &&
    other.all == all &&
    other.filters == filters &&
    other.force == force &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (all.hashCode) +
    (filters.hashCode) +
    (force.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'PruneRequest[all=$all, filters=$filters, force=$force, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'all'] = this.all;
      json[r'filters'] = this.filters;
      json[r'force'] = this.force;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [PruneRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PruneRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PruneRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PruneRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PruneRequest(
        all: mapValueOfType<bool>(json, r'all')!,
        filters: mapValueOfType<String>(json, r'filters')!,
        force: mapValueOfType<bool>(json, r'force')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<PruneRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PruneRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PruneRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PruneRequest> mapFromJson(dynamic json) {
    final map = <String, PruneRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PruneRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PruneRequest-objects as value to a dart map
  static Map<String, List<PruneRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PruneRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PruneRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'all',
    'filters',
    'force',
    'type',
  };
}

