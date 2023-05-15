import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';

part 'productOption.freezed.dart';
part 'productOption.g.dart';

List<ProductOption> fromJsonProductOptionList(dynamic json) =>
  fromSailsListOfObjectJson<ProductOption>(ProductOption.fromJson)(json);
ProductOption? fromJsonProductOption(dynamic json) =>
  fromSailsObjectJson<ProductOption>(ProductOption.fromJson)(json);


@Freezed()
class ProductOption with _$ProductOption {
  @JsonSerializable()
  factory ProductOption({
    required int id,
    required String name,
    required bool isRequired,
    @JsonKey(fromJson: fromJsonProductOptionValueList)
    required List<ProductOptionValue> values,
  }) = _ProductOption;

  const ProductOption._();

  factory ProductOption.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionFromJson(json);
}
