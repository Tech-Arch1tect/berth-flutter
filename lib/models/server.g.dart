// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Server _$ServerFromJson(Map<String, dynamic> json) => Server(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  host: json['host'] as String,
  port: (json['port'] as num?)?.toInt() ?? 8080,
  useHttps: json['use_https'] as bool? ?? false,
  isActive: json['is_active'] as bool? ?? true,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'host': instance.host,
  'port': instance.port,
  'use_https': instance.useHttps,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
