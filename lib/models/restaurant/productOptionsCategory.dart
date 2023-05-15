import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';

part 'productOptionsCategory.freezed.dart';
part 'productOptionsCategory.g.dart';

@Freezed()
class ProductOptionsCategory with _$ProductOptionsCategory { //TODO Remove to replace with ProductOption
  @JsonSerializable()
  factory ProductOptionsCategory({
    required int categoryID,
    required String name,
    required List<ProductOptionValue> listOfOptions,
  }) = _ProductOptionsCategory;

  const ProductOptionsCategory._();

  factory ProductOptionsCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsCategoryFromJson(json);
}
