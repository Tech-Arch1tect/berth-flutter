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

@JsonSerializable()
class NetworkIPAMConfig {
  final String? subnet;
  final String? gateway;

  NetworkIPAMConfig({
    this.subnet,
    this.gateway,
  });

  factory NetworkIPAMConfig.fromJson(Map<String, dynamic> json) => _$NetworkIPAMConfigFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkIPAMConfigToJson(this);
}

@JsonSerializable()
class NetworkIPAM {
  final String? driver;
  final List<NetworkIPAMConfig>? config;

  NetworkIPAM({
    this.driver,
    this.config,
  });

  factory NetworkIPAM.fromJson(Map<String, dynamic> json) => _$NetworkIPAMFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkIPAMToJson(this);
}

@JsonSerializable()
class NetworkEndpoint {
  final String name;
  @JsonKey(name: 'endpoint_id')
  final String? endpointId;
  @JsonKey(name: 'mac_address')
  final String? macAddress;
  @JsonKey(name: 'ipv4_address')
  final String? ipv4Address;
  @JsonKey(name: 'ipv6_address')
  final String? ipv6Address;

  NetworkEndpoint({
    required this.name,
    this.endpointId,
    this.macAddress,
    this.ipv4Address,
    this.ipv6Address,
  });

  factory NetworkEndpoint.fromJson(Map<String, dynamic> json) => _$NetworkEndpointFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkEndpointToJson(this);
}

@JsonSerializable()
class Network {
  final String name;
  final String? driver;
  final bool? external;
  final Map<String, String>? labels;
  final Map<String, String>? options;
  final NetworkIPAM? ipam;
  final Map<String, NetworkEndpoint>? containers;
  final bool exists;
  final String? created;

  Network({
    required this.name,
    this.driver,
    this.external,
    this.labels,
    this.options,
    this.ipam,
    this.containers,
    required this.exists,
    this.created,
  });

  factory Network.fromJson(Map<String, dynamic> json) => _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

