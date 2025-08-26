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
    );

Map<String, dynamic> _$ComposeServiceToJson(ComposeService instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'containers': instance.containers,
    };

Container _$ContainerFromJson(Map<String, dynamic> json) => Container(
  name: json['name'] as String,
  image: json['image'] as String,
  state: json['state'] as String,
  ports: (json['ports'] as List<dynamic>?)
      ?.map((e) => Port.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ContainerToJson(Container instance) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'state': instance.state,
  'ports': instance.ports,
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
