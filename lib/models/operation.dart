import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable()
class OperationRequest {
  final String command;
  final List<String> options;
  final List<String> services;

  const OperationRequest({
    required this.command,
    this.options = const [],
    this.services = const [],
  });

  factory OperationRequest.fromJson(Map<String, dynamic> json) =>
      _$OperationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OperationRequestToJson(this);
}

@JsonSerializable()
class OperationResponse {
  @JsonKey(name: 'operationId')
  final String operationId;

  const OperationResponse({
    required this.operationId,
  });

  factory OperationResponse.fromJson(Map<String, dynamic> json) =>
      _$OperationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OperationResponseToJson(this);
}

@JsonSerializable()
class StreamMessage {
  final String type;
  final String? data;
  final String? timestamp;
  final bool? success;
  @JsonKey(name: 'exitCode')
  final int? exitCode;

  const StreamMessage({
    required this.type,
    this.data,
    this.timestamp,
    this.success,
    this.exitCode,
  });

  factory StreamMessage.fromJson(Map<String, dynamic> json) =>
      _$StreamMessageFromJson(json);

  Map<String, dynamic> toJson() => _$StreamMessageToJson(this);
}

@JsonSerializable()
class OperationWebSocketMessage {
  final String type;
  final dynamic data;
  final String? error;
  final String? message;

  const OperationWebSocketMessage({
    required this.type,
    this.data,
    this.error,
    this.message,
  });

  factory OperationWebSocketMessage.fromJson(Map<String, dynamic> json) =>
      _$OperationWebSocketMessageFromJson(json);

  Map<String, dynamic> toJson() => _$OperationWebSocketMessageToJson(this);
}

class OperationPreset {
  final String id;
  final String name;
  final String description;
  final String command;
  final List<String> options;
  final String? icon;
  final OperationVariant? variant;

  const OperationPreset({
    required this.id,
    required this.name,
    required this.description,
    required this.command,
    this.options = const [],
    this.icon,
    this.variant,
  });
}

enum OperationVariant {
  primary,
  secondary,
  success,
  warning,
  danger,
}

class OperationStatus {
  final bool isRunning;
  final String? operationId;
  final String? command;
  final DateTime? startTime;
  final List<StreamMessage> logs;

  const OperationStatus({
    required this.isRunning,
    this.operationId,
    this.command,
    this.startTime,
    this.logs = const [],
  });

  OperationStatus copyWith({
    bool? isRunning,
    String? operationId,
    String? command,
    DateTime? startTime,
    List<StreamMessage>? logs,
  }) {
    return OperationStatus(
      isRunning: isRunning ?? this.isRunning,
      operationId: operationId ?? this.operationId,
      command: command ?? this.command,
      startTime: startTime ?? this.startTime,
      logs: logs ?? this.logs,
    );
  }
}