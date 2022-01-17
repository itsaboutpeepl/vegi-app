import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';

part 'userCart.freezed.dart';
part 'userCart.g.dart';

@freezed
class UserCart with _$UserCart {
  const UserCart._();

  @JsonSerializable()
  factory UserCart({
    required List<OrderItem> cartItems,
    required int cartSubTotal,
    required int cartTax,
    required int cartTotal,
    required int cartDiscount,
  }) = _UserCart;

  factory UserCart.initial() => UserCart(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartDiscount: 0,
      );

  factory UserCart.fromJson(dynamic json) => _$UserCartFromJson(json);
}
