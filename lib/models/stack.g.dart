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
