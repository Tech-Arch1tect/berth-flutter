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

@JsonSerializable()
class VolumeMount {
  final String type;
  final String source;
  final String target;
  @JsonKey(name: 'read_only')
  final bool? readOnly;
  @JsonKey(name: 'bind_options')
  final Map<String, String>? bindOptions;
  @JsonKey(name: 'tmpfs_options')
  final Map<String, String>? tmpfsOptions;

  VolumeMount({
    required this.type,
    required this.source,
    required this.target,
    this.readOnly,
    this.bindOptions,
    this.tmpfsOptions,
  });

  factory VolumeMount.fromJson(Map<String, dynamic> json) => _$VolumeMountFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeMountToJson(this);
}

@JsonSerializable()
class VolumeUsage {
  @JsonKey(name: 'container_name')
  final String containerName;
  @JsonKey(name: 'service_name')
  final String serviceName;
  final List<VolumeMount> mounts;

  VolumeUsage({
    required this.containerName,
    required this.serviceName,
    required this.mounts,
  });

  factory VolumeUsage.fromJson(Map<String, dynamic> json) => _$VolumeUsageFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeUsageToJson(this);
}

@JsonSerializable()
class Volume {
  final String name;
  final String? driver;
  final bool? external;
  final Map<String, String>? labels;
  @JsonKey(name: 'driver_opts')
  final Map<String, String>? driverOpts;
  final bool exists;
  final String? created;
  final String? mountpoint;
  final String? scope;
  @JsonKey(name: 'used_by')
  final List<VolumeUsage>? usedBy;

  Volume({
    required this.name,
    this.driver,
    this.external,
    this.labels,
    this.driverOpts,
    required this.exists,
    this.created,
    this.mountpoint,
    this.scope,
    this.usedBy,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

@JsonSerializable()
class EnvironmentVariable {
  final String key;
  final String value;
  @JsonKey(name: 'is_sensitive')
  final bool isSensitive;
  final String source;
  @JsonKey(name: 'is_from_container')
  final bool isFromContainer;

  EnvironmentVariable({
    required this.key,
    required this.value,
    required this.isSensitive,
    required this.source,
    required this.isFromContainer,
  });

  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) => _$EnvironmentVariableFromJson(json);
  Map<String, dynamic> toJson() => _$EnvironmentVariableToJson(this);
}

@JsonSerializable()
class ServiceEnvironment {
  @JsonKey(name: 'service_name')
  final String? serviceName;
  final List<EnvironmentVariable> variables;

  ServiceEnvironment({
    this.serviceName,
    required this.variables,
  });

  factory ServiceEnvironment.fromJson(Map<String, dynamic> json) => _$ServiceEnvironmentFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceEnvironmentToJson(this);
}

@JsonSerializable()
class ContainerStats {
  final String name;
  @JsonKey(name: 'service_name')
  final String serviceName;
  @JsonKey(name: 'cpu_percent')
  final double cpuPercent;
  @JsonKey(name: 'memory_usage')
  final int memoryUsage;
  @JsonKey(name: 'memory_limit')
  final int memoryLimit;
  @JsonKey(name: 'memory_percent')
  final double memoryPercent;

  ContainerStats({
    required this.name,
    required this.serviceName,
    required this.cpuPercent,
    required this.memoryUsage,
    required this.memoryLimit,
    required this.memoryPercent,
  });

  factory ContainerStats.fromJson(Map<String, dynamic> json) => _$ContainerStatsFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerStatsToJson(this);
}

@JsonSerializable()
class StackStats {
  @JsonKey(name: 'stack_name')
  final String stackName;
  final List<ContainerStats> containers;

  StackStats({
    required this.stackName,
    required this.containers,
  });

  factory StackStats.fromJson(Map<String, dynamic> json) => _$StackStatsFromJson(json);
  Map<String, dynamic> toJson() => _$StackStatsToJson(this);
}

