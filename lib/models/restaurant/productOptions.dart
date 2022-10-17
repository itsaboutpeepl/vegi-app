import 'package:freezed_annotation/freezed_annotation.dart';

part 'productOptions.freezed.dart';
part 'productOptions.g.dart';

@Freezed()
class ProductOptions with _$ProductOptions {
  @JsonSerializable()
  factory ProductOptions({
    required int optionID,
    required String name,
    required String description,
    required int price,
    required bool isAvaliable,
  }) = _ProductOptions;

  const ProductOptions._();

  factory ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsFromJson(json);
}
