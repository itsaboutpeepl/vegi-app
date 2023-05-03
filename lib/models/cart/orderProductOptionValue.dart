import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
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

  String get priceModifierFormatted => cFPrice(priceModifier);

  factory OrderProductOptionValue.fromJson(Map<String, dynamic> json) =>
      _$OrderProductOptionValueFromJson(json);
}
