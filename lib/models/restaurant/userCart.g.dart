// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCart _$$_UserCartFromJson(Map<String, dynamic> json) => _$_UserCart(
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e))
          .toList(),
      cartSubTotal: json['cartSubTotal'] as int,
      cartTax: json['cartTax'] as int,
      cartTotal: json['cartTotal'] as int,
      cartDiscount: json['cartDiscount'] as int,
    );

Map<String, dynamic> _$$_UserCartToJson(_$_UserCart instance) =>
    <String, dynamic>{
      'cartItems': instance.cartItems.map((e) => e.toJson()).toList(),
      'cartSubTotal': instance.cartSubTotal,
      'cartTax': instance.cartTax,
      'cartTotal': instance.cartTotal,
      'cartDiscount': instance.cartDiscount,
    };
