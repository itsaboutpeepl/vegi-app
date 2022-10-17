import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/productOptions.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';

part 'cartItem.freezed.dart';
part 'cartItem.g.dart';

@Freezed()
class CartItem with _$CartItem {
  @JsonSerializable()
  factory CartItem({
    required int internalID,
    required RestaurantMenuItem menuItem,
    required int totalItemPrice,
    required int itemQuantity,
    required Map<int, ProductOptions> selectedProductOptions,
  }) = _CartItem;

  const CartItem._();

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  String get formattedPrice {
    if (menuItem.price != 0) {
      return cFPrice(menuItem.price);
    } else {
      return cFPrice(totalItemPrice);
    }
  }
}
