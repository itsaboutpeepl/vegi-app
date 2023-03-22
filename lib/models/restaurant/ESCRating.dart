import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/cart/product.dart';
import 'package:vegan_liverpool/models/restaurant/ESCExplanation.dart';

part 'ESCRating.freezed.dart';
part 'ESCRating.g.dart';

@Freezed()
class ESCRating with _$ESCRating {
  @JsonSerializable()
  factory ESCRating({
    required int id,
    required double createdAt,
    required String productPublicId,
    required num rating,
    @Default({}) Object evidence,
    required DateTime calculatedOn,
    required Product product,
    @Default([]) List<ESCExplanation> explanations,
  }) = _ESCRating;

  const ESCRating._();

  factory ESCRating.fromJson(Map<String, dynamic> json) =>
      _$ESCRatingFromJson(json);
}
