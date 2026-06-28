//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TerminalOutputMessage {
  /// Returns a new [TerminalOutputMessage] instance.
  TerminalOutputMessage({
    required this.output,
    required this.sessionId,
    this.timestamp,
    required this.type,
  });

  /// Base64-encoded output bytes
  String output;

  String sessionId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timestamp;

  /// Always terminal_output
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TerminalOutputMessage &&
    other.output == output &&
    other.sessionId == sessionId &&
    other.timestamp == timestamp &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (output.hashCode) +
    (sessionId.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'TerminalOutputMessage[output=$output, sessionId=$sessionId, timestamp=$timestamp, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'output'] = this.output;
      json[r'session_id'] = this.sessionId;
    if (this.timestamp != null) {
      json[r'timestamp'] = this.timestamp;
    } else {
      json[r'timestamp'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [TerminalOutputMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TerminalOutputMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TerminalOutputMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TerminalOutputMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TerminalOutputMessage(
        output: mapValueOfType<String>(json, r'output')!,
        sessionId: mapValueOfType<String>(json, r'session_id')!,
        timestamp: mapValueOfType<String>(json, r'timestamp'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<TerminalOutputMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TerminalOutputMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TerminalOutputMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TerminalOutputMessage> mapFromJson(dynamic json) {
    final map = <String, TerminalOutputMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TerminalOutputMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TerminalOutputMessage-objects as value to a dart map
  static Map<String, List<TerminalOutputMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TerminalOutputMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TerminalOutputMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'output',
    'session_id',
    'type',
  };
}

