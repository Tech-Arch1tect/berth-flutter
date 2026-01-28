//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LogEntry {
  /// Returns a new [LogEntry] instance.
  LogEntry({
    this.level,
    required this.message,
    required this.source_,
    required this.timestamp,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? level;

  String message;

  String source_;

  DateTime timestamp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LogEntry &&
    other.level == level &&
    other.message == message &&
    other.source_ == source_ &&
    other.timestamp == timestamp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (level == null ? 0 : level!.hashCode) +
    (message.hashCode) +
    (source_.hashCode) +
    (timestamp.hashCode);

  @override
  String toString() => 'LogEntry[level=$level, message=$message, source_=$source_, timestamp=$timestamp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.level != null) {
      json[r'level'] = this.level;
    } else {
      json[r'level'] = null;
    }
      json[r'message'] = this.message;
      json[r'source'] = this.source_;
      json[r'timestamp'] = this.timestamp.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [LogEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LogEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LogEntry[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LogEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LogEntry(
        level: mapValueOfType<String>(json, r'level'),
        message: mapValueOfType<String>(json, r'message')!,
        source_: mapValueOfType<String>(json, r'source')!,
        timestamp: mapDateTime(json, r'timestamp', r'')!,
      );
    }
    return null;
  }

  static List<LogEntry> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LogEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LogEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LogEntry> mapFromJson(dynamic json) {
    final map = <String, LogEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LogEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LogEntry-objects as value to a dart map
  static Map<String, List<LogEntry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LogEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LogEntry.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'source',
    'timestamp',
  };
}

