//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationLog {
  /// Returns a new [OperationLog] instance.
  OperationLog({
    required this.command,
    required this.createdAt,
    this.deletedAt,
    this.durationMs,
    this.endTime,
    this.exitCode,
    required this.id,
    this.lastMessageAt,
    required this.operationId,
    this.options,
    this.queuedAt,
    required this.server,
    required this.serverId,
    this.services,
    required this.stackName,
    this.startTime,
    this.status,
    this.success,
    this.summary,
    required this.updatedAt,
    required this.user,
    required this.userId,
  });

  String command;

  DateTime createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DeletedAt? deletedAt;

  int? durationMs;

  DateTime? endTime;

  int? exitCode;

  /// Minimum value: 0
  int id;

  DateTime? lastMessageAt;

  String operationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? options;

  DateTime? queuedAt;

  Server server;

  /// Minimum value: 0
  int serverId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? services;

  String stackName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  bool? success;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  DateTime updatedAt;

  User user;

  /// Minimum value: 0
  int userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationLog &&
    other.command == command &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.durationMs == durationMs &&
    other.endTime == endTime &&
    other.exitCode == exitCode &&
    other.id == id &&
    other.lastMessageAt == lastMessageAt &&
    other.operationId == operationId &&
    other.options == options &&
    other.queuedAt == queuedAt &&
    other.server == server &&
    other.serverId == serverId &&
    other.services == services &&
    other.stackName == stackName &&
    other.startTime == startTime &&
    other.status == status &&
    other.success == success &&
    other.summary == summary &&
    other.updatedAt == updatedAt &&
    other.user == user &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (command.hashCode) +
    (createdAt.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (durationMs == null ? 0 : durationMs!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (exitCode == null ? 0 : exitCode!.hashCode) +
    (id.hashCode) +
    (lastMessageAt == null ? 0 : lastMessageAt!.hashCode) +
    (operationId.hashCode) +
    (options == null ? 0 : options!.hashCode) +
    (queuedAt == null ? 0 : queuedAt!.hashCode) +
    (server.hashCode) +
    (serverId.hashCode) +
    (services == null ? 0 : services!.hashCode) +
    (stackName.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (success == null ? 0 : success!.hashCode) +
    (summary == null ? 0 : summary!.hashCode) +
    (updatedAt.hashCode) +
    (user.hashCode) +
    (userId.hashCode);

  @override
  String toString() => 'OperationLog[command=$command, createdAt=$createdAt, deletedAt=$deletedAt, durationMs=$durationMs, endTime=$endTime, exitCode=$exitCode, id=$id, lastMessageAt=$lastMessageAt, operationId=$operationId, options=$options, queuedAt=$queuedAt, server=$server, serverId=$serverId, services=$services, stackName=$stackName, startTime=$startTime, status=$status, success=$success, summary=$summary, updatedAt=$updatedAt, user=$user, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'command'] = this.command;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
    if (this.deletedAt != null) {
      json[r'deleted_at'] = this.deletedAt;
    } else {
      json[r'deleted_at'] = null;
    }
    if (this.durationMs != null) {
      json[r'duration_ms'] = this.durationMs;
    } else {
      json[r'duration_ms'] = null;
    }
    if (this.endTime != null) {
      json[r'end_time'] = this.endTime!.toUtc().toIso8601String();
    } else {
      json[r'end_time'] = null;
    }
    if (this.exitCode != null) {
      json[r'exit_code'] = this.exitCode;
    } else {
      json[r'exit_code'] = null;
    }
      json[r'id'] = this.id;
    if (this.lastMessageAt != null) {
      json[r'last_message_at'] = this.lastMessageAt!.toUtc().toIso8601String();
    } else {
      json[r'last_message_at'] = null;
    }
      json[r'operation_id'] = this.operationId;
    if (this.options != null) {
      json[r'options'] = this.options;
    } else {
      json[r'options'] = null;
    }
    if (this.queuedAt != null) {
      json[r'queued_at'] = this.queuedAt!.toUtc().toIso8601String();
    } else {
      json[r'queued_at'] = null;
    }
      json[r'server'] = this.server;
      json[r'server_id'] = this.serverId;
    if (this.services != null) {
      json[r'services'] = this.services;
    } else {
      json[r'services'] = null;
    }
      json[r'stack_name'] = this.stackName;
    if (this.startTime != null) {
      json[r'start_time'] = this.startTime!.toUtc().toIso8601String();
    } else {
      json[r'start_time'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.success != null) {
      json[r'success'] = this.success;
    } else {
      json[r'success'] = null;
    }
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'user'] = this.user;
      json[r'user_id'] = this.userId;
    return json;
  }

  /// Returns a new [OperationLog] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationLog? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OperationLog[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OperationLog[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OperationLog(
        command: mapValueOfType<String>(json, r'command')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at']),
        durationMs: mapValueOfType<int>(json, r'duration_ms'),
        endTime: mapDateTime(json, r'end_time', r''),
        exitCode: mapValueOfType<int>(json, r'exit_code'),
        id: mapValueOfType<int>(json, r'id')!,
        lastMessageAt: mapDateTime(json, r'last_message_at', r''),
        operationId: mapValueOfType<String>(json, r'operation_id')!,
        options: mapValueOfType<String>(json, r'options'),
        queuedAt: mapDateTime(json, r'queued_at', r''),
        server: Server.fromJson(json[r'server'])!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        services: mapValueOfType<String>(json, r'services'),
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        startTime: mapDateTime(json, r'start_time', r''),
        status: mapValueOfType<String>(json, r'status'),
        success: mapValueOfType<bool>(json, r'success'),
        summary: mapValueOfType<String>(json, r'summary'),
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        user: User.fromJson(json[r'user'])!,
        userId: mapValueOfType<int>(json, r'user_id')!,
      );
    }
    return null;
  }

  static List<OperationLog> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationLog>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationLog.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationLog> mapFromJson(dynamic json) {
    final map = <String, OperationLog>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationLog.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationLog-objects as value to a dart map
  static Map<String, List<OperationLog>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationLog>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationLog.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'command',
    'created_at',
    'id',
    'operation_id',
    'server',
    'server_id',
    'stack_name',
    'updated_at',
    'user',
    'user_id',
  };
}

