import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';

part 'orderProductOptionValue.freezed.dart';
part 'orderProductOptionValue.g.dart';

@Freezed()
class OrderProductOptionValue with _$OrderProductOptionValue {
  @JsonSerializable()
  factory OrderProductOptionValue({
    required String name,
    required String chosenOption,
    required int priceModifier,
  }) = _OrderProductOptionValue;

  const OrderProductOptionValue._();

  factory OrderProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$OrderProductOptionValueFromJson(json);
}
