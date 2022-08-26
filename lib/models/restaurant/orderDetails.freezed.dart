// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orderDetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return _OrderDetails.fromJson(json);
}

/// @nodoc
mixin _$OrderDetails {
  Map<String, String> get selectedSlot => throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;
  DeliveryAddresses get orderAddress => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  double get GBPxAmountPaid => throw _privateConstructorUsedError;
  double get PPLAmountPaid => throw _privateConstructorUsedError;
  OrderAcceptanceStatus get orderAcceptanceStatus =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsCopyWith<OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsCopyWith<$Res> {
  factory $OrderDetailsCopyWith(
          OrderDetails value, $Res Function(OrderDetails) then) =
      _$OrderDetailsCopyWithImpl<$Res>;
  $Res call(
      {Map<String, String> selectedSlot,
      bool isDelivery,
      DeliveryAddresses orderAddress,
      String restaurantName,
      List<CartItem> cartItems,
      int cartTotal,
      String orderID,
      String userName,
      String phoneNumber,
      double GBPxAmountPaid,
      double PPLAmountPaid,
      OrderAcceptanceStatus orderAcceptanceStatus});

  $DeliveryAddressesCopyWith<$Res> get orderAddress;
}

/// @nodoc
class _$OrderDetailsCopyWithImpl<$Res> implements $OrderDetailsCopyWith<$Res> {
  _$OrderDetailsCopyWithImpl(this._value, this._then);

  final OrderDetails _value;
  // ignore: unused_field
  final $Res Function(OrderDetails) _then;

  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? isDelivery = freezed,
    Object? orderAddress = freezed,
    Object? restaurantName = freezed,
    Object? cartItems = freezed,
    Object? cartTotal = freezed,
    Object? orderID = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
    Object? GBPxAmountPaid = freezed,
    Object? PPLAmountPaid = freezed,
    Object? orderAcceptanceStatus = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSlot: selectedSlot == freezed
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isDelivery: isDelivery == freezed
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAddress: orderAddress == freezed
          ? _value.orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      GBPxAmountPaid: GBPxAmountPaid == freezed
          ? _value.GBPxAmountPaid
          : GBPxAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      PPLAmountPaid: PPLAmountPaid == freezed
          ? _value.PPLAmountPaid
          : PPLAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      orderAcceptanceStatus: orderAcceptanceStatus == freezed
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
    ));
  }

  @override
  $DeliveryAddressesCopyWith<$Res> get orderAddress {
    return $DeliveryAddressesCopyWith<$Res>(_value.orderAddress, (value) {
      return _then(_value.copyWith(orderAddress: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailsCopyWith<$Res>
    implements $OrderDetailsCopyWith<$Res> {
  factory _$$_OrderDetailsCopyWith(
          _$_OrderDetails value, $Res Function(_$_OrderDetails) then) =
      __$$_OrderDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, String> selectedSlot,
      bool isDelivery,
      DeliveryAddresses orderAddress,
      String restaurantName,
      List<CartItem> cartItems,
      int cartTotal,
      String orderID,
      String userName,
      String phoneNumber,
      double GBPxAmountPaid,
      double PPLAmountPaid,
      OrderAcceptanceStatus orderAcceptanceStatus});

  @override
  $DeliveryAddressesCopyWith<$Res> get orderAddress;
}

/// @nodoc
class __$$_OrderDetailsCopyWithImpl<$Res>
    extends _$OrderDetailsCopyWithImpl<$Res>
    implements _$$_OrderDetailsCopyWith<$Res> {
  __$$_OrderDetailsCopyWithImpl(
      _$_OrderDetails _value, $Res Function(_$_OrderDetails) _then)
      : super(_value, (v) => _then(v as _$_OrderDetails));

  @override
  _$_OrderDetails get _value => super._value as _$_OrderDetails;

  @override
  $Res call({
    Object? selectedSlot = freezed,
    Object? isDelivery = freezed,
    Object? orderAddress = freezed,
    Object? restaurantName = freezed,
    Object? cartItems = freezed,
    Object? cartTotal = freezed,
    Object? orderID = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
    Object? GBPxAmountPaid = freezed,
    Object? PPLAmountPaid = freezed,
    Object? orderAcceptanceStatus = freezed,
  }) {
    return _then(_$_OrderDetails(
      selectedSlot: selectedSlot == freezed
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isDelivery: isDelivery == freezed
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAddress: orderAddress == freezed
          ? _value.orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartTotal: cartTotal == freezed
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      GBPxAmountPaid: GBPxAmountPaid == freezed
          ? _value.GBPxAmountPaid
          : GBPxAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      PPLAmountPaid: PPLAmountPaid == freezed
          ? _value.PPLAmountPaid
          : PPLAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      orderAcceptanceStatus: orderAcceptanceStatus == freezed
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_OrderDetails extends _OrderDetails {
  _$_OrderDetails(
      {required this.selectedSlot,
      required this.isDelivery,
      required this.orderAddress,
      required this.restaurantName,
      required this.cartItems,
      required this.cartTotal,
      required this.orderID,
      required this.userName,
      required this.phoneNumber,
      required this.GBPxAmountPaid,
      required this.PPLAmountPaid,
      required this.orderAcceptanceStatus})
      : super._();

  factory _$_OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailsFromJson(json);

  @override
  final Map<String, String> selectedSlot;
  @override
  final bool isDelivery;
  @override
  final DeliveryAddresses orderAddress;
  @override
  final String restaurantName;
  @override
  final List<CartItem> cartItems;
  @override
  final int cartTotal;
  @override
  final String orderID;
  @override
  final String userName;
  @override
  final String phoneNumber;
  @override
  final double GBPxAmountPaid;
  @override
  final double PPLAmountPaid;
  @override
  final OrderAcceptanceStatus orderAcceptanceStatus;

  @override
  String toString() {
    return 'OrderDetails(selectedSlot: $selectedSlot, isDelivery: $isDelivery, orderAddress: $orderAddress, restaurantName: $restaurantName, cartItems: $cartItems, cartTotal: $cartTotal, orderID: $orderID, userName: $userName, phoneNumber: $phoneNumber, GBPxAmountPaid: $GBPxAmountPaid, PPLAmountPaid: $PPLAmountPaid, orderAcceptanceStatus: $orderAcceptanceStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetails &&
            const DeepCollectionEquality()
                .equals(other.selectedSlot, selectedSlot) &&
            const DeepCollectionEquality()
                .equals(other.isDelivery, isDelivery) &&
            const DeepCollectionEquality()
                .equals(other.orderAddress, orderAddress) &&
            const DeepCollectionEquality()
                .equals(other.restaurantName, restaurantName) &&
            const DeepCollectionEquality().equals(other.cartItems, cartItems) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality().equals(other.orderID, orderID) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.GBPxAmountPaid, GBPxAmountPaid) &&
            const DeepCollectionEquality()
                .equals(other.PPLAmountPaid, PPLAmountPaid) &&
            const DeepCollectionEquality()
                .equals(other.orderAcceptanceStatus, orderAcceptanceStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedSlot),
      const DeepCollectionEquality().hash(isDelivery),
      const DeepCollectionEquality().hash(orderAddress),
      const DeepCollectionEquality().hash(restaurantName),
      const DeepCollectionEquality().hash(cartItems),
      const DeepCollectionEquality().hash(cartTotal),
      const DeepCollectionEquality().hash(orderID),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(GBPxAmountPaid),
      const DeepCollectionEquality().hash(PPLAmountPaid),
      const DeepCollectionEquality().hash(orderAcceptanceStatus));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      __$$_OrderDetailsCopyWithImpl<_$_OrderDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsToJson(this);
  }
}

abstract class _OrderDetails extends OrderDetails {
  factory _OrderDetails(
          {required final Map<String, String> selectedSlot,
          required final bool isDelivery,
          required final DeliveryAddresses orderAddress,
          required final String restaurantName,
          required final List<CartItem> cartItems,
          required final int cartTotal,
          required final String orderID,
          required final String userName,
          required final String phoneNumber,
          required final double GBPxAmountPaid,
          required final double PPLAmountPaid,
          required final OrderAcceptanceStatus orderAcceptanceStatus}) =
      _$_OrderDetails;
  _OrderDetails._() : super._();

  factory _OrderDetails.fromJson(Map<String, dynamic> json) =
      _$_OrderDetails.fromJson;

  @override
  Map<String, String> get selectedSlot => throw _privateConstructorUsedError;
  @override
  bool get isDelivery => throw _privateConstructorUsedError;
  @override
  DeliveryAddresses get orderAddress => throw _privateConstructorUsedError;
  @override
  String get restaurantName => throw _privateConstructorUsedError;
  @override
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  @override
  int get cartTotal => throw _privateConstructorUsedError;
  @override
  String get orderID => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  double get GBPxAmountPaid => throw _privateConstructorUsedError;
  @override
  double get PPLAmountPaid => throw _privateConstructorUsedError;
  @override
  OrderAcceptanceStatus get orderAcceptanceStatus =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
