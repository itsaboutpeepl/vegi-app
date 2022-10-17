import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';

part 'userCart.freezed.dart';
part 'userCart.g.dart';

@Freezed()
class UserCart with _$UserCart {
  @JsonSerializable()
  factory UserCart({
    required List<CartItem> cartItems,
    required int cartSubTotal,
    required int cartTax,
    required int cartTotal,
    required int cartDiscount,
  }) = _UserCart;

  const UserCart._();

  factory UserCart.initial() => UserCart(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartDiscount: 0,
      );

  factory UserCart.fromJson(Map<String, dynamic> json) =>
      _$UserCartFromJson(json);
}
