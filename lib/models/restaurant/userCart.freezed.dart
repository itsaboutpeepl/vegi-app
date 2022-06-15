// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userCart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCart _$UserCartFromJson(Map<String, dynamic> json) {
  return _UserCart.fromJson(json);
}

/// @nodoc
mixin _$UserCart {
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
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
      {List<CartItem> cartItems,
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
              as List<CartItem>,
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
abstract class _$$_UserCartCopyWith<$Res> implements $UserCartCopyWith<$Res> {
  factory _$$_UserCartCopyWith(
          _$_UserCart value, $Res Function(_$_UserCart) then) =
      __$$_UserCartCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CartItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscount});
}

/// @nodoc
class __$$_UserCartCopyWithImpl<$Res> extends _$UserCartCopyWithImpl<$Res>
    implements _$$_UserCartCopyWith<$Res> {
  __$$_UserCartCopyWithImpl(
      _$_UserCart _value, $Res Function(_$_UserCart) _then)
      : super(_value, (v) => _then(v as _$_UserCart));

  @override
  _$_UserCart get _value => super._value as _$_UserCart;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscount = freezed,
  }) {
    return _then(_$_UserCart(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
  final List<CartItem> cartItems;
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
        (other.runtimeType == runtimeType &&
            other is _$_UserCart &&
            const DeepCollectionEquality().equals(other.cartItems, cartItems) &&
            const DeepCollectionEquality()
                .equals(other.cartSubTotal, cartSubTotal) &&
            const DeepCollectionEquality().equals(other.cartTax, cartTax) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality()
                .equals(other.cartDiscount, cartDiscount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartItems),
      const DeepCollectionEquality().hash(cartSubTotal),
      const DeepCollectionEquality().hash(cartTax),
      const DeepCollectionEquality().hash(cartTotal),
      const DeepCollectionEquality().hash(cartDiscount));

  @JsonKey(ignore: true)
  @override
  _$$_UserCartCopyWith<_$_UserCart> get copyWith =>
      __$$_UserCartCopyWithImpl<_$_UserCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartToJson(this);
  }
}

abstract class _UserCart extends UserCart {
  factory _UserCart(
      {required final List<CartItem> cartItems,
      required final int cartSubTotal,
      required final int cartTax,
      required final int cartTotal,
      required final int cartDiscount}) = _$_UserCart;
  _UserCart._() : super._();

  factory _UserCart.fromJson(Map<String, dynamic> json) = _$_UserCart.fromJson;

  @override
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
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
  _$$_UserCartCopyWith<_$_UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}
