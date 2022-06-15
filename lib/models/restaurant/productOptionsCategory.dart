import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';

part 'productOptionsCategory.freezed.dart';
part 'productOptionsCategory.g.dart';

@Freezed()
class ProductOptionsCategory with _$ProductOptionsCategory {
  const ProductOptionsCategory._();

  @JsonSerializable()
  factory ProductOptionsCategory(
      {required int categoryID,
      required String name,
      required List<ProductOptions> listOfOptions}) = _ProductOptionsCategory;

  factory ProductOptionsCategory.fromJson(dynamic json) => _$ProductOptionsCategoryFromJson(json);
}
