import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/models/community/business_metadata.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@immutable
@Freezed()
class Business with _$Business {
  @JsonSerializable()
  factory Business({
    required BusinessMetadata metadata,
    @Default('') String account,
    @Default('') String id,
    @Default('') String name,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);
}
