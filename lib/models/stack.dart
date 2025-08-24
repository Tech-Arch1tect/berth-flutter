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

