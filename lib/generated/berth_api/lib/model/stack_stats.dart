//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackStats {
  /// Returns a new [StackStats] instance.
  StackStats({
    this.containers = const [],
    required this.stackName,
  });

  List<ContainerStats> containers;

  String stackName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackStats &&
    _deepEquality.equals(other.containers, containers) &&
    other.stackName == stackName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containers.hashCode) +
    (stackName.hashCode);

  @override
  String toString() => 'StackStats[containers=$containers, stackName=$stackName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'containers'] = this.containers;
      json[r'stack_name'] = this.stackName;
    return json;
  }

  /// Returns a new [StackStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackStats(
        containers: ContainerStats.listFromJson(json[r'containers']),
        stackName: mapValueOfType<String>(json, r'stack_name')!,
      );
    }
    return null;
  }

  static List<StackStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackStats> mapFromJson(dynamic json) {
    final map = <String, StackStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackStats-objects as value to a dart map
  static Map<String, List<StackStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'containers',
    'stack_name',
  };
}

