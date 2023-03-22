import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/cart/product.dart';
import 'package:vegan_liverpool/models/restaurant/ESCExplanation.dart';

part 'productRating.freezed.dart';
part 'productRating.g.dart';

@Freezed()
class ProductRating with _$ProductRating {
  @JsonSerializable()
  factory ProductRating({
    required int id,
    required double createdAt,
    required String productPublicId,
    required num rating,
    @Default({}) Object evidence,
    required DateTime calculatedOn,
    required Product product,
    @Default([]) List<ESCExplanation> explanations,
  }) = _ProductRating;

  const ProductRating._();

  factory ProductRating.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingFromJson(json);
}
