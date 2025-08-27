import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable()
class LogEntry {
  final DateTime timestamp;
  final String message;
  final String source;
  final String? level;

  const LogEntry({
    required this.timestamp,
    required this.message,
    required this.source,
    this.level,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) => _$LogEntryFromJson(json);
  Map<String, dynamic> toJson() => _$LogEntryToJson(this);
}

@JsonSerializable()
class LogsResponse {
  final List<LogEntry>? logs;

  const LogsResponse({
    this.logs,
  });

  factory LogsResponse.fromJson(Map<String, dynamic> json) => _$LogsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LogsResponseToJson(this);
}

@JsonSerializable()
class Container {
  final String name;
  @JsonKey(name: 'service_name')
  final String? serviceName;
  final String? status;
  final String? image;

  const Container({
    required this.name,
    this.serviceName,
    this.status,
    this.image,
  });

  factory Container.fromJson(Map<String, dynamic> json) => _$ContainerFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}