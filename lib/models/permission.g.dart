// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  resource: json['resource'] as String,
  action: json['action'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'resource': instance.resource,
      'action': instance.action,
      'description': instance.description,
    };
