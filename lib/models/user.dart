import 'package:json_annotation/json_annotation.dart';
import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'last_login_at')
  final String? lastLoginAt;
  @JsonKey(name: 'totp_enabled')
  final bool totpEnabled;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<Role>? roles;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    this.lastLoginAt,
    required this.totpEnabled,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });
  
  bool hasRole(String roleName) {
    return roles?.any((role) => role.name == roleName) ?? false;
  }
  
  bool get isAdmin => hasRole('admin');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}