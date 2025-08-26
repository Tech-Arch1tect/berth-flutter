// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeMessage _$SubscribeMessageFromJson(Map<String, dynamic> json) =>
    SubscribeMessage(
      type: json['type'] as String? ?? 'subscribe',
      resource: json['resource'] as String,
      serverId: (json['server_id'] as num).toInt(),
      stackName: json['stack_name'] as String?,
    );

Map<String, dynamic> _$SubscribeMessageToJson(SubscribeMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'resource': instance.resource,
      'server_id': instance.serverId,
      'stack_name': instance.stackName,
    };

UnsubscribeMessage _$UnsubscribeMessageFromJson(Map<String, dynamic> json) =>
    UnsubscribeMessage(
      type: json['type'] as String? ?? 'unsubscribe',
      resource: json['resource'] as String,
      serverId: (json['server_id'] as num).toInt(),
      stackName: json['stack_name'] as String?,
    );

Map<String, dynamic> _$UnsubscribeMessageToJson(UnsubscribeMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'resource': instance.resource,
      'server_id': instance.serverId,
      'stack_name': instance.stackName,
    };

ContainerStatusEvent _$ContainerStatusEventFromJson(
  Map<String, dynamic> json,
) => ContainerStatusEvent(
  type: json['type'] as String,
  serverId: (json['server_id'] as num).toInt(),
  stackName: json['stack_name'] as String,
  serviceName: json['service_name'] as String,
  containerName: json['container_name'] as String,
  containerId: json['container_id'] as String,
  status: json['status'] as String,
  health: json['health'] as String?,
  image: json['image'] as String,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$ContainerStatusEventToJson(
  ContainerStatusEvent instance,
) => <String, dynamic>{
  'type': instance.type,
  'server_id': instance.serverId,
  'stack_name': instance.stackName,
  'service_name': instance.serviceName,
  'container_name': instance.containerName,
  'container_id': instance.containerId,
  'status': instance.status,
  'health': instance.health,
  'image': instance.image,
  'timestamp': instance.timestamp,
};

StackStatusEvent _$StackStatusEventFromJson(Map<String, dynamic> json) =>
    StackStatusEvent(
      type: json['type'] as String,
      serverId: (json['server_id'] as num).toInt(),
      stackName: json['stack_name'] as String,
      status: json['status'] as String,
      services: (json['services'] as num).toInt(),
      running: (json['running'] as num).toInt(),
      stopped: (json['stopped'] as num).toInt(),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$StackStatusEventToJson(StackStatusEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'server_id': instance.serverId,
      'stack_name': instance.stackName,
      'status': instance.status,
      'services': instance.services,
      'running': instance.running,
      'stopped': instance.stopped,
      'timestamp': instance.timestamp,
    };

WebSocketError _$WebSocketErrorFromJson(Map<String, dynamic> json) =>
    WebSocketError(
      type: json['type'] as String,
      error: json['error'] as String,
      context: json['context'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$WebSocketErrorToJson(WebSocketError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'error': instance.error,
      'context': instance.context,
      'timestamp': instance.timestamp,
    };
