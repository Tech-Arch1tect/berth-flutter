import 'package:json_annotation/json_annotation.dart';

part 'websocket_message.g.dart';


@JsonSerializable()
class ContainerStatusEvent {
  final String type;
  @JsonKey(name: 'server_id')
  final int serverId;
  @JsonKey(name: 'stack_name')
  final String stackName;
  @JsonKey(name: 'service_name')
  final String serviceName;
  @JsonKey(name: 'container_name')
  final String containerName;
  @JsonKey(name: 'container_id')
  final String containerId;
  final String status;
  final String? health;
  final String image;
  final String timestamp;

  const ContainerStatusEvent({
    required this.type,
    required this.serverId,
    required this.stackName,
    required this.serviceName,
    required this.containerName,
    required this.containerId,
    required this.status,
    this.health,
    required this.image,
    required this.timestamp,
  });

  factory ContainerStatusEvent.fromJson(Map<String, dynamic> json) =>
      _$ContainerStatusEventFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerStatusEventToJson(this);
}

@JsonSerializable()
class StackStatusEvent {
  final String type;
  @JsonKey(name: 'server_id')
  final int serverId;
  @JsonKey(name: 'stack_name')
  final String stackName;
  final String status;
  final int services;
  final int running;
  final int stopped;
  final String timestamp;

  const StackStatusEvent({
    required this.type,
    required this.serverId,
    required this.stackName,
    required this.status,
    required this.services,
    required this.running,
    required this.stopped,
    required this.timestamp,
  });

  factory StackStatusEvent.fromJson(Map<String, dynamic> json) =>
      _$StackStatusEventFromJson(json);

  Map<String, dynamic> toJson() => _$StackStatusEventToJson(this);
}

@JsonSerializable()
class WebSocketError {
  final String type;
  final String error;
  final String? context;
  final String timestamp;

  const WebSocketError({
    required this.type,
    required this.error,
    this.context,
    required this.timestamp,
  });

  factory WebSocketError.fromJson(Map<String, dynamic> json) =>
      _$WebSocketErrorFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketErrorToJson(this);
}

enum WebSocketConnectionStatus {
  disconnected,
  connecting,
  connected,
  error,
}