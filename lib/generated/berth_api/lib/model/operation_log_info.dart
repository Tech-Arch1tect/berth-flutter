//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class OperationLogInfo {
  /// Returns a new [OperationLogInfo] instance.
  OperationLogInfo({
    required this.command,
    required this.createdAt,
    this.deletedAt,
    this.durationMs,
    this.endTime,
    this.exitCode,
    required this.formattedDate,
    required this.id,
    required this.isIncomplete,
    this.lastMessageAt,
    required this.messageCount,
    required this.operationId,
    this.options,
    this.partialDurationMs,
    this.queuedAt,
    required this.server,
    required this.serverId,
    required this.serverName,
    this.services,
    required this.stackName,
    this.startTime,
    this.status,
    this.success,
    this.summary,
    required this.triggerSource,
    required this.updatedAt,
    required this.user,
    required this.userId,
    required this.userName,
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

  String formattedDate;

  /// Minimum value: 0
  int id;

  bool isIncomplete;

  DateTime? lastMessageAt;

  int messageCount;

  String operationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? options;

  int? partialDurationMs;

  DateTime? queuedAt;

  Server server;

  /// Minimum value: 0
  int serverId;

  String serverName;

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

  String triggerSource;

  DateTime updatedAt;

  User user;

  /// Minimum value: 0
  int userId;

  String userName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is OperationLogInfo &&
    other.command == command &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.durationMs == durationMs &&
    other.endTime == endTime &&
    other.exitCode == exitCode &&
    other.formattedDate == formattedDate &&
    other.id == id &&
    other.isIncomplete == isIncomplete &&
    other.lastMessageAt == lastMessageAt &&
    other.messageCount == messageCount &&
    other.operationId == operationId &&
    other.options == options &&
    other.partialDurationMs == partialDurationMs &&
    other.queuedAt == queuedAt &&
    other.server == server &&
    other.serverId == serverId &&
    other.serverName == serverName &&
    other.services == services &&
    other.stackName == stackName &&
    other.startTime == startTime &&
    other.status == status &&
    other.success == success &&
    other.summary == summary &&
    other.triggerSource == triggerSource &&
    other.updatedAt == updatedAt &&
    other.user == user &&
    other.userId == userId &&
    other.userName == userName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (command.hashCode) +
    (createdAt.hashCode) +
    (deletedAt == null ? 0 : deletedAt!.hashCode) +
    (durationMs == null ? 0 : durationMs!.hashCode) +
    (endTime == null ? 0 : endTime!.hashCode) +
    (exitCode == null ? 0 : exitCode!.hashCode) +
    (formattedDate.hashCode) +
    (id.hashCode) +
    (isIncomplete.hashCode) +
    (lastMessageAt == null ? 0 : lastMessageAt!.hashCode) +
    (messageCount.hashCode) +
    (operationId.hashCode) +
    (options == null ? 0 : options!.hashCode) +
    (partialDurationMs == null ? 0 : partialDurationMs!.hashCode) +
    (queuedAt == null ? 0 : queuedAt!.hashCode) +
    (server.hashCode) +
    (serverId.hashCode) +
    (serverName.hashCode) +
    (services == null ? 0 : services!.hashCode) +
    (stackName.hashCode) +
    (startTime == null ? 0 : startTime!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (success == null ? 0 : success!.hashCode) +
    (summary == null ? 0 : summary!.hashCode) +
    (triggerSource.hashCode) +
    (updatedAt.hashCode) +
    (user.hashCode) +
    (userId.hashCode) +
    (userName.hashCode);

  @override
  String toString() => 'OperationLogInfo[command=$command, createdAt=$createdAt, deletedAt=$deletedAt, durationMs=$durationMs, endTime=$endTime, exitCode=$exitCode, formattedDate=$formattedDate, id=$id, isIncomplete=$isIncomplete, lastMessageAt=$lastMessageAt, messageCount=$messageCount, operationId=$operationId, options=$options, partialDurationMs=$partialDurationMs, queuedAt=$queuedAt, server=$server, serverId=$serverId, serverName=$serverName, services=$services, stackName=$stackName, startTime=$startTime, status=$status, success=$success, summary=$summary, triggerSource=$triggerSource, updatedAt=$updatedAt, user=$user, userId=$userId, userName=$userName]';

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
      json[r'formatted_date'] = this.formattedDate;
      json[r'id'] = this.id;
      json[r'is_incomplete'] = this.isIncomplete;
    if (this.lastMessageAt != null) {
      json[r'last_message_at'] = this.lastMessageAt!.toUtc().toIso8601String();
    } else {
      json[r'last_message_at'] = null;
    }
      json[r'message_count'] = this.messageCount;
      json[r'operation_id'] = this.operationId;
    if (this.options != null) {
      json[r'options'] = this.options;
    } else {
      json[r'options'] = null;
    }
    if (this.partialDurationMs != null) {
      json[r'partial_duration_ms'] = this.partialDurationMs;
    } else {
      json[r'partial_duration_ms'] = null;
    }
    if (this.queuedAt != null) {
      json[r'queued_at'] = this.queuedAt!.toUtc().toIso8601String();
    } else {
      json[r'queued_at'] = null;
    }
      json[r'server'] = this.server;
      json[r'server_id'] = this.serverId;
      json[r'server_name'] = this.serverName;
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
      json[r'trigger_source'] = this.triggerSource;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'user'] = this.user;
      json[r'user_id'] = this.userId;
      json[r'user_name'] = this.userName;
    return json;
  }

  /// Returns a new [OperationLogInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OperationLogInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OperationLogInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OperationLogInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OperationLogInfo(
        command: mapValueOfType<String>(json, r'command')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at']),
        durationMs: mapValueOfType<int>(json, r'duration_ms'),
        endTime: mapDateTime(json, r'end_time', r''),
        exitCode: mapValueOfType<int>(json, r'exit_code'),
        formattedDate: mapValueOfType<String>(json, r'formatted_date')!,
        id: mapValueOfType<int>(json, r'id')!,
        isIncomplete: mapValueOfType<bool>(json, r'is_incomplete')!,
        lastMessageAt: mapDateTime(json, r'last_message_at', r''),
        messageCount: mapValueOfType<int>(json, r'message_count')!,
        operationId: mapValueOfType<String>(json, r'operation_id')!,
        options: mapValueOfType<String>(json, r'options'),
        partialDurationMs: mapValueOfType<int>(json, r'partial_duration_ms'),
        queuedAt: mapDateTime(json, r'queued_at', r''),
        server: Server.fromJson(json[r'server'])!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        serverName: mapValueOfType<String>(json, r'server_name')!,
        services: mapValueOfType<String>(json, r'services'),
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        startTime: mapDateTime(json, r'start_time', r''),
        status: mapValueOfType<String>(json, r'status'),
        success: mapValueOfType<bool>(json, r'success'),
        summary: mapValueOfType<String>(json, r'summary'),
        triggerSource: mapValueOfType<String>(json, r'trigger_source')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        user: User.fromJson(json[r'user'])!,
        userId: mapValueOfType<int>(json, r'user_id')!,
        userName: mapValueOfType<String>(json, r'user_name')!,
      );
    }
    return null;
  }

  static List<OperationLogInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OperationLogInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OperationLogInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OperationLogInfo> mapFromJson(dynamic json) {
    final map = <String, OperationLogInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OperationLogInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OperationLogInfo-objects as value to a dart map
  static Map<String, List<OperationLogInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OperationLogInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OperationLogInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'command',
    'created_at',
    'formatted_date',
    'id',
    'is_incomplete',
    'message_count',
    'operation_id',
    'server',
    'server_id',
    'server_name',
    'stack_name',
    'trigger_source',
    'updated_at',
    'user',
    'user_id',
    'user_name',
  };
}

