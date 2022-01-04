// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCart _$$_UserCartFromJson(Map<String, dynamic> json) => _$_UserCart(
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e))
          .toList(),
      cartItemQuantities:
          Map<String, int>.from(json['cartItemQuantities'] as Map),
      cartSubTotal: (json['cartSubTotal'] as num).toDouble(),
      cartTax: (json['cartTax'] as num).toDouble(),
      cartTotal: (json['cartTotal'] as num).toDouble(),
      cartDiscount: (json['cartDiscount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_UserCartToJson(_$_UserCart instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartItemQuantities': instance.cartItemQuantities,
      'cartSubTotal': instance.cartSubTotal,
      'cartTax': instance.cartTax,
      'cartTotal': instance.cartTotal,
      'cartDiscount': instance.cartDiscount,
    };
