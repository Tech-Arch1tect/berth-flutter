import 'package:json_annotation/json_annotation.dart';

part 'stack.g.dart';

@JsonSerializable()
class Stack {
  final String name;
  final String path;
  @JsonKey(name: 'compose_file')
  final String composeFile;
  @JsonKey(name: 'server_id')
  final int serverId;
  @JsonKey(name: 'server_name')
  final String serverName;

  Stack({
    required this.name,
    required this.path,
    required this.composeFile,
    required this.serverId,
    required this.serverName,
  });

  factory Stack.fromJson(Map<String, dynamic> json) => _$StackFromJson(json);
  Map<String, dynamic> toJson() => _$StackToJson(this);
}

@JsonSerializable()
class StackDetails {
  final String name;
  final String path;
  @JsonKey(name: 'compose_file')
  final String composeFile;
  final List<ComposeService> services;
  @JsonKey(name: 'server_id')
  final int serverId;
  @JsonKey(name: 'server_name')
  final String serverName;

  StackDetails({
    required this.name,
    required this.path,
    required this.composeFile,
    required this.services,
    required this.serverId,
    required this.serverName,
  });

  factory StackDetails.fromJson(Map<String, dynamic> json) => _$StackDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$StackDetailsToJson(this);
}

@JsonSerializable()
class ComposeService {
  final String name;
  final String? image;
  final List<Container> containers;

  ComposeService({
    required this.name,
    this.image,
    required this.containers,
  });

  factory ComposeService.fromJson(Map<String, dynamic> json) => _$ComposeServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ComposeServiceToJson(this);
}

@JsonSerializable()
class Container {
  final String name;
  final String image;
  final String state;
  final List<Port>? ports;

  Container({
    required this.name,
    required this.image,
    required this.state,
    this.ports,
  });

  factory Container.fromJson(Map<String, dynamic> json) => _$ContainerFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}

@JsonSerializable()
class Port {
  @JsonKey(name: 'private')
  final int privatePort;
  @JsonKey(name: 'public')
  final int? publicPort;
  final String type;

  Port({
    required this.privatePort,
    this.publicPort,
    required this.type,
  });

  factory Port.fromJson(Map<String, dynamic> json) => _$PortFromJson(json);
  Map<String, dynamic> toJson() => _$PortToJson(this);
}

