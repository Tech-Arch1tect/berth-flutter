// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'] as String?,
  totpEnabled: json['totp_enabled'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'totp_enabled': instance.totpEnabled,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
