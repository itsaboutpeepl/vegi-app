// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'createOrderForCollection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateOrderForCollection _$CreateOrderForCollectionFromJson(
    Map<String, dynamic> json) {
  return _CreateOrderForCollection.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderForCollection {
  List<CartItem> get items => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  int get tipAmount => throw _privateConstructorUsedError;
  bool get marketingOptIn => throw _privateConstructorUsedError;
  List<String> get discountCodes => throw _privateConstructorUsedError;
  String get vendor => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  DeliveryAddresses get address => throw _privateConstructorUsedError;
  int get fulfilmentMethod => throw _privateConstructorUsedError;
  String get fulfilmentSlotFrom => throw _privateConstructorUsedError;
  String get fulfilmentSlotTo => throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;
  String get publicId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderForCollectionCopyWith<CreateOrderForCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderForCollectionCopyWith<$Res> {
  factory $CreateOrderForCollectionCopyWith(CreateOrderForCollection value,
          $Res Function(CreateOrderForCollection) then) =
      _$CreateOrderForCollectionCopyWithImpl<$Res, CreateOrderForCollection>;
  @useResult
  $Res call(
      {List<CartItem> items,
      num total,
      Currency currency,
      int tipAmount,
      bool marketingOptIn,
      List<String> discountCodes,
      String vendor,
      String walletAddress,
      DeliveryAddresses address,
      int fulfilmentMethod,
      String fulfilmentSlotFrom,
      String fulfilmentSlotTo,
      bool isDelivery,
      String publicId});

  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class _$CreateOrderForCollectionCopyWithImpl<$Res,
        $Val extends CreateOrderForCollection>
    implements $CreateOrderForCollectionCopyWith<$Res> {
  _$CreateOrderForCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? currency = null,
    Object? tipAmount = null,
    Object? marketingOptIn = null,
    Object? discountCodes = null,
    Object? vendor = null,
    Object? walletAddress = null,
    Object? address = null,
    Object? fulfilmentMethod = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? isDelivery = null,
    Object? publicId = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      marketingOptIn: null == marketingOptIn
          ? _value.marketingOptIn
          : marketingOptIn // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCodes: null == discountCodes
          ? _value.discountCodes
          : discountCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_CreateOrderForCollectionCopyWith<$Res>
    implements $CreateOrderForCollectionCopyWith<$Res> {
  factory _$$_CreateOrderForCollectionCopyWith(
          _$_CreateOrderForCollection value,
          $Res Function(_$_CreateOrderForCollection) then) =
      __$$_CreateOrderForCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> items,
      num total,
      Currency currency,
      int tipAmount,
      bool marketingOptIn,
      List<String> discountCodes,
      String vendor,
      String walletAddress,
      DeliveryAddresses address,
      int fulfilmentMethod,
      String fulfilmentSlotFrom,
      String fulfilmentSlotTo,
      bool isDelivery,
      String publicId});

  @override
  $DeliveryAddressesCopyWith<$Res> get address;
}

/// @nodoc
class __$$_CreateOrderForCollectionCopyWithImpl<$Res>
    extends _$CreateOrderForCollectionCopyWithImpl<$Res,
        _$_CreateOrderForCollection>
    implements _$$_CreateOrderForCollectionCopyWith<$Res> {
  __$$_CreateOrderForCollectionCopyWithImpl(_$_CreateOrderForCollection _value,
      $Res Function(_$_CreateOrderForCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? currency = null,
    Object? tipAmount = null,
    Object? marketingOptIn = null,
    Object? discountCodes = null,
    Object? vendor = null,
    Object? walletAddress = null,
    Object? address = null,
    Object? fulfilmentMethod = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? isDelivery = null,
    Object? publicId = null,
  }) {
    return _then(_$_CreateOrderForCollection(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      marketingOptIn: null == marketingOptIn
          ? _value.marketingOptIn
          : marketingOptIn // ignore: cast_nullable_to_non_nullable
              as bool,
      discountCodes: null == discountCodes
          ? _value.discountCodes
          : discountCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CreateOrderForCollection extends _CreateOrderForCollection {
  _$_CreateOrderForCollection(
      {required this.items,
      required this.total,
      required this.currency,
      required this.tipAmount,
      required this.marketingOptIn,
      required this.discountCodes,
      required this.vendor,
      required this.walletAddress,
      required this.address,
      required this.fulfilmentMethod,
      required this.fulfilmentSlotFrom,
      required this.fulfilmentSlotTo,
      required this.isDelivery,
      required this.publicId})
      : super._();

  factory _$_CreateOrderForCollection.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderForCollectionFromJson(json);

  @override
  final List<CartItem> items;
  @override
  final num total;
  @override
  final Currency currency;
  @override
  final int tipAmount;
  @override
  final bool marketingOptIn;
  @override
  final List<String> discountCodes;
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
  final String publicId;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateOrderForCollection &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.marketingOptIn, marketingOptIn) ||
                other.marketingOptIn == marketingOptIn) &&
            const DeepCollectionEquality()
                .equals(other.discountCodes, discountCodes) &&
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
                other.isDelivery == isDelivery) &&
            (identical(other.publicId, publicId) ||
                other.publicId == publicId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      total,
      currency,
      tipAmount,
      marketingOptIn,
      const DeepCollectionEquality().hash(discountCodes),
      vendor,
      walletAddress,
      address,
      fulfilmentMethod,
      fulfilmentSlotFrom,
      fulfilmentSlotTo,
      isDelivery,
      publicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateOrderForCollectionCopyWith<_$_CreateOrderForCollection>
      get copyWith => __$$_CreateOrderForCollectionCopyWithImpl<
          _$_CreateOrderForCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateOrderForCollectionToJson(
      this,
    );
  }
}

abstract class _CreateOrderForCollection extends CreateOrderForCollection {
  factory _CreateOrderForCollection(
      {required final List<CartItem> items,
      required final num total,
      required final Currency currency,
      required final int tipAmount,
      required final bool marketingOptIn,
      required final List<String> discountCodes,
      required final String vendor,
      required final String walletAddress,
      required final DeliveryAddresses address,
      required final int fulfilmentMethod,
      required final String fulfilmentSlotFrom,
      required final String fulfilmentSlotTo,
      required final bool isDelivery,
      required final String publicId}) = _$_CreateOrderForCollection;
  _CreateOrderForCollection._() : super._();

  factory _CreateOrderForCollection.fromJson(Map<String, dynamic> json) =
      _$_CreateOrderForCollection.fromJson;

  @override
  List<CartItem> get items;
  @override
  num get total;
  @override
  Currency get currency;
  @override
  int get tipAmount;
  @override
  bool get marketingOptIn;
  @override
  List<String> get discountCodes;
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
  String get publicId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateOrderForCollectionCopyWith<_$_CreateOrderForCollection>
      get copyWith => throw _privateConstructorUsedError;
}
