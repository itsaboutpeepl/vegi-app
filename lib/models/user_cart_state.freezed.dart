// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCartState _$UserCartStateFromJson(Map<String, dynamic> json) {
  return _UserCartState.fromJson(json);
}

/// @nodoc
class _$UserCartStateTearOff {
  const _$UserCartStateTearOff();

  _UserCartState call(
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscountPercent,
      required int cartDiscountComputed}) {
    return _UserCartState(
      cartItems: cartItems,
      cartSubTotal: cartSubTotal,
      cartTax: cartTax,
      cartTotal: cartTotal,
      cartDiscountPercent: cartDiscountPercent,
      cartDiscountComputed: cartDiscountComputed,
    );
  }

  UserCartState fromJson(Map<String, Object> json) {
    return UserCartState.fromJson(json);
  }
}

/// @nodoc
const $UserCartState = _$UserCartStateTearOff();

/// @nodoc
mixin _$UserCartState {
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  int get cartSubTotal => throw _privateConstructorUsedError;
  int get cartTax => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  int get cartDiscountComputed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCartStateCopyWith<UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCartStateCopyWith<$Res> {
  factory $UserCartStateCopyWith(
          UserCartState value, $Res Function(UserCartState) then) =
      _$UserCartStateCopyWithImpl<$Res>;
  $Res call(
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed});
}

/// @nodoc
class _$UserCartStateCopyWithImpl<$Res>
    implements $UserCartStateCopyWith<$Res> {
  _$UserCartStateCopyWithImpl(this._value, this._then);

  final UserCartState _value;
  // ignore: unused_field
  final $Res Function(UserCartState) _then;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscountPercent = freezed,
    Object? cartDiscountComputed = freezed,
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
      cartDiscountPercent: cartDiscountPercent == freezed
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscountComputed: cartDiscountComputed == freezed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCartStateCopyWith<$Res>
    implements $UserCartStateCopyWith<$Res> {
  factory _$UserCartStateCopyWith(
          _UserCartState value, $Res Function(_UserCartState) then) =
      __$UserCartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed});
}

/// @nodoc
class __$UserCartStateCopyWithImpl<$Res>
    extends _$UserCartStateCopyWithImpl<$Res>
    implements _$UserCartStateCopyWith<$Res> {
  __$UserCartStateCopyWithImpl(
      _UserCartState _value, $Res Function(_UserCartState) _then)
      : super(_value, (v) => _then(v as _UserCartState));

  @override
  _UserCartState get _value => super._value as _UserCartState;

  @override
  $Res call({
    Object? cartItems = freezed,
    Object? cartSubTotal = freezed,
    Object? cartTax = freezed,
    Object? cartTotal = freezed,
    Object? cartDiscountPercent = freezed,
    Object? cartDiscountComputed = freezed,
  }) {
    return _then(_UserCartState(
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
      cartDiscountPercent: cartDiscountPercent == freezed
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscountComputed: cartDiscountComputed == freezed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState {
  _$_UserCartState(
      {required this.cartItems,
      required this.cartSubTotal,
      required this.cartTax,
      required this.cartTotal,
      required this.cartDiscountPercent,
      required this.cartDiscountComputed})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  final List<OrderItem> cartItems;
  @override
  final int cartSubTotal;
  @override
  final int cartTax;
  @override
  final int cartTotal;
  @override
  final int cartDiscountPercent;
  @override
  final int cartDiscountComputed;

  @override
  String toString() {
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCartState &&
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
            (identical(other.cartDiscountPercent, cartDiscountPercent) ||
                const DeepCollectionEquality()
                    .equals(other.cartDiscountPercent, cartDiscountPercent)) &&
            (identical(other.cartDiscountComputed, cartDiscountComputed) ||
                const DeepCollectionEquality()
                    .equals(other.cartDiscountComputed, cartDiscountComputed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cartItems) ^
      const DeepCollectionEquality().hash(cartSubTotal) ^
      const DeepCollectionEquality().hash(cartTax) ^
      const DeepCollectionEquality().hash(cartTotal) ^
      const DeepCollectionEquality().hash(cartDiscountPercent) ^
      const DeepCollectionEquality().hash(cartDiscountComputed);

  @JsonKey(ignore: true)
  @override
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      __$UserCartStateCopyWithImpl<_UserCartState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartStateToJson(this);
  }
}

abstract class _UserCartState extends UserCartState {
  factory _UserCartState(
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscountPercent,
      required int cartDiscountComputed}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  @override
  int get cartSubTotal => throw _privateConstructorUsedError;
  @override
  int get cartTax => throw _privateConstructorUsedError;
  @override
  int get cartTotal => throw _privateConstructorUsedError;
  @override
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  @override
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
