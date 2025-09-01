import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable()
class Server {
  final int id;
  final String name;
  final String description;
  final String host;
  final int port;
  @JsonKey(name: 'skip_ssl_verification')
  final bool skipSslVerification;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Server({
    required this.id,
    required this.name,
    this.description = '',
    required this.host,
    this.port = 8080,
    this.skipSslVerification = true,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  String get baseUrl {
    return 'https://$host:$port';
  }

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);

  Server copyWith({
    int? id,
    String? name,
    String? description,
    String? host,
    int? port,
    bool? skipSslVerification,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Server(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      host: host ?? this.host,
      port: port ?? this.port,
      skipSslVerification: skipSslVerification ?? this.skipSslVerification,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ServerInput {
  final int? id;
  final String name;
  final String host;
  final int port;
  final bool skipSslVerification;
  final String accessToken;
  final bool isActive;

  ServerInput({
    this.id,
    required this.name,
    required this.host,
    this.port = 8080,
    this.skipSslVerification = true,
    required this.accessToken,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'name': name,
    'host': host,
    'port': port,
    'skip_ssl_verification': skipSslVerification,
    'access_token': accessToken,
    'is_active': isActive,
  };
}