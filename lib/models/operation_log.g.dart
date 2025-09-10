// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationLogEntry _$OperationLogEntryFromJson(Map<String, dynamic> json) =>
    OperationLogEntry(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      serverId: (json['server_id'] as num).toInt(),
      stackName: json['stack_name'] as String,
      operationId: json['operation_id'] as String,
      command: json['command'] as String,
      options: json['options'] as String,
      services: json['services'] as String,
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      success: json['success'] as bool?,
      exitCode: (json['exit_code'] as num?)?.toInt(),
      durationMs: (json['duration_ms'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      userName: json['user_name'] as String,
      serverName: json['server_name'] as String,
      isIncomplete: json['is_incomplete'] as bool,
      formattedDate: json['formatted_date'] as String,
      messageCount: (json['message_count'] as num).toInt(),
      partialDurationMs: (json['partial_duration_ms'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OperationLogEntryToJson(OperationLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'server_id': instance.serverId,
      'stack_name': instance.stackName,
      'operation_id': instance.operationId,
      'command': instance.command,
      'options': instance.options,
      'services': instance.services,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'success': instance.success,
      'exit_code': instance.exitCode,
      'duration_ms': instance.durationMs,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user_name': instance.userName,
      'server_name': instance.serverName,
      'is_incomplete': instance.isIncomplete,
      'formatted_date': instance.formattedDate,
      'message_count': instance.messageCount,
      'partial_duration_ms': instance.partialDurationMs,
    };

OperationLogMessage _$OperationLogMessageFromJson(Map<String, dynamic> json) =>
    OperationLogMessage(
      id: (json['id'] as num).toInt(),
      operationLogId: (json['operation_log_id'] as num).toInt(),
      messageType: json['message_type'] as String,
      messageData: json['message_data'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      sequenceNumber: (json['sequence_number'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OperationLogMessageToJson(
  OperationLogMessage instance,
) => <String, dynamic>{
  'id': instance.id,
  'operation_log_id': instance.operationLogId,
  'message_type': instance.messageType,
  'message_data': instance.messageData,
  'timestamp': instance.timestamp.toIso8601String(),
  'sequence_number': instance.sequenceNumber,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

OperationLogStats _$OperationLogStatsFromJson(Map<String, dynamic> json) =>
    OperationLogStats(
      totalOperations: (json['total_operations'] as num).toInt(),
      incompleteOperations: (json['incomplete_operations'] as num).toInt(),
      failedOperations: (json['failed_operations'] as num).toInt(),
      successfulOperations: (json['successful_operations'] as num).toInt(),
      recentOperations: (json['recent_operations'] as num).toInt(),
    );

Map<String, dynamic> _$OperationLogStatsToJson(OperationLogStats instance) =>
    <String, dynamic>{
      'total_operations': instance.totalOperations,
      'incomplete_operations': instance.incompleteOperations,
      'failed_operations': instance.failedOperations,
      'successful_operations': instance.successfulOperations,
      'recent_operations': instance.recentOperations,
    };

OperationLogDetail _$OperationLogDetailFromJson(Map<String, dynamic> json) =>
    OperationLogDetail(
      log: OperationLogEntry.fromJson(json['log'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => OperationLogMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OperationLogDetailToJson(OperationLogDetail instance) =>
    <String, dynamic>{'log': instance.log, 'messages': instance.messages};

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) =>
    PaginationInfo(
      currentPage: (json['current_page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      hasNext: json['has_next'] as bool,
      hasPrev: json['has_prev'] as bool,
    );

Map<String, dynamic> _$PaginationInfoToJson(PaginationInfo instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'page_size': instance.pageSize,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'has_next': instance.hasNext,
      'has_prev': instance.hasPrev,
    };

PaginatedOperationLogs _$PaginatedOperationLogsFromJson(
  Map<String, dynamic> json,
) => PaginatedOperationLogs(
  data: (json['data'] as List<dynamic>)
      .map((e) => OperationLogEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: PaginationInfo.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaginatedOperationLogsToJson(
  PaginatedOperationLogs instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
