// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orderItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
class _$OrderItemTearOff {
  const _$OrderItemTearOff();

  _OrderItem call(
      {required int internalID,
      required RestaurantMenuItem menuItem,
      required int totalItemPrice,
      required int itemQuantity,
      required Map<int, ProductOptions> selectedProductOptions}) {
    return _OrderItem(
      internalID: internalID,
      menuItem: menuItem,
      totalItemPrice: totalItemPrice,
      itemQuantity: itemQuantity,
      selectedProductOptions: selectedProductOptions,
    );
  }

  OrderItem fromJson(Map<String, Object?> json) {
    return OrderItem.fromJson(json);
  }
}

/// @nodoc
const $OrderItem = _$OrderItemTearOff();

/// @nodoc
mixin _$OrderItem {
  int get internalID => throw _privateConstructorUsedError;
  RestaurantMenuItem get menuItem => throw _privateConstructorUsedError;
  int get totalItemPrice => throw _privateConstructorUsedError;
  int get itemQuantity => throw _privateConstructorUsedError;
  Map<int, ProductOptions> get selectedProductOptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res>;
  $Res call(
      {int internalID,
      RestaurantMenuItem menuItem,
      int totalItemPrice,
      int itemQuantity,
      Map<int, ProductOptions> selectedProductOptions});

  $RestaurantMenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  final OrderItem _value;
  // ignore: unused_field
  final $Res Function(OrderItem) _then;

  @override
  $Res call({
    Object? internalID = freezed,
    Object? menuItem = freezed,
    Object? totalItemPrice = freezed,
    Object? itemQuantity = freezed,
    Object? selectedProductOptions = freezed,
  }) {
    return _then(_value.copyWith(
      internalID: internalID == freezed
          ? _value.internalID
          : internalID // ignore: cast_nullable_to_non_nullable
              as int,
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as RestaurantMenuItem,
      totalItemPrice: totalItemPrice == freezed
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: itemQuantity == freezed
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      selectedProductOptions: selectedProductOptions == freezed
          ? _value.selectedProductOptions
          : selectedProductOptions // ignore: cast_nullable_to_non_nullable
              as Map<int, ProductOptions>,
    ));
  }

  @override
  $RestaurantMenuItemCopyWith<$Res> get menuItem {
    return $RestaurantMenuItemCopyWith<$Res>(_value.menuItem, (value) {
      return _then(_value.copyWith(menuItem: value));
    });
  }
}

/// @nodoc
abstract class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(
          _OrderItem value, $Res Function(_OrderItem) then) =
      __$OrderItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int internalID,
      RestaurantMenuItem menuItem,
      int totalItemPrice,
      int itemQuantity,
      Map<int, ProductOptions> selectedProductOptions});

  @override
  $RestaurantMenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class __$OrderItemCopyWithImpl<$Res> extends _$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(_OrderItem _value, $Res Function(_OrderItem) _then)
      : super(_value, (v) => _then(v as _OrderItem));

  @override
  _OrderItem get _value => super._value as _OrderItem;

  @override
  $Res call({
    Object? internalID = freezed,
    Object? menuItem = freezed,
    Object? totalItemPrice = freezed,
    Object? itemQuantity = freezed,
    Object? selectedProductOptions = freezed,
  }) {
    return _then(_OrderItem(
      internalID: internalID == freezed
          ? _value.internalID
          : internalID // ignore: cast_nullable_to_non_nullable
              as int,
      menuItem: menuItem == freezed
          ? _value.menuItem
          : menuItem // ignore: cast_nullable_to_non_nullable
              as RestaurantMenuItem,
      totalItemPrice: totalItemPrice == freezed
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      itemQuantity: itemQuantity == freezed
          ? _value.itemQuantity
          : itemQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      selectedProductOptions: selectedProductOptions == freezed
          ? _value.selectedProductOptions
          : selectedProductOptions // ignore: cast_nullable_to_non_nullable
              as Map<int, ProductOptions>,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OrderItem extends _OrderItem {
  _$_OrderItem(
      {required this.internalID,
      required this.menuItem,
      required this.totalItemPrice,
      required this.itemQuantity,
      required this.selectedProductOptions})
      : super._();

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemFromJson(json);

  @override
  final int internalID;
  @override
  final RestaurantMenuItem menuItem;
  @override
  final int totalItemPrice;
  @override
  final int itemQuantity;
  @override
  final Map<int, ProductOptions> selectedProductOptions;

  @override
  String toString() {
    return 'OrderItem(internalID: $internalID, menuItem: $menuItem, totalItemPrice: $totalItemPrice, itemQuantity: $itemQuantity, selectedProductOptions: $selectedProductOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItem &&
            const DeepCollectionEquality()
                .equals(other.internalID, internalID) &&
            const DeepCollectionEquality().equals(other.menuItem, menuItem) &&
            const DeepCollectionEquality()
                .equals(other.totalItemPrice, totalItemPrice) &&
            const DeepCollectionEquality()
                .equals(other.itemQuantity, itemQuantity) &&
            const DeepCollectionEquality()
                .equals(other.selectedProductOptions, selectedProductOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(internalID),
      const DeepCollectionEquality().hash(menuItem),
      const DeepCollectionEquality().hash(totalItemPrice),
      const DeepCollectionEquality().hash(itemQuantity),
      const DeepCollectionEquality().hash(selectedProductOptions));

  @JsonKey(ignore: true)
  @override
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemToJson(this);
  }
}

abstract class _OrderItem extends OrderItem {
  factory _OrderItem(
      {required int internalID,
      required RestaurantMenuItem menuItem,
      required int totalItemPrice,
      required int itemQuantity,
      required Map<int, ProductOptions> selectedProductOptions}) = _$_OrderItem;
  _OrderItem._() : super._();

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

  @override
  int get internalID;
  @override
  RestaurantMenuItem get menuItem;
  @override
  int get totalItemPrice;
  @override
  int get itemQuantity;
  @override
  Map<int, ProductOptions> get selectedProductOptions;
  @override
  @JsonKey(ignore: true)
  _$OrderItemCopyWith<_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}
