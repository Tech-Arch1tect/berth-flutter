// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OperationRequest _$OperationRequestFromJson(
  Map<String, dynamic> json,
) => OperationRequest(
  command: json['command'] as String,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  services:
      (json['services'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$OperationRequestToJson(OperationRequest instance) =>
    <String, dynamic>{
      'command': instance.command,
      'options': instance.options,
      'services': instance.services,
    };

OperationResponse _$OperationResponseFromJson(Map<String, dynamic> json) =>
    OperationResponse(operationId: json['operationId'] as String);

Map<String, dynamic> _$OperationResponseToJson(OperationResponse instance) =>
    <String, dynamic>{'operationId': instance.operationId};

StreamMessage _$StreamMessageFromJson(Map<String, dynamic> json) =>
    StreamMessage(
      type: json['type'] as String,
      data: json['data'] as String?,
      timestamp: json['timestamp'] as String?,
      success: json['success'] as bool?,
      exitCode: (json['exitCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StreamMessageToJson(StreamMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'timestamp': instance.timestamp,
      'success': instance.success,
      'exitCode': instance.exitCode,
    };

OperationWebSocketMessage _$OperationWebSocketMessageFromJson(
  Map<String, dynamic> json,
) => OperationWebSocketMessage(
  type: json['type'] as String,
  data: json['data'],
  error: json['error'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$OperationWebSocketMessageToJson(
  OperationWebSocketMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'data': instance.data,
  'error': instance.error,
  'message': instance.message,
};
