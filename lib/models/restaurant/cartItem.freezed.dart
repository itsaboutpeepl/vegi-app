// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cartItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  int get internalID => throw _privateConstructorUsedError;
  RestaurantMenuItem get menuItem => throw _privateConstructorUsedError;
  int get totalItemPrice => throw _privateConstructorUsedError;
  int get itemQuantity => throw _privateConstructorUsedError;
  Map<int, ProductOptions> get selectedProductOptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res>;
  $Res call(
      {int internalID,
      RestaurantMenuItem menuItem,
      int totalItemPrice,
      int itemQuantity,
      Map<int, ProductOptions> selectedProductOptions});

  $RestaurantMenuItemCopyWith<$Res> get menuItem;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res> implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  final CartItem _value;
  // ignore: unused_field
  final $Res Function(CartItem) _then;

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
abstract class _$$_CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$$_CartItemCopyWith(
          _$_CartItem value, $Res Function(_$_CartItem) then) =
      __$$_CartItemCopyWithImpl<$Res>;
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
class __$$_CartItemCopyWithImpl<$Res> extends _$CartItemCopyWithImpl<$Res>
    implements _$$_CartItemCopyWith<$Res> {
  __$$_CartItemCopyWithImpl(
      _$_CartItem _value, $Res Function(_$_CartItem) _then)
      : super(_value, (v) => _then(v as _$_CartItem));

  @override
  _$_CartItem get _value => super._value as _$_CartItem;

  @override
  $Res call({
    Object? internalID = freezed,
    Object? menuItem = freezed,
    Object? totalItemPrice = freezed,
    Object? itemQuantity = freezed,
    Object? selectedProductOptions = freezed,
  }) {
    return _then(_$_CartItem(
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
class _$_CartItem extends _CartItem {
  _$_CartItem(
      {required this.internalID,
      required this.menuItem,
      required this.totalItemPrice,
      required this.itemQuantity,
      required this.selectedProductOptions})
      : super._();

  factory _$_CartItem.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemFromJson(json);

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
    return 'CartItem(internalID: $internalID, menuItem: $menuItem, totalItemPrice: $totalItemPrice, itemQuantity: $itemQuantity, selectedProductOptions: $selectedProductOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItem &&
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

  @JsonKey(ignore: true)
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
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      __$$_CartItemCopyWithImpl<_$_CartItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemToJson(this);
  }
}

abstract class _CartItem extends CartItem {
  factory _CartItem(
          {required final int internalID,
          required final RestaurantMenuItem menuItem,
          required final int totalItemPrice,
          required final int itemQuantity,
          required final Map<int, ProductOptions> selectedProductOptions}) =
      _$_CartItem;
  _CartItem._() : super._();

  factory _CartItem.fromJson(Map<String, dynamic> json) = _$_CartItem.fromJson;

  @override
  int get internalID => throw _privateConstructorUsedError;
  @override
  RestaurantMenuItem get menuItem => throw _privateConstructorUsedError;
  @override
  int get totalItemPrice => throw _privateConstructorUsedError;
  @override
  int get itemQuantity => throw _privateConstructorUsedError;
  @override
  Map<int, ProductOptions> get selectedProductOptions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}
