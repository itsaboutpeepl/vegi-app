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
  TimeSlot get selectedSlot => throw _privateConstructorUsedError;
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
      _$OrderDetailsCopyWithImpl<$Res, OrderDetails>;
  @useResult
  $Res call(
      {TimeSlot selectedSlot,
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

  $TimeSlotCopyWith<$Res> get selectedSlot;
  $DeliveryAddressesCopyWith<$Res> get orderAddress;
}

/// @nodoc
class _$OrderDetailsCopyWithImpl<$Res, $Val extends OrderDetails>
    implements $OrderDetailsCopyWith<$Res> {
  _$OrderDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = null,
    Object? isDelivery = null,
    Object? orderAddress = null,
    Object? restaurantName = null,
    Object? cartItems = null,
    Object? cartTotal = null,
    Object? orderID = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? GBPxAmountPaid = null,
    Object? PPLAmountPaid = null,
    Object? orderAcceptanceStatus = null,
  }) {
    return _then(_value.copyWith(
      selectedSlot: null == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAddress: null == orderAddress
          ? _value.orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      GBPxAmountPaid: null == GBPxAmountPaid
          ? _value.GBPxAmountPaid
          : GBPxAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      PPLAmountPaid: null == PPLAmountPaid
          ? _value.PPLAmountPaid
          : PPLAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      orderAcceptanceStatus: null == orderAcceptanceStatus
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSlotCopyWith<$Res> get selectedSlot {
    return $TimeSlotCopyWith<$Res>(_value.selectedSlot, (value) {
      return _then(_value.copyWith(selectedSlot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res> get orderAddress {
    return $DeliveryAddressesCopyWith<$Res>(_value.orderAddress, (value) {
      return _then(_value.copyWith(orderAddress: value) as $Val);
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
  @useResult
  $Res call(
      {TimeSlot selectedSlot,
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
  $TimeSlotCopyWith<$Res> get selectedSlot;
  @override
  $DeliveryAddressesCopyWith<$Res> get orderAddress;
}

/// @nodoc
class __$$_OrderDetailsCopyWithImpl<$Res>
    extends _$OrderDetailsCopyWithImpl<$Res, _$_OrderDetails>
    implements _$$_OrderDetailsCopyWith<$Res> {
  __$$_OrderDetailsCopyWithImpl(
      _$_OrderDetails _value, $Res Function(_$_OrderDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSlot = null,
    Object? isDelivery = null,
    Object? orderAddress = null,
    Object? restaurantName = null,
    Object? cartItems = null,
    Object? cartTotal = null,
    Object? orderID = null,
    Object? userName = null,
    Object? phoneNumber = null,
    Object? GBPxAmountPaid = null,
    Object? PPLAmountPaid = null,
    Object? orderAcceptanceStatus = null,
  }) {
    return _then(_$_OrderDetails(
      selectedSlot: null == selectedSlot
          ? _value.selectedSlot
          : selectedSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      orderAddress: null == orderAddress
          ? _value.orderAddress
          : orderAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      GBPxAmountPaid: null == GBPxAmountPaid
          ? _value.GBPxAmountPaid
          : GBPxAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      PPLAmountPaid: null == PPLAmountPaid
          ? _value.PPLAmountPaid
          : PPLAmountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      orderAcceptanceStatus: null == orderAcceptanceStatus
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
  final TimeSlot selectedSlot;
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
            (identical(other.selectedSlot, selectedSlot) ||
                other.selectedSlot == selectedSlot) &&
            (identical(other.isDelivery, isDelivery) ||
                other.isDelivery == isDelivery) &&
            (identical(other.orderAddress, orderAddress) ||
                other.orderAddress == orderAddress) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            const DeepCollectionEquality().equals(other.cartItems, cartItems) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.GBPxAmountPaid, GBPxAmountPaid) ||
                other.GBPxAmountPaid == GBPxAmountPaid) &&
            (identical(other.PPLAmountPaid, PPLAmountPaid) ||
                other.PPLAmountPaid == PPLAmountPaid) &&
            (identical(other.orderAcceptanceStatus, orderAcceptanceStatus) ||
                other.orderAcceptanceStatus == orderAcceptanceStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedSlot,
      isDelivery,
      orderAddress,
      restaurantName,
      const DeepCollectionEquality().hash(cartItems),
      cartTotal,
      orderID,
      userName,
      phoneNumber,
      GBPxAmountPaid,
      PPLAmountPaid,
      orderAcceptanceStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      __$$_OrderDetailsCopyWithImpl<_$_OrderDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsToJson(
      this,
    );
  }
}

abstract class _OrderDetails extends OrderDetails {
  factory _OrderDetails(
          {required final TimeSlot selectedSlot,
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
  TimeSlot get selectedSlot;
  @override
  bool get isDelivery;
  @override
  DeliveryAddresses get orderAddress;
  @override
  String get restaurantName;
  @override
  List<CartItem> get cartItems;
  @override
  int get cartTotal;
  @override
  String get orderID;
  @override
  String get userName;
  @override
  String get phoneNumber;
  @override
  double get GBPxAmountPaid;
  @override
  double get PPLAmountPaid;
  @override
  OrderAcceptanceStatus get orderAcceptanceStatus;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsCopyWith<_$_OrderDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
