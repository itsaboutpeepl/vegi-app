import 'package:freezed_annotation/freezed_annotation.dart';

part 'productOptions.freezed.dart';
part 'productOptions.g.dart';

@freezed
class ProductOptions with _$ProductOptions {
  const ProductOptions._();

  @JsonSerializable()
  factory ProductOptions({
    required int optionID,
    required String name,
    required String description,
    required int price,
    required bool isAvaliable,
  }) = _ProductOptions;

  factory ProductOptions.fromJson(dynamic json) =>
      _$ProductOptionsFromJson(json);
}
