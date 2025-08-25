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
