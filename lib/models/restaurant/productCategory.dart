import 'package:freezed_annotation/freezed_annotation.dart';

part 'productCategory.freezed.dart';
part 'productCategory.g.dart';

@Freezed()
class ProductCategory with _$ProductCategory {
  @JsonSerializable()
  factory ProductCategory({
    required String name,
  }) = _ProductCategory;

  const ProductCategory._();

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
