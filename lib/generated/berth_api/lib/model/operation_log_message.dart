//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationLogMessage {
  /// Returns a new [OperationLogMessage] instance.
  OperationLogMessage({
    required this.createdAt,
    required this.deletedAt,
    required this.id,
    required this.messageData,
    required this.messageType,
    required this.operationLog,
    required this.operationLogId,
    required this.sequenceNumber,
    required this.timestamp,
    required this.updatedAt,
  });

  DateTime createdAt;

  DeletedAt deletedAt;

  /// Minimum value: 0
  int id;

  String messageData;

  String messageType;

  OperationLog operationLog;

  /// Minimum value: 0
  int operationLogId;

  int sequenceNumber;

  DateTime timestamp;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationLogMessage &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.id == id &&
    other.messageData == messageData &&
    other.messageType == messageType &&
    other.operationLog == operationLog &&
    other.operationLogId == operationLogId &&
    other.sequenceNumber == sequenceNumber &&
    other.timestamp == timestamp &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (deletedAt.hashCode) +
    (id.hashCode) +
    (messageData.hashCode) +
    (messageType.hashCode) +
    (operationLog.hashCode) +
    (operationLogId.hashCode) +
    (sequenceNumber.hashCode) +
    (timestamp.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'OperationLogMessage[createdAt=$createdAt, deletedAt=$deletedAt, id=$id, messageData=$messageData, messageType=$messageType, operationLog=$operationLog, operationLogId=$operationLogId, sequenceNumber=$sequenceNumber, timestamp=$timestamp, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'deleted_at'] = this.deletedAt;
      json[r'id'] = this.id;
      json[r'message_data'] = this.messageData;
      json[r'message_type'] = this.messageType;
      json[r'operation_log'] = this.operationLog;
      json[r'operation_log_id'] = this.operationLogId;
      json[r'sequence_number'] = this.sequenceNumber;
      json[r'timestamp'] = this.timestamp.toUtc().toIso8601String();
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [OperationLogMessage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationLogMessage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OperationLogMessage[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OperationLogMessage[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OperationLogMessage(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at'])!,
        id: mapValueOfType<int>(json, r'id')!,
        messageData: mapValueOfType<String>(json, r'message_data')!,
        messageType: mapValueOfType<String>(json, r'message_type')!,
        operationLog: OperationLog.fromJson(json[r'operation_log'])!,
        operationLogId: mapValueOfType<int>(json, r'operation_log_id')!,
        sequenceNumber: mapValueOfType<int>(json, r'sequence_number')!,
        timestamp: mapDateTime(json, r'timestamp', r'')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<OperationLogMessage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationLogMessage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationLogMessage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationLogMessage> mapFromJson(dynamic json) {
    final map = <String, OperationLogMessage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationLogMessage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationLogMessage-objects as value to a dart map
  static Map<String, List<OperationLogMessage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationLogMessage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationLogMessage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'deleted_at',
    'id',
    'message_data',
    'message_type',
    'operation_log',
    'operation_log_id',
    'sequence_number',
    'timestamp',
    'updated_at',
  };
}

