//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WsApiServersServeridStacksStacknameTerminalGet101Response {
  /// Returns a new [WsApiServersServeridStacksStacknameTerminalGet101Response] instance.
  WsApiServersServeridStacksStacknameTerminalGet101Response({
    required this.cols,
    this.containerName,
    required this.rows,
    required this.serviceName,
    this.stackName,
    required this.type,
    this.input = const [],
    required this.sessionId,
    this.timestamp,
    this.exitCode,
    required this.output,
    this.message,
    required this.error,
  });

  int cols;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? containerName;

  int rows;

  String serviceName;

  /// Optional; must match the URL stack when set
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stackName;

  /// Always error
  String type;

  /// Raw input bytes as integer values
  List<int> input;

  String sessionId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timestamp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? exitCode;

  /// Base64-encoded output bytes
  String output;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  String error;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WsApiServersServeridStacksStacknameTerminalGet101Response &&
    other.cols == cols &&
    other.containerName == containerName &&
    other.rows == rows &&
    other.serviceName == serviceName &&
    other.stackName == stackName &&
    other.type == type &&
    _deepEquality.equals(other.input, input) &&
    other.sessionId == sessionId &&
    other.timestamp == timestamp &&
    other.exitCode == exitCode &&
    other.output == output &&
    other.message == message &&
    other.error == error;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cols.hashCode) +
    (containerName == null ? 0 : containerName!.hashCode) +
    (rows.hashCode) +
    (serviceName.hashCode) +
    (stackName == null ? 0 : stackName!.hashCode) +
    (type.hashCode) +
    (input.hashCode) +
    (sessionId.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (exitCode == null ? 0 : exitCode!.hashCode) +
    (output.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (error.hashCode);

  @override
  String toString() => 'WsApiServersServeridStacksStacknameTerminalGet101Response[cols=$cols, containerName=$containerName, rows=$rows, serviceName=$serviceName, stackName=$stackName, type=$type, input=$input, sessionId=$sessionId, timestamp=$timestamp, exitCode=$exitCode, output=$output, message=$message, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'cols'] = this.cols;
    if (this.containerName != null) {
      json[r'container_name'] = this.containerName;
    } else {
      json[r'container_name'] = null;
    }
      json[r'rows'] = this.rows;
      json[r'service_name'] = this.serviceName;
    if (this.stackName != null) {
      json[r'stack_name'] = this.stackName;
    } else {
      json[r'stack_name'] = null;
    }
      json[r'type'] = this.type;
      json[r'input'] = this.input;
      json[r'session_id'] = this.sessionId;
    if (this.timestamp != null) {
      json[r'timestamp'] = this.timestamp;
    } else {
      json[r'timestamp'] = null;
    }
    if (this.exitCode != null) {
      json[r'exit_code'] = this.exitCode;
    } else {
      json[r'exit_code'] = null;
    }
      json[r'output'] = this.output;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
      json[r'error'] = this.error;
    return json;
  }

  /// Returns a new [WsApiServersServeridStacksStacknameTerminalGet101Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WsApiServersServeridStacksStacknameTerminalGet101Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WsApiServersServeridStacksStacknameTerminalGet101Response[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WsApiServersServeridStacksStacknameTerminalGet101Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WsApiServersServeridStacksStacknameTerminalGet101Response(
        cols: mapValueOfType<int>(json, r'cols')!,
        containerName: mapValueOfType<String>(json, r'container_name'),
        rows: mapValueOfType<int>(json, r'rows')!,
        serviceName: mapValueOfType<String>(json, r'service_name')!,
        stackName: mapValueOfType<String>(json, r'stack_name'),
        type: mapValueOfType<String>(json, r'type')!,
        input: json[r'input'] is Iterable
            ? (json[r'input'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        sessionId: mapValueOfType<String>(json, r'session_id')!,
        timestamp: mapValueOfType<String>(json, r'timestamp'),
        exitCode: mapValueOfType<int>(json, r'exit_code'),
        output: mapValueOfType<String>(json, r'output')!,
        message: mapValueOfType<String>(json, r'message'),
        error: mapValueOfType<String>(json, r'error')!,
      );
    }
    return null;
  }

  static List<WsApiServersServeridStacksStacknameTerminalGet101Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WsApiServersServeridStacksStacknameTerminalGet101Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WsApiServersServeridStacksStacknameTerminalGet101Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WsApiServersServeridStacksStacknameTerminalGet101Response> mapFromJson(dynamic json) {
    final map = <String, WsApiServersServeridStacksStacknameTerminalGet101Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WsApiServersServeridStacksStacknameTerminalGet101Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WsApiServersServeridStacksStacknameTerminalGet101Response-objects as value to a dart map
  static Map<String, List<WsApiServersServeridStacksStacknameTerminalGet101Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WsApiServersServeridStacksStacknameTerminalGet101Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WsApiServersServeridStacksStacknameTerminalGet101Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'cols',
    'rows',
    'service_name',
    'type',
    'input',
    'session_id',
    'output',
    'error',
  };
}

