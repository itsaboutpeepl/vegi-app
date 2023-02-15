import 'package:freezed_annotation/freezed_annotation.dart';

part 'productOptions.freezed.dart';
part 'productOptions.g.dart';

@Freezed()
class ProductOptions with _$ProductOptions {
  @JsonSerializable()
  factory ProductOptions({
    @JsonKey(defaultValue: 0, name: 'id') required int optionID,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: 0, name: 'priceModifier') required int price,
    @JsonKey(defaultValue: false) required bool isAvaliable,
    @JsonKey(defaultValue: '') required String productBarCode,
  }) = _ProductOptions;

  const ProductOptions._();

  factory ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsFromJson(json);
}
