// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userCart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCart _$UserCartFromJson(Map<String, dynamic> json) {
  return _UserCart.fromJson(json);
}

/// @nodoc
class _$UserCartTearOff {
  const _$UserCartTearOff();

  _UserCart call(
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscount}) {
    return _UserCart(
      cartItems: cartItems,
      cartSubTotal: cartSubTotal,
      cartTax: cartTax,
      cartTotal: cartTotal,
      cartDiscount: cartDiscount,
    );
  }

  UserCart fromJson(Map<String, Object> json) {
    return UserCart.fromJson(json);
  }
}

/// @nodoc
const $UserCart = _$UserCartTearOff();

/// @nodoc
mixin _$UserCart {
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  int get cartSubTotal => throw _privateConstructorUsedError;
  int get cartTax => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;
  int get cartDiscount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCartCopyWith<UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCartCopyWith<$Res> {
  factory $UserCartCopyWith(UserCart value, $Res Function(UserCart) then) =
      _$UserCartCopyWithImpl<$Res>;
  $Res call(
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscount});
}

/// @nodoc
class _$UserCartCopyWithImpl<$Res> implements $UserCartCopyWith<$Res> {
  _$UserCartCopyWithImpl(this._value, this._then);

  final UserCart _value;
  // ignore: unused_field
  final $Res Function(UserCart) _then;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      cartSubTotal: cartSubTotal == freezed
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartTax: cartTax == freezed
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscount: cartDiscount == freezed
          ? _value.cartDiscount
          : cartDiscount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCartCopyWith<$Res> implements $UserCartCopyWith<$Res> {
  factory _$UserCartCopyWith(_UserCart value, $Res Function(_UserCart) then) =
      __$UserCartCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscount});
}

/// @nodoc
class __$UserCartCopyWithImpl<$Res> extends _$UserCartCopyWithImpl<$Res>
    implements _$UserCartCopyWith<$Res> {
  __$UserCartCopyWithImpl(_UserCart _value, $Res Function(_UserCart) _then)
      : super(_value, (v) => _then(v as _UserCart));

  @override
  _UserCart get _value => super._value as _UserCart;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscount = freezed,
  }) {
    return _then(_UserCart(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      cartSubTotal: cartSubTotal == freezed
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartTax: cartTax == freezed
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscount: cartDiscount == freezed
          ? _value.cartDiscount
          : cartDiscount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCart extends _UserCart {
  _$_UserCart(
      {required this.cartItems,
      required this.cartSubTotal,
      required this.cartTax,
      required this.cartTotal,
      required this.cartDiscount})
      : super._();

  factory _$_UserCart.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartFromJson(json);

  @override
  final List<OrderItem> cartItems;
  @override
  final int cartSubTotal;
  @override
  final int cartTax;
  @override
  final int cartTotal;
  @override
  final int cartDiscount;

  @override
  String toString() {
    return 'UserCart(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscount: $cartDiscount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCart &&
            (identical(other.cartItems, cartItems) ||
                const DeepCollectionEquality()
                    .equals(other.cartItems, cartItems)) &&
            (identical(other.cartSubTotal, cartSubTotal) ||
                const DeepCollectionEquality()
                    .equals(other.cartSubTotal, cartSubTotal)) &&
            (identical(other.cartTax, cartTax) ||
                const DeepCollectionEquality()
                    .equals(other.cartTax, cartTax)) &&
            (identical(other.cartTotal, cartTotal) ||
                const DeepCollectionEquality()
                    .equals(other.cartTotal, cartTotal)) &&
            (identical(other.cartDiscount, cartDiscount) ||
                const DeepCollectionEquality()
                    .equals(other.cartDiscount, cartDiscount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cartItems) ^
      const DeepCollectionEquality().hash(cartSubTotal) ^
      const DeepCollectionEquality().hash(cartTax) ^
      const DeepCollectionEquality().hash(cartTotal) ^
      const DeepCollectionEquality().hash(cartDiscount);

  @JsonKey(ignore: true)
  @override
  _$UserCartCopyWith<_UserCart> get copyWith =>
      __$UserCartCopyWithImpl<_UserCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartToJson(this);
  }
}

abstract class _UserCart extends UserCart {
  factory _UserCart(
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscount}) = _$_UserCart;
  _UserCart._() : super._();

  factory _UserCart.fromJson(Map<String, dynamic> json) = _$_UserCart.fromJson;

  @override
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  @override
  int get cartSubTotal => throw _privateConstructorUsedError;
  @override
  int get cartTax => throw _privateConstructorUsedError;
  @override
  int get cartTotal => throw _privateConstructorUsedError;
  @override
  int get cartDiscount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCartCopyWith<_UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}
