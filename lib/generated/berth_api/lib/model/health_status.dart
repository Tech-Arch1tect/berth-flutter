//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HealthStatus {
  /// Returns a new [HealthStatus] instance.
  HealthStatus({
    this.failingStreak,
    this.log = const [],
    required this.status,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failingStreak;

  List<HealthLog> log;

  String status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HealthStatus &&
    other.failingStreak == failingStreak &&
    _deepEquality.equals(other.log, log) &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (failingStreak == null ? 0 : failingStreak!.hashCode) +
    (log.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'HealthStatus[failingStreak=$failingStreak, log=$log, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.failingStreak != null) {
      json[r'failing_streak'] = this.failingStreak;
    } else {
      json[r'failing_streak'] = null;
    }
      json[r'log'] = this.log;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [HealthStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HealthStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "HealthStatus[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "HealthStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return HealthStatus(
        failingStreak: mapValueOfType<int>(json, r'failing_streak'),
        log: HealthLog.listFromJson(json[r'log']),
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<HealthStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HealthStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HealthStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HealthStatus> mapFromJson(dynamic json) {
    final map = <String, HealthStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HealthStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HealthStatus-objects as value to a dart map
  static Map<String, List<HealthStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HealthStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = HealthStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
  };
}

