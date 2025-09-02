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
  @JsonKey(name: 'is_healthy')
  final bool isHealthy;

  Stack({
    required this.name,
    required this.path,
    required this.composeFile,
    required this.serverId,
    required this.serverName,
    required this.isHealthy,
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
  @JsonKey(name: 'depends_on')
  final List<String>? dependsOn;
  final List<String>? profiles;
  final List<String>? command;
  final String? user;
  @JsonKey(name: 'working_dir')
  final String? workingDir;
  final String? restart;
  final int? scale;

  ComposeService({
    required this.name,
    this.image,
    required this.containers,
    this.dependsOn,
    this.profiles,
    this.command,
    this.user,
    this.workingDir,
    this.restart,
    this.scale,
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
  final String? created;
  final String? started;
  final String? finished;
  @JsonKey(name: 'exit_code')
  final int? exitCode;
  @JsonKey(name: 'restart_policy')
  final RestartPolicy? restartPolicy;
  @JsonKey(name: 'resource_limits')
  final ResourceLimits? resourceLimits;
  final HealthStatus? health;
  final List<String>? command;
  @JsonKey(name: 'working_dir')
  final String? workingDir;
  final String? user;
  final Map<String, String>? labels;
  final List<ContainerNetwork>? networks;
  final List<ContainerMount>? mounts;

  Container({
    required this.name,
    required this.image,
    required this.state,
    this.ports,
    this.created,
    this.started,
    this.finished,
    this.exitCode,
    this.restartPolicy,
    this.resourceLimits,
    this.health,
    this.command,
    this.workingDir,
    this.user,
    this.labels,
    this.networks,
    this.mounts,
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
  @JsonKey(name: 'cpu_user_time')
  final int cpuUserTime;
  @JsonKey(name: 'cpu_system_time')
  final int cpuSystemTime;
  @JsonKey(name: 'memory_usage')
  final int memoryUsage;
  @JsonKey(name: 'memory_limit')
  final int memoryLimit;
  @JsonKey(name: 'memory_percent')
  final double memoryPercent;
  @JsonKey(name: 'memory_rss')
  final int memoryRss;
  @JsonKey(name: 'memory_cache')
  final int memoryCache;
  @JsonKey(name: 'memory_swap')
  final int memorySwap;
  @JsonKey(name: 'page_faults')
  final int pageFaults;
  @JsonKey(name: 'page_major_faults')
  final int pageMajorFaults;
  @JsonKey(name: 'network_rx_bytes')
  final int networkRxBytes;
  @JsonKey(name: 'network_tx_bytes')
  final int networkTxBytes;
  @JsonKey(name: 'network_rx_packets')
  final int networkRxPackets;
  @JsonKey(name: 'network_tx_packets')
  final int networkTxPackets;
  @JsonKey(name: 'block_read_bytes')
  final int blockReadBytes;
  @JsonKey(name: 'block_write_bytes')
  final int blockWriteBytes;
  @JsonKey(name: 'block_read_ops')
  final int blockReadOps;
  @JsonKey(name: 'block_write_ops')
  final int blockWriteOps;

  ContainerStats({
    required this.name,
    required this.serviceName,
    required this.cpuPercent,
    required this.cpuUserTime,
    required this.cpuSystemTime,
    required this.memoryUsage,
    required this.memoryLimit,
    required this.memoryPercent,
    required this.memoryRss,
    required this.memoryCache,
    required this.memorySwap,
    required this.pageFaults,
    required this.pageMajorFaults,
    required this.networkRxBytes,
    required this.networkTxBytes,
    required this.networkRxPackets,
    required this.networkTxPackets,
    required this.blockReadBytes,
    required this.blockWriteBytes,
    required this.blockReadOps,
    required this.blockWriteOps,
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

@JsonSerializable()
class RestartPolicy {
  final String name;
  @JsonKey(name: 'maximum_retry_count')
  final int? maximumRetryCount;

  RestartPolicy({
    required this.name,
    this.maximumRetryCount,
  });

  factory RestartPolicy.fromJson(Map<String, dynamic> json) => _$RestartPolicyFromJson(json);
  Map<String, dynamic> toJson() => _$RestartPolicyToJson(this);
}

@JsonSerializable()
class ResourceLimits {
  @JsonKey(name: 'cpu_shares')
  final int? cpuShares;
  final int? memory;
  @JsonKey(name: 'memory_swap')
  final int? memorySwap;
  @JsonKey(name: 'cpu_quota')
  final int? cpuQuota;
  @JsonKey(name: 'cpu_period')
  final int? cpuPeriod;

  ResourceLimits({
    this.cpuShares,
    this.memory,
    this.memorySwap,
    this.cpuQuota,
    this.cpuPeriod,
  });

  factory ResourceLimits.fromJson(Map<String, dynamic> json) => _$ResourceLimitsFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceLimitsToJson(this);
}

@JsonSerializable()
class HealthLog {
  final String start;
  final String? end;
  @JsonKey(name: 'exit_code')
  final int exitCode;
  final String output;

  HealthLog({
    required this.start,
    this.end,
    required this.exitCode,
    required this.output,
  });

  factory HealthLog.fromJson(Map<String, dynamic> json) => _$HealthLogFromJson(json);
  Map<String, dynamic> toJson() => _$HealthLogToJson(this);
}

@JsonSerializable()
class HealthStatus {
  final String status;
  @JsonKey(name: 'failing_streak')
  final int? failingStreak;
  final List<HealthLog>? log;

  HealthStatus({
    required this.status,
    this.failingStreak,
    this.log,
  });

  factory HealthStatus.fromJson(Map<String, dynamic> json) => _$HealthStatusFromJson(json);
  Map<String, dynamic> toJson() => _$HealthStatusToJson(this);
}

@JsonSerializable()
class ContainerNetwork {
  final String name;
  @JsonKey(name: 'network_id')
  final String? networkId;
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  final String? gateway;
  @JsonKey(name: 'mac_address')
  final String? macAddress;
  final List<String>? aliases;

  ContainerNetwork({
    required this.name,
    this.networkId,
    this.ipAddress,
    this.gateway,
    this.macAddress,
    this.aliases,
  });

  factory ContainerNetwork.fromJson(Map<String, dynamic> json) => _$ContainerNetworkFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerNetworkToJson(this);
}

@JsonSerializable()
class ContainerMount {
  final String type;
  final String source;
  final String destination;
  final String? driver;
  final String? mode;
  final bool rw;
  final String? propagation;

  ContainerMount({
    required this.type,
    required this.source,
    required this.destination,
    this.driver,
    this.mode,
    required this.rw,
    this.propagation,
  });

  factory ContainerMount.fromJson(Map<String, dynamic> json) => _$ContainerMountFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerMountToJson(this);
}

