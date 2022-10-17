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
      _$UserCartCopyWithImpl<$Res, UserCart>;
  @useResult
  $Res call(
      {List<CartItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscount});
}

/// @nodoc
class _$UserCartCopyWithImpl<$Res, $Val extends UserCart>
    implements $UserCartCopyWith<$Res> {
  _$UserCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? cartSubTotal = null,
    Object? cartTax = null,
    Object? cartTotal = null,
    Object? cartDiscount = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartSubTotal: null == cartSubTotal
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartTax: null == cartTax
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscount: null == cartDiscount
          ? _value.cartDiscount
          : cartDiscount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCartCopyWith<$Res> implements $UserCartCopyWith<$Res> {
  factory _$$_UserCartCopyWith(
          _$_UserCart value, $Res Function(_$_UserCart) then) =
      __$$_UserCartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscount});
}

/// @nodoc
class __$$_UserCartCopyWithImpl<$Res>
    extends _$UserCartCopyWithImpl<$Res, _$_UserCart>
    implements _$$_UserCartCopyWith<$Res> {
  __$$_UserCartCopyWithImpl(
      _$_UserCart _value, $Res Function(_$_UserCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? cartSubTotal = null,
    Object? cartTax = null,
    Object? cartTotal = null,
    Object? cartDiscount = null,
  }) {
    return _then(_$_UserCart(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartSubTotal: null == cartSubTotal
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartTax: null == cartTax
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as int,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscount: null == cartDiscount
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
            (identical(other.cartSubTotal, cartSubTotal) ||
                other.cartSubTotal == cartSubTotal) &&
            (identical(other.cartTax, cartTax) || other.cartTax == cartTax) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.cartDiscount, cartDiscount) ||
                other.cartDiscount == cartDiscount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartItems),
      cartSubTotal,
      cartTax,
      cartTotal,
      cartDiscount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCartCopyWith<_$_UserCart> get copyWith =>
      __$$_UserCartCopyWithImpl<_$_UserCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartToJson(
      this,
    );
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
  List<CartItem> get cartItems;
  @override
  int get cartSubTotal;
  @override
  int get cartTax;
  @override
  int get cartTotal;
  @override
  int get cartDiscount;
  @override
  @JsonKey(ignore: true)
  _$$_UserCartCopyWith<_$_UserCart> get copyWith =>
      throw _privateConstructorUsedError;
}
