// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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
      {required List<MenuItem> cartItems,
      required Map<String, int> cartItemQuantities,
      required double cartSubTotal,
      required double cartTax,
      required double cartTotal,
      required double cartDiscount}) {
    return _UserCart(
      cartItems: cartItems,
      cartItemQuantities: cartItemQuantities,
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
  List<MenuItem> get cartItems => throw _privateConstructorUsedError;
  Map<String, int> get cartItemQuantities => throw _privateConstructorUsedError;
  double get cartSubTotal => throw _privateConstructorUsedError;
  double get cartTax => throw _privateConstructorUsedError;
  double get cartTotal => throw _privateConstructorUsedError;
  double get cartDiscount => throw _privateConstructorUsedError;

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
      {List<MenuItem> cartItems,
      Map<String, int> cartItemQuantities,
      double cartSubTotal,
      double cartTax,
      double cartTotal,
      double cartDiscount});
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
    Object? cartItemQuantities = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
      cartItemQuantities: cartItemQuantities == freezed
          ? _value.cartItemQuantities
          : cartItemQuantities // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      cartSubTotal: cartSubTotal == freezed
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartTax: cartTax == freezed
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as double,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartDiscount: cartDiscount == freezed
          ? _value.cartDiscount
          : cartDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$UserCartCopyWith<$Res> implements $UserCartCopyWith<$Res> {
  factory _$UserCartCopyWith(_UserCart value, $Res Function(_UserCart) then) =
      __$UserCartCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MenuItem> cartItems,
      Map<String, int> cartItemQuantities,
      double cartSubTotal,
      double cartTax,
      double cartTotal,
      double cartDiscount});
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
    Object? cartItemQuantities = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscount = freezed,
  }) {
    return _then(_UserCart(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
      cartItemQuantities: cartItemQuantities == freezed
          ? _value.cartItemQuantities
          : cartItemQuantities // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      cartSubTotal: cartSubTotal == freezed
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartTax: cartTax == freezed
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as double,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cartDiscount: cartDiscount == freezed
          ? _value.cartDiscount
          : cartDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCart extends _UserCart {
  _$_UserCart(
      {required this.cartItems,
      required this.cartItemQuantities,
      required this.cartSubTotal,
      required this.cartTax,
      required this.cartTotal,
      required this.cartDiscount})
      : super._();

  factory _$_UserCart.fromJson(Map<String, dynamic> json) =>
      _$_$_UserCartFromJson(json);

  @override
  final List<MenuItem> cartItems;
  @override
  final Map<String, int> cartItemQuantities;
  @override
  final double cartSubTotal;
  @override
  final double cartTax;
  @override
  final double cartTotal;
  @override
  final double cartDiscount;

  @override
  String toString() {
    return 'UserCart(cartItems: $cartItems, cartItemQuantities: $cartItemQuantities, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscount: $cartDiscount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCart &&
            (identical(other.cartItems, cartItems) ||
                const DeepCollectionEquality()
                    .equals(other.cartItems, cartItems)) &&
            (identical(other.cartItemQuantities, cartItemQuantities) ||
                const DeepCollectionEquality()
                    .equals(other.cartItemQuantities, cartItemQuantities)) &&
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
      const DeepCollectionEquality().hash(cartItemQuantities) ^
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
    return _$_$_UserCartToJson(this);
  }
}

abstract class _UserCart extends UserCart {
  factory _UserCart(
      {required List<MenuItem> cartItems,
      required Map<String, int> cartItemQuantities,
      required double cartSubTotal,
      required double cartTax,
      required double cartTotal,
      required double cartDiscount}) = _$_UserCart;
  _UserCart._() : super._();

  factory _UserCart.fromJson(Map<String, dynamic> json) = _$_UserCart.fromJson;

  @override
  List<MenuItem> get cartItems => throw _privateConstructorUsedError;
  @override
  Map<String, int> get cartItemQuantities => throw _privateConstructorUsedError;
  @override
  double get cartSubTotal => throw _privateConstructorUsedError;
  @override
  double get cartTax => throw _privateConstructorUsedError;
  @override
  double get cartTotal => throw _privateConstructorUsedError;
  @override
  double get cartDiscount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCartCopyWith<_UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}
