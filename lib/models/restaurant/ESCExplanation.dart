import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/ESCRating.dart';

part 'ESCExplanation.freezed.dart';
part 'ESCExplanation.g.dart';

@Freezed()
class ESCExplanation with _$ESCExplanation {
  @JsonSerializable()
  factory ESCExplanation({
    required int id,
    required String title,
    required String description,
    required num measure,
    required ESCRating escrating,
  }) = _ESCExplanation;

  const ESCExplanation._();

  factory ESCExplanation.fromJson(Map<String, dynamic> json) =>
      _$ESCExplanationFromJson(json);
}
