//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LogsData {
  /// Returns a new [LogsData] instance.
  LogsData({
    this.logs = const [],
  });

  List<LogEntry> logs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LogsData &&
    _deepEquality.equals(other.logs, logs);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (logs.hashCode);

  @override
  String toString() => 'LogsData[logs=$logs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'logs'] = this.logs;
    return json;
  }

  /// Returns a new [LogsData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LogsData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LogsData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LogsData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LogsData(
        logs: LogEntry.listFromJson(json[r'logs']),
      );
    }
    return null;
  }

  static List<LogsData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LogsData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LogsData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LogsData> mapFromJson(dynamic json) {
    final map = <String, LogsData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LogsData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LogsData-objects as value to a dart map
  static Map<String, List<LogsData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LogsData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LogsData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'logs',
  };
}

