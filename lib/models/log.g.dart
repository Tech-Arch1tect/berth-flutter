// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEntry _$LogEntryFromJson(Map<String, dynamic> json) => LogEntry(
  timestamp: DateTime.parse(json['timestamp'] as String),
  message: json['message'] as String,
  source: json['source'] as String,
  level: json['level'] as String?,
);

Map<String, dynamic> _$LogEntryToJson(LogEntry instance) => <String, dynamic>{
  'timestamp': instance.timestamp.toIso8601String(),
  'message': instance.message,
  'source': instance.source,
  'level': instance.level,
};

LogsResponse _$LogsResponseFromJson(Map<String, dynamic> json) => LogsResponse(
  logs: (json['logs'] as List<dynamic>?)
      ?.map((e) => LogEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LogsResponseToJson(LogsResponse instance) =>
    <String, dynamic>{'logs': instance.logs};

Container _$ContainerFromJson(Map<String, dynamic> json) => Container(
  name: json['name'] as String,
  serviceName: json['service_name'] as String?,
  status: json['status'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$ContainerToJson(Container instance) => <String, dynamic>{
  'name': instance.name,
  'service_name': instance.serviceName,
  'status': instance.status,
  'image': instance.image,
};
