import 'package:json_annotation/json_annotation.dart';

part 'operation_log.g.dart';

@JsonSerializable()
class OperationLogEntry {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'server_id')
  final int serverId;
  @JsonKey(name: 'stack_name')
  final String stackName;
  @JsonKey(name: 'operation_id')
  final String operationId;
  final String command;
  final String options;
  final String services;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime? endTime;
  final bool? success;
  @JsonKey(name: 'exit_code')
  final int? exitCode;
  @JsonKey(name: 'duration_ms')
  final int? durationMs;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'user_name')
  final String userName;
  @JsonKey(name: 'server_name')
  final String serverName;
  @JsonKey(name: 'is_incomplete')
  final bool isIncomplete;
  @JsonKey(name: 'formatted_date')
  final String formattedDate;
  @JsonKey(name: 'message_count')
  final int messageCount;
  @JsonKey(name: 'partial_duration_ms')
  final int? partialDurationMs;

  const OperationLogEntry({
    required this.id,
    required this.userId,
    required this.serverId,
    required this.stackName,
    required this.operationId,
    required this.command,
    required this.options,
    required this.services,
    required this.startTime,
    this.endTime,
    this.success,
    this.exitCode,
    this.durationMs,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.serverName,
    required this.isIncomplete,
    required this.formattedDate,
    required this.messageCount,
    this.partialDurationMs,
  });

  factory OperationLogEntry.fromJson(Map<String, dynamic> json) => _$OperationLogEntryFromJson(json);
  Map<String, dynamic> toJson() => _$OperationLogEntryToJson(this);
}

@JsonSerializable()
class OperationLogMessage {
  final int id;
  @JsonKey(name: 'operation_log_id')
  final int operationLogId;
  @JsonKey(name: 'message_type')
  final String messageType;
  @JsonKey(name: 'message_data')
  final String messageData;
  final DateTime timestamp;
  @JsonKey(name: 'sequence_number')
  final int sequenceNumber;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const OperationLogMessage({
    required this.id,
    required this.operationLogId,
    required this.messageType,
    required this.messageData,
    required this.timestamp,
    required this.sequenceNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OperationLogMessage.fromJson(Map<String, dynamic> json) => _$OperationLogMessageFromJson(json);
  Map<String, dynamic> toJson() => _$OperationLogMessageToJson(this);
}

@JsonSerializable()
class OperationLogStats {
  @JsonKey(name: 'total_operations')
  final int totalOperations;
  @JsonKey(name: 'incomplete_operations')
  final int incompleteOperations;
  @JsonKey(name: 'failed_operations')
  final int failedOperations;
  @JsonKey(name: 'successful_operations')
  final int successfulOperations;
  @JsonKey(name: 'recent_operations')
  final int recentOperations;

  const OperationLogStats({
    required this.totalOperations,
    required this.incompleteOperations,
    required this.failedOperations,
    required this.successfulOperations,
    required this.recentOperations,
  });

  factory OperationLogStats.fromJson(Map<String, dynamic> json) => _$OperationLogStatsFromJson(json);
  Map<String, dynamic> toJson() => _$OperationLogStatsToJson(this);
}

@JsonSerializable()
class OperationLogDetail {
  final OperationLogEntry log;
  final List<OperationLogMessage> messages;

  const OperationLogDetail({
    required this.log,
    required this.messages,
  });

  factory OperationLogDetail.fromJson(Map<String, dynamic> json) => _$OperationLogDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OperationLogDetailToJson(this);
}

@JsonSerializable()
class PaginationInfo {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'page_size')
  final int pageSize;
  final int total;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'has_next')
  final bool hasNext;
  @JsonKey(name: 'has_prev')
  final bool hasPrev;

  const PaginationInfo({
    required this.currentPage,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) => _$PaginationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);
}

@JsonSerializable()
class PaginatedOperationLogs {
  final List<OperationLogEntry> data;
  final PaginationInfo pagination;

  const PaginatedOperationLogs({
    required this.data,
    required this.pagination,
  });

  factory PaginatedOperationLogs.fromJson(Map<String, dynamic> json) => _$PaginatedOperationLogsFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedOperationLogsToJson(this);
}