import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/menuItem.dart';

part 'userCart.freezed.dart';
part 'userCart.g.dart';

@freezed
class UserCart with _$UserCart {
  const UserCart._();

  @JsonSerializable()
  factory UserCart({
    required List<MenuItem> cartItems,
    required Map<String, int> cartItemQuantities,
    required double cartSubTotal,
    required double cartTax,
    required double cartTotal,
    required double cartDiscount,
  }) = _UserCart;

  factory UserCart.fromJson(dynamic json) => _$UserCartFromJson(json);
}
