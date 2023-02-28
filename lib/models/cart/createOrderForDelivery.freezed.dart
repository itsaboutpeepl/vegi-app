// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'createOrderForDelivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateOrderForDelivery _$CreateOrderForDeliveryFromJson(
    Map<String, dynamic> json) {
  return _CreateOrderForDelivery.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderForDelivery {
  List<CartItem> get items => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get tipAmount => throw _privateConstructorUsedError;
  bool get marketingOptIn => throw _privateConstructorUsedError;
  String get discountCode => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  DeliveryAddresses get address => throw _privateConstructorUsedError;
  int get fulfilmentMethod => throw _privateConstructorUsedError;
  String get fulfilmentSlotFrom => throw _privateConstructorUsedError;
  String get fulfilmentSlotTo => throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderForDeliveryCopyWith<CreateOrderForDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderForDeliveryCopyWith<$Res> {
  factory $CreateOrderForDeliveryCopyWith(CreateOrderForDelivery value,
          $Res Function(CreateOrderForDelivery) then) =
      _$CreateOrderForDeliveryCopyWithImpl<$Res, CreateOrderForDelivery>;
  @useResult
  $Res call(
      {List<CartItem> items,
      int total,
      int tipAmount,
      bool marketingOptIn,
      String discountCode,
      String vendor,
      String walletAddress,
      DeliveryAddresses address,
      int fulfilmentMethod,
      String fulfilmentSlotFrom,
      String fulfilmentSlotTo,
      bool isDelivery});

  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class _$CreateOrderForDeliveryCopyWithImpl<$Res,
        $Val extends CreateOrderForDelivery>
    implements $CreateOrderForDeliveryCopyWith<$Res> {
  _$CreateOrderForDeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? tipAmount = null,
    Object? marketingOptIn = null,
    Object? discountCode = null,
    Object? vendor = null,
    Object? walletAddress = null,
    Object? address = null,
    Object? fulfilmentMethod = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? isDelivery = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      marketingOptIn: null == marketingOptIn
          ? _value.marketingOptIn
          : marketingOptIn // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as String,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as String,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res> get address {
    return $DeliveryAddressesCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateOrderForDeliveryCopyWith<$Res>
    implements $CreateOrderForDeliveryCopyWith<$Res> {
  factory _$$_CreateOrderForDeliveryCopyWith(_$_CreateOrderForDelivery value,
          $Res Function(_$_CreateOrderForDelivery) then) =
      __$$_CreateOrderForDeliveryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> items,
      int total,
      int tipAmount,
      bool marketingOptIn,
      String discountCode,
      String vendor,
      String walletAddress,
      DeliveryAddresses address,
      int fulfilmentMethod,
      String fulfilmentSlotFrom,
      String fulfilmentSlotTo,
      bool isDelivery});

  @override
  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class __$$_CreateOrderForDeliveryCopyWithImpl<$Res>
    extends _$CreateOrderForDeliveryCopyWithImpl<$Res,
        _$_CreateOrderForDelivery>
    implements _$$_CreateOrderForDeliveryCopyWith<$Res> {
  __$$_CreateOrderForDeliveryCopyWithImpl(_$_CreateOrderForDelivery _value,
      $Res Function(_$_CreateOrderForDelivery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? tipAmount = null,
    Object? marketingOptIn = null,
    Object? discountCode = null,
    Object? vendor = null,
    Object? walletAddress = null,
    Object? address = null,
    Object? fulfilmentMethod = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? isDelivery = null,
  }) {
    return _then(_$_CreateOrderForDelivery(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      marketingOptIn: null == marketingOptIn
          ? _value.marketingOptIn
          : marketingOptIn // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as String,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as String,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CreateOrderForDelivery extends _CreateOrderForDelivery {
  _$_CreateOrderForDelivery(
      {required this.items,
      required this.total,
      required this.tipAmount,
      required this.marketingOptIn,
      required this.discountCode,
      required this.vendor,
      required this.walletAddress,
      required this.address,
      required this.fulfilmentMethod,
      required this.fulfilmentSlotFrom,
      required this.fulfilmentSlotTo,
      required this.isDelivery})
      : super._();

  factory _$_CreateOrderForDelivery.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderForDeliveryFromJson(json);

  @override
  final List<CartItem> items;
  @override
  final int total;
  @override
  final int tipAmount;
  @override
  final bool marketingOptIn;
  @override
  final String discountCode;
  @override
  final String vendor;
  @override
  final String walletAddress;
  @override
  final DeliveryAddresses address;
  @override
  final int fulfilmentMethod;
  @override
  final String fulfilmentSlotFrom;
  @override
  final String fulfilmentSlotTo;
  @override
  final bool isDelivery;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateOrderForDelivery &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.marketingOptIn, marketingOptIn) ||
                other.marketingOptIn == marketingOptIn) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fulfilmentMethod, fulfilmentMethod) ||
                other.fulfilmentMethod == fulfilmentMethod) &&
            (identical(other.fulfilmentSlotFrom, fulfilmentSlotFrom) ||
                other.fulfilmentSlotFrom == fulfilmentSlotFrom) &&
            (identical(other.fulfilmentSlotTo, fulfilmentSlotTo) ||
                other.fulfilmentSlotTo == fulfilmentSlotTo) &&
            (identical(other.isDelivery, isDelivery) ||
                other.isDelivery == isDelivery));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      total,
      tipAmount,
      marketingOptIn,
      discountCode,
      vendor,
      walletAddress,
      address,
      fulfilmentMethod,
      fulfilmentSlotFrom,
      fulfilmentSlotTo,
      isDelivery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateOrderForDeliveryCopyWith<_$_CreateOrderForDelivery> get copyWith =>
      __$$_CreateOrderForDeliveryCopyWithImpl<_$_CreateOrderForDelivery>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateOrderForDeliveryToJson(
      this,
    );
  }
}

abstract class _CreateOrderForDelivery extends CreateOrderForDelivery {
  factory _CreateOrderForDelivery(
      {required final List<CartItem> items,
      required final int total,
      required final int tipAmount,
      required final bool marketingOptIn,
      required final String discountCode,
      required final String vendor,
      required final String walletAddress,
      required final DeliveryAddresses address,
      required final int fulfilmentMethod,
      required final String fulfilmentSlotFrom,
      required final String fulfilmentSlotTo,
      required final bool isDelivery}) = _$_CreateOrderForDelivery;
  _CreateOrderForDelivery._() : super._();

  factory _CreateOrderForDelivery.fromJson(Map<String, dynamic> json) =
      _$_CreateOrderForDelivery.fromJson;

  @override
  List<CartItem> get items;
  @override
  int get total;
  @override
  int get tipAmount;
  @override
  bool get marketingOptIn;
  @override
  String get discountCode;
  @override
  String get vendor;
  @override
  String get walletAddress;
  @override
  DeliveryAddresses get address;
  @override
  int get fulfilmentMethod;
  @override
  String get fulfilmentSlotFrom;
  @override
  String get fulfilmentSlotTo;
  @override
  bool get isDelivery;
  @override
  @JsonKey(ignore: true)
  _$$_CreateOrderForDeliveryCopyWith<_$_CreateOrderForDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}
