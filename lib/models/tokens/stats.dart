import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@immutable
@Freezed()
class Stats with _$Stats {
  @JsonSerializable()
  factory Stats({
    String? volume,
    String? price,
    int? timestamp,
    DateTime? date,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
