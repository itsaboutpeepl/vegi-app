// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCartState _$$_UserCartStateFromJson(Map<String, dynamic> json) =>
    _$_UserCartState(
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      cartSubTotal: json['cartSubTotal'] as int,
      cartTax: json['cartTax'] as int,
      cartTotal: json['cartTotal'] as int,
      cartDiscountPercent: json['cartDiscountPercent'] as int,
      cartDiscountComputed: json['cartDiscountComputed'] as int,
    );

Map<String, dynamic> _$$_UserCartStateToJson(_$_UserCartState instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartSubTotal': instance.cartSubTotal,
      'cartTax': instance.cartTax,
      'cartTotal': instance.cartTotal,
      'cartDiscountPercent': instance.cartDiscountPercent,
      'cartDiscountComputed': instance.cartDiscountComputed,
    };
