import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/cart/product.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/cart/orderProductOptionValue.dart';

part 'orderItem.freezed.dart';
part 'orderItem.g.dart';

List<OrderItem> fromJsonOrderItemList(dynamic json) =>
    fromSailsListOfObjectJson<OrderItem>(OrderItem.fromJson)(json);
OrderItem? fromJsonOrderItem(dynamic json) =>
    fromSailsObjectJson<OrderItem>(OrderItem.fromJson)(json);

@Freezed()
class OrderItem with _$OrderItem {
  // static Product productFromJson(Map<String, dynamic> itemJson) {
  //   return Product(
  //     name: itemJson['name'] as String,
  //     basePrice: itemJson['basePrice'] as int,
  //     options: (itemJson['optionValues'] as List<Map<String, dynamic>>)
  //         .map(OrderProductOptionValue.fromJson)
  //         .toList(),
  //   );
  // }

  @JsonSerializable()
  factory OrderItem({
    required int id,
    bool? unfulfilled,
    // @JsonKey(fromJson: fromJsonProduct)
    // @Default(null) Product? product,
    required Product product,
  }) = _OrderItem;

  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      tryCatchRethrowInline(
        () => _$OrderItemFromJson(json),
      );

  String get formattedPrice {
    return product?.totalPriceFormatted ?? '£0.00';
  }

  List<String> get selectedProductOptionsString {
    int _counter = 0;
    final List<String> optionValues = [];
    for (final element in (product?.options ?? [])) {
      _counter++;
      optionValues.add(
        '$_counter. ${element.chosenOption}'.capitalizeWords(),
      );
    }
    return optionValues;
  }
}
