// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemState _$$_MenuItemStateFromJson(Map<String, dynamic> json) =>
    _$_MenuItemState(
      menuItem: MenuItem.fromJson(json['menuItem']),
      totalPrice: json['totalPrice'] as int,
      itemReward: json['itemReward'] as int,
      selectedProductOptionsForCategory:
          (json['selectedProductOptionsForCategory'] as Map<String, dynamic>)
              .map(
        (k, e) => MapEntry(int.parse(k), ProductOptions.fromJson(e)),
      ),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$_MenuItemStateToJson(_$_MenuItemState instance) =>
    <String, dynamic>{
      'menuItem': instance.menuItem.toJson(),
      'totalPrice': instance.totalPrice,
      'itemReward': instance.itemReward,
      'selectedProductOptionsForCategory': instance
          .selectedProductOptionsForCategory
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'quantity': instance.quantity,
    };
