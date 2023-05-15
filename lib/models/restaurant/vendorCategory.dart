import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';

part 'vendorCategory.freezed.dart';
part 'vendorCategory.g.dart';

List<VendorCategory> fromJsonVendorCategoryList(dynamic json) =>
  fromSailsListOfObjectJson<VendorCategory>(VendorCategory.fromJson)(json);
VendorCategory? fromJsonVendorCategory(dynamic json) =>
  fromSailsObjectJson<VendorCategory>(VendorCategory.fromJson)(json);


@Freezed()
class VendorCategory with _$VendorCategory {
  @JsonSerializable()
  factory VendorCategory({
    required int id,
    required String name,
    String? imageUrl,
  }) = _VendorCategory;

  const VendorCategory._();

  factory VendorCategory.fromJson(Map<String, dynamic> json) =>
      _$VendorCategoryFromJson(json);
}
