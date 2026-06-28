//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TerminalStartMessage {
  /// Returns a new [TerminalStartMessage] instance.
  TerminalStartMessage({
    this.cols,
    this.containerName,
    this.rows,
    required this.serviceName,
    this.stackName,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cols;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? containerName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rows;

  String serviceName;

  /// Optional; must match the URL stack when set
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stackName;

  /// Always terminal_start
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TerminalStartMessage &&
    other.cols == cols &&
    other.containerName == containerName &&
    other.rows == rows &&
    other.serviceName == serviceName &&
    other.stackName == stackName &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cols == null ? 0 : cols!.hashCode) +
    (containerName == null ? 0 : containerName!.hashCode) +
    (rows == null ? 0 : rows!.hashCode) +
    (serviceName.hashCode) +
    (stackName == null ? 0 : stackName!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'TerminalStartMessage[cols=$cols, containerName=$containerName, rows=$rows, serviceName=$serviceName, stackName=$stackName, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cols != null) {
      json[r'cols'] = this.cols;
    } else {
      json[r'cols'] = null;
    }
    if (this.containerName != null) {
      json[r'container_name'] = this.containerName;
    } else {
      json[r'container_name'] = null;
    }
    if (this.rows != null) {
      json[r'rows'] = this.rows;
    } else {
      json[r'rows'] = null;
    }
      json[r'service_name'] = this.serviceName;
    if (this.stackName != null) {
      json[r'stack_name'] = this.stackName;
    } else {
      json[r'stack_name'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [TerminalStartMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TerminalStartMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TerminalStartMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TerminalStartMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TerminalStartMessage(
        cols: mapValueOfType<int>(json, r'cols'),
        containerName: mapValueOfType<String>(json, r'container_name'),
        rows: mapValueOfType<int>(json, r'rows'),
        serviceName: mapValueOfType<String>(json, r'service_name')!,
        stackName: mapValueOfType<String>(json, r'stack_name'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<TerminalStartMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TerminalStartMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TerminalStartMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TerminalStartMessage> mapFromJson(dynamic json) {
    final map = <String, TerminalStartMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TerminalStartMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TerminalStartMessage-objects as value to a dart map
  static Map<String, List<TerminalStartMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TerminalStartMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TerminalStartMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'service_name',
    'type',
  };
}

