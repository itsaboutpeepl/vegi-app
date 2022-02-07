import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';

part 'user_cart_state.freezed.dart';
part 'user_cart_state.g.dart';

@freezed
class UserCartState with _$UserCartState {
  const UserCartState._();

  @JsonSerializable()
  factory UserCartState({
    required List<OrderItem> cartItems,
    required int cartSubTotal,
    required int cartTax,
    required int cartTotal,
    required int cartDiscountPercent,
    required int cartDiscountComputed,
  }) = _UserCartState;

  factory UserCartState.initial() => UserCartState(
        cartItems: [],
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0,
        cartDiscountPercent: 0,
        cartDiscountComputed: 0,
      );

  factory UserCartState.fromJson(dynamic json) => _$UserCartStateFromJson(json);
}

class UserCartStateConverter
    implements JsonConverter<UserCartState, Map<String, dynamic>?> {
  const UserCartStateConverter();

  @override
  UserCartState fromJson(Map<String, dynamic>? json) =>
      json != null ? UserCartState.fromJson(json) : UserCartState.initial();

  @override
  Map<String, dynamic> toJson(UserCartState instance) => instance.toJson();
}