import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
  final int id;
  final String name;
  final String resource;
  final String action;
  final String description;

  Permission({
    required this.id,
    required this.name,
    required this.resource,
    required this.action,
    required this.description,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}