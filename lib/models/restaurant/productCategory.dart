import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'productCategory.freezed.dart';
part 'productCategory.g.dart';

List<ProductCategory> fromJsonProductCategoryList(dynamic json) =>
  fromSailsListOfObjectJson<ProductCategory>(ProductCategory.fromJson)(json);
ProductCategory? fromJsonProductCategory(dynamic json) =>
  fromSailsObjectJson<ProductCategory>(ProductCategory.fromJson)(json);


@Freezed()
class ProductCategory with _$ProductCategory {
  @JsonSerializable()
  factory ProductCategory({
    required String name,
    int? id,
  }) = _ProductCategory;

  const ProductCategory._();

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(() => _$ProductCategoryFromJson(json));
}
