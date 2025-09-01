import 'package:json_annotation/json_annotation.dart';

part 'stack_statistics.g.dart';

@JsonSerializable()
class StackStatistics {
  @JsonKey(name: 'total_stacks')
  final int totalStacks;
  @JsonKey(name: 'healthy_stacks')
  final int healthyStacks;
  @JsonKey(name: 'unhealthy_stacks')
  final int unhealthyStacks;

  StackStatistics({
    required this.totalStacks,
    required this.healthyStacks,
    required this.unhealthyStacks,
  });

  factory StackStatistics.fromJson(Map<String, dynamic> json) =>
      _$StackStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StackStatisticsToJson(this);

  StackStatistics copyWith({
    int? totalStacks,
    int? healthyStacks,
    int? unhealthyStacks,
  }) {
    return StackStatistics(
      totalStacks: totalStacks ?? this.totalStacks,
      healthyStacks: healthyStacks ?? this.healthyStacks,
      unhealthyStacks: unhealthyStacks ?? this.unhealthyStacks,
    );
  }
}