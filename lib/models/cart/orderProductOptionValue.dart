import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';

part 'orderProductOptionValue.freezed.dart';
part 'orderProductOptionValue.g.dart';

List<OrderProductOptionValue> fromJsonOrderProductOptionValueList(dynamic json) =>
  fromSailsListOfObjectJson<OrderProductOptionValue>(OrderProductOptionValue.fromJson)(json);
OrderProductOptionValue? fromJsonOrderProductOptionValue(dynamic json) =>
  fromSailsObjectJson<OrderProductOptionValue>(OrderProductOptionValue.fromJson)(json);


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
