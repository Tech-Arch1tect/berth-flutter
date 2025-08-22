import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable()
class Server {
  final int? id;
  final String name;
  final String host;
  final int port;
  @JsonKey(name: 'use_https')
  final bool useHttps;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Server({
    this.id,
    required this.name,
    required this.host,
    this.port = 8080,
    this.useHttps = false,
    required this.accessToken,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  String get baseUrl {
    final protocol = useHttps ? 'https' : 'http';
    return '$protocol://$host:$port';
  }

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);

  Server copyWith({
    int? id,
    String? name,
    String? host,
    int? port,
    bool? useHttps,
    String? accessToken,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Server(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      port: port ?? this.port,
      useHttps: useHttps ?? this.useHttps,
      accessToken: accessToken ?? this.accessToken,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}