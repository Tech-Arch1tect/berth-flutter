//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StreamMessage {
  /// Returns a new [StreamMessage] instance.
  StreamMessage({
    this.data,
    this.exitCode,
    this.success,
    required this.timestamp,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? data;

  int? exitCode;

  bool? success;

  DateTime timestamp;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StreamMessage &&
    other.data == data &&
    other.exitCode == exitCode &&
    other.success == success &&
    other.timestamp == timestamp &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data == null ? 0 : data!.hashCode) +
    (exitCode == null ? 0 : exitCode!.hashCode) +
    (success == null ? 0 : success!.hashCode) +
    (timestamp.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'StreamMessage[data=$data, exitCode=$exitCode, success=$success, timestamp=$timestamp, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    if (this.exitCode != null) {
      json[r'exitCode'] = this.exitCode;
    } else {
      json[r'exitCode'] = null;
    }
    if (this.success != null) {
      json[r'success'] = this.success;
    } else {
      json[r'success'] = null;
    }
      json[r'timestamp'] = this.timestamp.toUtc().toIso8601String();
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [StreamMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StreamMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StreamMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StreamMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StreamMessage(
        data: mapValueOfType<String>(json, r'data'),
        exitCode: mapValueOfType<int>(json, r'exitCode'),
        success: mapValueOfType<bool>(json, r'success'),
        timestamp: mapDateTime(json, r'timestamp', r'')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<StreamMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StreamMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StreamMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StreamMessage> mapFromJson(dynamic json) {
    final map = <String, StreamMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StreamMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StreamMessage-objects as value to a dart map
  static Map<String, List<StreamMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StreamMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StreamMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'timestamp',
    'type',
  };
}

