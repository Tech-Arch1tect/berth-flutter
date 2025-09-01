// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackStatistics _$StackStatisticsFromJson(Map<String, dynamic> json) =>
    StackStatistics(
      totalStacks: (json['total_stacks'] as num).toInt(),
      healthyStacks: (json['healthy_stacks'] as num).toInt(),
      unhealthyStacks: (json['unhealthy_stacks'] as num).toInt(),
    );

Map<String, dynamic> _$StackStatisticsToJson(StackStatistics instance) =>
    <String, dynamic>{
      'total_stacks': instance.totalStacks,
      'healthy_stacks': instance.healthyStacks,
      'unhealthy_stacks': instance.unhealthyStacks,
    };
