// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stack _$StackFromJson(Map<String, dynamic> json) => Stack(
  name: json['name'] as String,
  path: json['path'] as String,
  composeFile: json['compose_file'] as String,
  serverId: (json['server_id'] as num).toInt(),
  serverName: json['server_name'] as String,
);

Map<String, dynamic> _$StackToJson(Stack instance) => <String, dynamic>{
  'name': instance.name,
  'path': instance.path,
  'compose_file': instance.composeFile,
  'server_id': instance.serverId,
  'server_name': instance.serverName,
};

StackDetails _$StackDetailsFromJson(Map<String, dynamic> json) => StackDetails(
  name: json['name'] as String,
  path: json['path'] as String,
  composeFile: json['compose_file'] as String,
  services: (json['services'] as List<dynamic>)
      .map((e) => ComposeService.fromJson(e as Map<String, dynamic>))
      .toList(),
  serverId: (json['server_id'] as num).toInt(),
  serverName: json['server_name'] as String,
);

Map<String, dynamic> _$StackDetailsToJson(StackDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'compose_file': instance.composeFile,
      'services': instance.services,
      'server_id': instance.serverId,
      'server_name': instance.serverName,
    };

ComposeService _$ComposeServiceFromJson(Map<String, dynamic> json) =>
    ComposeService(
      name: json['name'] as String,
      image: json['image'] as String?,
      containers: (json['containers'] as List<dynamic>)
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      dependsOn: (json['depends_on'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      command: (json['command'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      user: json['user'] as String?,
      workingDir: json['working_dir'] as String?,
      restart: json['restart'] as String?,
      scale: (json['scale'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ComposeServiceToJson(ComposeService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'containers': instance.containers,
      'depends_on': instance.dependsOn,
      'profiles': instance.profiles,
      'command': instance.command,
      'user': instance.user,
      'working_dir': instance.workingDir,
      'restart': instance.restart,
      'scale': instance.scale,
    };

Container _$ContainerFromJson(Map<String, dynamic> json) => Container(
  name: json['name'] as String,
  image: json['image'] as String,
  state: json['state'] as String,
  ports: (json['ports'] as List<dynamic>?)
      ?.map((e) => Port.fromJson(e as Map<String, dynamic>))
      .toList(),
  created: json['created'] as String?,
  started: json['started'] as String?,
  finished: json['finished'] as String?,
  exitCode: (json['exit_code'] as num?)?.toInt(),
  restartPolicy: json['restart_policy'] == null
      ? null
      : RestartPolicy.fromJson(json['restart_policy'] as Map<String, dynamic>),
  resourceLimits: json['resource_limits'] == null
      ? null
      : ResourceLimits.fromJson(
          json['resource_limits'] as Map<String, dynamic>,
        ),
  health: json['health'] == null
      ? null
      : HealthStatus.fromJson(json['health'] as Map<String, dynamic>),
  command: (json['command'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workingDir: json['working_dir'] as String?,
  user: json['user'] as String?,
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  networks: (json['networks'] as List<dynamic>?)
      ?.map((e) => ContainerNetwork.fromJson(e as Map<String, dynamic>))
      .toList(),
  mounts: (json['mounts'] as List<dynamic>?)
      ?.map((e) => ContainerMount.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ContainerToJson(Container instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'state': instance.state,
  'ports': instance.ports,
  'created': instance.created,
  'started': instance.started,
  'finished': instance.finished,
  'exit_code': instance.exitCode,
  'restart_policy': instance.restartPolicy,
  'resource_limits': instance.resourceLimits,
  'health': instance.health,
  'command': instance.command,
  'working_dir': instance.workingDir,
  'user': instance.user,
  'labels': instance.labels,
  'networks': instance.networks,
  'mounts': instance.mounts,
};

Port _$PortFromJson(Map<String, dynamic> json) => Port(
  privatePort: (json['private'] as num).toInt(),
  publicPort: (json['public'] as num?)?.toInt(),
  type: json['type'] as String,
);

Map<String, dynamic> _$PortToJson(Port instance) => <String, dynamic>{
  'private': instance.privatePort,
  'public': instance.publicPort,
  'type': instance.type,
};

NetworkIPAMConfig _$NetworkIPAMConfigFromJson(Map<String, dynamic> json) =>
    NetworkIPAMConfig(
      subnet: json['subnet'] as String?,
      gateway: json['gateway'] as String?,
    );

Map<String, dynamic> _$NetworkIPAMConfigToJson(NetworkIPAMConfig instance) =>
    <String, dynamic>{'subnet': instance.subnet, 'gateway': instance.gateway};

NetworkIPAM _$NetworkIPAMFromJson(Map<String, dynamic> json) => NetworkIPAM(
  driver: json['driver'] as String?,
  config: (json['config'] as List<dynamic>?)
      ?.map((e) => NetworkIPAMConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NetworkIPAMToJson(NetworkIPAM instance) =>
    <String, dynamic>{'driver': instance.driver, 'config': instance.config};

NetworkEndpoint _$NetworkEndpointFromJson(Map<String, dynamic> json) =>
    NetworkEndpoint(
      name: json['name'] as String,
      endpointId: json['endpoint_id'] as String?,
      macAddress: json['mac_address'] as String?,
      ipv4Address: json['ipv4_address'] as String?,
      ipv6Address: json['ipv6_address'] as String?,
    );

Map<String, dynamic> _$NetworkEndpointToJson(NetworkEndpoint instance) =>
    <String, dynamic>{
      'name': instance.name,
      'endpoint_id': instance.endpointId,
      'mac_address': instance.macAddress,
      'ipv4_address': instance.ipv4Address,
      'ipv6_address': instance.ipv6Address,
    };

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
  name: json['name'] as String,
  driver: json['driver'] as String?,
  external: json['external'] as bool?,
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  options: (json['options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  ipam: json['ipam'] == null
      ? null
      : NetworkIPAM.fromJson(json['ipam'] as Map<String, dynamic>),
  containers: (json['containers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, NetworkEndpoint.fromJson(e as Map<String, dynamic>)),
  ),
  exists: json['exists'] as bool,
  created: json['created'] as String?,
);

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
  'name': instance.name,
  'driver': instance.driver,
  'external': instance.external,
  'labels': instance.labels,
  'options': instance.options,
  'ipam': instance.ipam,
  'containers': instance.containers,
  'exists': instance.exists,
  'created': instance.created,
};

VolumeMount _$VolumeMountFromJson(Map<String, dynamic> json) => VolumeMount(
  type: json['type'] as String,
  source: json['source'] as String,
  target: json['target'] as String,
  readOnly: json['read_only'] as bool?,
  bindOptions: (json['bind_options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  tmpfsOptions: (json['tmpfs_options'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$VolumeMountToJson(VolumeMount instance) =>
    <String, dynamic>{
      'type': instance.type,
      'source': instance.source,
      'target': instance.target,
      'read_only': instance.readOnly,
      'bind_options': instance.bindOptions,
      'tmpfs_options': instance.tmpfsOptions,
    };

VolumeUsage _$VolumeUsageFromJson(Map<String, dynamic> json) => VolumeUsage(
  containerName: json['container_name'] as String,
  serviceName: json['service_name'] as String,
  mounts: (json['mounts'] as List<dynamic>)
      .map((e) => VolumeMount.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VolumeUsageToJson(VolumeUsage instance) =>
    <String, dynamic>{
      'container_name': instance.containerName,
      'service_name': instance.serviceName,
      'mounts': instance.mounts,
    };

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
  name: json['name'] as String,
  driver: json['driver'] as String?,
  external: json['external'] as bool?,
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  driverOpts: (json['driver_opts'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  exists: json['exists'] as bool,
  created: json['created'] as String?,
  mountpoint: json['mountpoint'] as String?,
  scope: json['scope'] as String?,
  usedBy: (json['used_by'] as List<dynamic>?)
      ?.map((e) => VolumeUsage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
  'name': instance.name,
  'driver': instance.driver,
  'external': instance.external,
  'labels': instance.labels,
  'driver_opts': instance.driverOpts,
  'exists': instance.exists,
  'created': instance.created,
  'mountpoint': instance.mountpoint,
  'scope': instance.scope,
  'used_by': instance.usedBy,
};

EnvironmentVariable _$EnvironmentVariableFromJson(Map<String, dynamic> json) =>
    EnvironmentVariable(
      key: json['key'] as String,
      value: json['value'] as String,
      isSensitive: json['is_sensitive'] as bool,
      source: json['source'] as String,
      isFromContainer: json['is_from_container'] as bool,
    );

Map<String, dynamic> _$EnvironmentVariableToJson(
  EnvironmentVariable instance,
) => <String, dynamic>{
  'key': instance.key,
  'value': instance.value,
  'is_sensitive': instance.isSensitive,
  'source': instance.source,
  'is_from_container': instance.isFromContainer,
};

ServiceEnvironment _$ServiceEnvironmentFromJson(Map<String, dynamic> json) =>
    ServiceEnvironment(
      serviceName: json['service_name'] as String?,
      variables: (json['variables'] as List<dynamic>)
          .map((e) => EnvironmentVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceEnvironmentToJson(ServiceEnvironment instance) =>
    <String, dynamic>{
      'service_name': instance.serviceName,
      'variables': instance.variables,
    };

ContainerStats _$ContainerStatsFromJson(Map<String, dynamic> json) =>
    ContainerStats(
      name: json['name'] as String,
      serviceName: json['service_name'] as String,
      cpuPercent: (json['cpu_percent'] as num).toDouble(),
      cpuUserTime: (json['cpu_user_time'] as num).toInt(),
      cpuSystemTime: (json['cpu_system_time'] as num).toInt(),
      memoryUsage: (json['memory_usage'] as num).toInt(),
      memoryLimit: (json['memory_limit'] as num).toInt(),
      memoryPercent: (json['memory_percent'] as num).toDouble(),
      memoryRss: (json['memory_rss'] as num).toInt(),
      memoryCache: (json['memory_cache'] as num).toInt(),
      memorySwap: (json['memory_swap'] as num).toInt(),
      pageFaults: (json['page_faults'] as num).toInt(),
      pageMajorFaults: (json['page_major_faults'] as num).toInt(),
      networkRxBytes: (json['network_rx_bytes'] as num).toInt(),
      networkTxBytes: (json['network_tx_bytes'] as num).toInt(),
      networkRxPackets: (json['network_rx_packets'] as num).toInt(),
      networkTxPackets: (json['network_tx_packets'] as num).toInt(),
      blockReadBytes: (json['block_read_bytes'] as num).toInt(),
      blockWriteBytes: (json['block_write_bytes'] as num).toInt(),
      blockReadOps: (json['block_read_ops'] as num).toInt(),
      blockWriteOps: (json['block_write_ops'] as num).toInt(),
    );

Map<String, dynamic> _$ContainerStatsToJson(ContainerStats instance) =>
    <String, dynamic>{
      'name': instance.name,
      'service_name': instance.serviceName,
      'cpu_percent': instance.cpuPercent,
      'cpu_user_time': instance.cpuUserTime,
      'cpu_system_time': instance.cpuSystemTime,
      'memory_usage': instance.memoryUsage,
      'memory_limit': instance.memoryLimit,
      'memory_percent': instance.memoryPercent,
      'memory_rss': instance.memoryRss,
      'memory_cache': instance.memoryCache,
      'memory_swap': instance.memorySwap,
      'page_faults': instance.pageFaults,
      'page_major_faults': instance.pageMajorFaults,
      'network_rx_bytes': instance.networkRxBytes,
      'network_tx_bytes': instance.networkTxBytes,
      'network_rx_packets': instance.networkRxPackets,
      'network_tx_packets': instance.networkTxPackets,
      'block_read_bytes': instance.blockReadBytes,
      'block_write_bytes': instance.blockWriteBytes,
      'block_read_ops': instance.blockReadOps,
      'block_write_ops': instance.blockWriteOps,
    };

StackStats _$StackStatsFromJson(Map<String, dynamic> json) => StackStats(
  stackName: json['stack_name'] as String,
  containers: (json['containers'] as List<dynamic>)
      .map((e) => ContainerStats.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StackStatsToJson(StackStats instance) =>
    <String, dynamic>{
      'stack_name': instance.stackName,
      'containers': instance.containers,
    };

RestartPolicy _$RestartPolicyFromJson(Map<String, dynamic> json) =>
    RestartPolicy(
      name: json['name'] as String,
      maximumRetryCount: (json['maximum_retry_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RestartPolicyToJson(RestartPolicy instance) =>
    <String, dynamic>{
      'name': instance.name,
      'maximum_retry_count': instance.maximumRetryCount,
    };

ResourceLimits _$ResourceLimitsFromJson(Map<String, dynamic> json) =>
    ResourceLimits(
      cpuShares: (json['cpu_shares'] as num?)?.toInt(),
      memory: (json['memory'] as num?)?.toInt(),
      memorySwap: (json['memory_swap'] as num?)?.toInt(),
      cpuQuota: (json['cpu_quota'] as num?)?.toInt(),
      cpuPeriod: (json['cpu_period'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResourceLimitsToJson(ResourceLimits instance) =>
    <String, dynamic>{
      'cpu_shares': instance.cpuShares,
      'memory': instance.memory,
      'memory_swap': instance.memorySwap,
      'cpu_quota': instance.cpuQuota,
      'cpu_period': instance.cpuPeriod,
    };

HealthLog _$HealthLogFromJson(Map<String, dynamic> json) => HealthLog(
  start: json['start'] as String,
  end: json['end'] as String?,
  exitCode: (json['exit_code'] as num).toInt(),
  output: json['output'] as String,
);

Map<String, dynamic> _$HealthLogToJson(HealthLog instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'exit_code': instance.exitCode,
  'output': instance.output,
};

HealthStatus _$HealthStatusFromJson(Map<String, dynamic> json) => HealthStatus(
  status: json['status'] as String,
  failingStreak: (json['failing_streak'] as num?)?.toInt(),
  log: (json['log'] as List<dynamic>?)
      ?.map((e) => HealthLog.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HealthStatusToJson(HealthStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'failing_streak': instance.failingStreak,
      'log': instance.log,
    };

ContainerNetwork _$ContainerNetworkFromJson(Map<String, dynamic> json) =>
    ContainerNetwork(
      name: json['name'] as String,
      networkId: json['network_id'] as String?,
      ipAddress: json['ip_address'] as String?,
      gateway: json['gateway'] as String?,
      macAddress: json['mac_address'] as String?,
      aliases: (json['aliases'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ContainerNetworkToJson(ContainerNetwork instance) =>
    <String, dynamic>{
      'name': instance.name,
      'network_id': instance.networkId,
      'ip_address': instance.ipAddress,
      'gateway': instance.gateway,
      'mac_address': instance.macAddress,
      'aliases': instance.aliases,
    };

ContainerMount _$ContainerMountFromJson(Map<String, dynamic> json) =>
    ContainerMount(
      type: json['type'] as String,
      source: json['source'] as String,
      destination: json['destination'] as String,
      driver: json['driver'] as String?,
      mode: json['mode'] as String?,
      rw: json['rw'] as bool,
      propagation: json['propagation'] as String?,
    );

Map<String, dynamic> _$ContainerMountToJson(ContainerMount instance) =>
    <String, dynamic>{
      'type': instance.type,
      'source': instance.source,
      'destination': instance.destination,
      'driver': instance.driver,
      'mode': instance.mode,
      'rw': instance.rw,
      'propagation': instance.propagation,
    };
