// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;
  num get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toTS)
  DateTime get orderedDateTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toTSNullable)
  DateTime? get paidDateTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toTSNullable)
  DateTime? get refundDateTime => throw _privateConstructorUsedError;
  String? get deliveryName => throw _privateConstructorUsedError;
  String? get deliveryEmail => throw _privateConstructorUsedError;
  String? get deliveryPhoneNumber => throw _privateConstructorUsedError;
  String get deliveryAddressLineOne => throw _privateConstructorUsedError;
  String get deliveryAddressLineTwo => throw _privateConstructorUsedError;
  String get deliveryAddressCity => throw _privateConstructorUsedError;
  String get deliveryAddressPostCode => throw _privateConstructorUsedError;
  String get deliveryAddressInstructions => throw _privateConstructorUsedError;
  String get deliveryId => throw _privateConstructorUsedError;
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  OrderPaidStatus get paymentStatus => throw _privateConstructorUsedError;
  @JsonEnum()
  @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
  RestaurantAcceptedStatus get restaurantAcceptanceStatus =>
      throw _privateConstructorUsedError;
  bool get deliveryPartnerAccepted => throw _privateConstructorUsedError;
  bool get deliveryPartnerConfirmed => throw _privateConstructorUsedError;
  DateTime get fulfilmentSlotFrom =>
      throw _privateConstructorUsedError; // "2022-09-29T10:00:00.000Z"
  DateTime get fulfilmentSlotTo =>
      throw _privateConstructorUsedError; // "2022-09-29T10:00:00.000Z"
  String get publicId => throw _privateConstructorUsedError;
  int get tipAmount => throw _privateConstructorUsedError;
  int get rewardsIssued => throw _privateConstructorUsedError;
  bool get sentToDeliveryPartner => throw _privateConstructorUsedError;
  VendorDTO get vendor => throw _privateConstructorUsedError;
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(readValue: getFulfilmentMethodType)
  FulfilmentMethodType get fulfilmentMethod =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int id,
      List<OrderItem> items,
      num total,
      num subtotal,
      @JsonKey(fromJson: _toTS)
          DateTime orderedDateTime,
      @JsonKey(fromJson: _toTSNullable)
          DateTime? paidDateTime,
      @JsonKey(fromJson: _toTSNullable)
          DateTime? refundDateTime,
      String? deliveryName,
      String? deliveryEmail,
      String? deliveryPhoneNumber,
      String deliveryAddressLineOne,
      String deliveryAddressLineTwo,
      String deliveryAddressCity,
      String deliveryAddressPostCode,
      String deliveryAddressInstructions,
      String deliveryId,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          OrderPaidStatus paymentStatus,
      @JsonEnum()
      @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
          RestaurantAcceptedStatus restaurantAcceptanceStatus,
      bool deliveryPartnerAccepted,
      bool deliveryPartnerConfirmed,
      DateTime fulfilmentSlotFrom,
      DateTime fulfilmentSlotTo,
      String publicId,
      int tipAmount,
      int rewardsIssued,
      bool sentToDeliveryPartner,
      VendorDTO vendor,
      DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(readValue: getFulfilmentMethodType)
          FulfilmentMethodType fulfilmentMethod});

  $VendorDTOCopyWith<$Res> get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? total = null,
    Object? subtotal = null,
    Object? orderedDateTime = null,
    Object? paidDateTime = freezed,
    Object? refundDateTime = freezed,
    Object? deliveryName = freezed,
    Object? deliveryEmail = freezed,
    Object? deliveryPhoneNumber = freezed,
    Object? deliveryAddressLineOne = null,
    Object? deliveryAddressLineTwo = null,
    Object? deliveryAddressCity = null,
    Object? deliveryAddressPostCode = null,
    Object? deliveryAddressInstructions = null,
    Object? deliveryId = null,
    Object? paymentStatus = null,
    Object? restaurantAcceptanceStatus = null,
    Object? deliveryPartnerAccepted = null,
    Object? deliveryPartnerConfirmed = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? publicId = null,
    Object? tipAmount = null,
    Object? rewardsIssued = null,
    Object? sentToDeliveryPartner = null,
    Object? vendor = null,
    Object? deliveryPartner = freezed,
    Object? fulfilmentMethod = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as num,
      orderedDateTime: null == orderedDateTime
          ? _value.orderedDateTime
          : orderedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidDateTime: freezed == paidDateTime
          ? _value.paidDateTime
          : paidDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refundDateTime: freezed == refundDateTime
          ? _value.refundDateTime
          : refundDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryName: freezed == deliveryName
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryEmail: freezed == deliveryEmail
          ? _value.deliveryEmail
          : deliveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPhoneNumber: freezed == deliveryPhoneNumber
          ? _value.deliveryPhoneNumber
          : deliveryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressLineOne: null == deliveryAddressLineOne
          ? _value.deliveryAddressLineOne
          : deliveryAddressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressLineTwo: null == deliveryAddressLineTwo
          ? _value.deliveryAddressLineTwo
          : deliveryAddressLineTwo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressPostCode: null == deliveryAddressPostCode
          ? _value.deliveryAddressPostCode
          : deliveryAddressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressInstructions: null == deliveryAddressInstructions
          ? _value.deliveryAddressInstructions
          : deliveryAddressInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptedStatus,
      deliveryPartnerAccepted: null == deliveryPartnerAccepted
          ? _value.deliveryPartnerAccepted
          : deliveryPartnerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPartnerConfirmed: null == deliveryPartnerConfirmed
          ? _value.deliveryPartnerConfirmed
          : deliveryPartnerConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsIssued: null == rewardsIssued
          ? _value.rewardsIssued
          : rewardsIssued // ignore: cast_nullable_to_non_nullable
              as int,
      sentToDeliveryPartner: null == sentToDeliveryPartner
          ? _value.sentToDeliveryPartner
          : sentToDeliveryPartner // ignore: cast_nullable_to_non_nullable
              as bool,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorDTOCopyWith<$Res> get vendor {
    return $VendorDTOCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner {
    if (_value.deliveryPartner == null) {
      return null;
    }

    return $DeliveryPartnerDTOCopyWith<$Res>(_value.deliveryPartner!, (value) {
      return _then(_value.copyWith(deliveryPartner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<OrderItem> items,
      num total,
      num subtotal,
      @JsonKey(fromJson: _toTS)
          DateTime orderedDateTime,
      @JsonKey(fromJson: _toTSNullable)
          DateTime? paidDateTime,
      @JsonKey(fromJson: _toTSNullable)
          DateTime? refundDateTime,
      String? deliveryName,
      String? deliveryEmail,
      String? deliveryPhoneNumber,
      String deliveryAddressLineOne,
      String deliveryAddressLineTwo,
      String deliveryAddressCity,
      String deliveryAddressPostCode,
      String deliveryAddressInstructions,
      String deliveryId,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          OrderPaidStatus paymentStatus,
      @JsonEnum()
      @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
          RestaurantAcceptedStatus restaurantAcceptanceStatus,
      bool deliveryPartnerAccepted,
      bool deliveryPartnerConfirmed,
      DateTime fulfilmentSlotFrom,
      DateTime fulfilmentSlotTo,
      String publicId,
      int tipAmount,
      int rewardsIssued,
      bool sentToDeliveryPartner,
      VendorDTO vendor,
      DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(readValue: getFulfilmentMethodType)
          FulfilmentMethodType fulfilmentMethod});

  @override
  $VendorDTOCopyWith<$Res> get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? total = null,
    Object? subtotal = null,
    Object? orderedDateTime = null,
    Object? paidDateTime = freezed,
    Object? refundDateTime = freezed,
    Object? deliveryName = freezed,
    Object? deliveryEmail = freezed,
    Object? deliveryPhoneNumber = freezed,
    Object? deliveryAddressLineOne = null,
    Object? deliveryAddressLineTwo = null,
    Object? deliveryAddressCity = null,
    Object? deliveryAddressPostCode = null,
    Object? deliveryAddressInstructions = null,
    Object? deliveryId = null,
    Object? paymentStatus = null,
    Object? restaurantAcceptanceStatus = null,
    Object? deliveryPartnerAccepted = null,
    Object? deliveryPartnerConfirmed = null,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? publicId = null,
    Object? tipAmount = null,
    Object? rewardsIssued = null,
    Object? sentToDeliveryPartner = null,
    Object? vendor = null,
    Object? deliveryPartner = freezed,
    Object? fulfilmentMethod = null,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as num,
      orderedDateTime: null == orderedDateTime
          ? _value.orderedDateTime
          : orderedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidDateTime: freezed == paidDateTime
          ? _value.paidDateTime
          : paidDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      refundDateTime: freezed == refundDateTime
          ? _value.refundDateTime
          : refundDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryName: freezed == deliveryName
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryEmail: freezed == deliveryEmail
          ? _value.deliveryEmail
          : deliveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPhoneNumber: freezed == deliveryPhoneNumber
          ? _value.deliveryPhoneNumber
          : deliveryPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressLineOne: null == deliveryAddressLineOne
          ? _value.deliveryAddressLineOne
          : deliveryAddressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressLineTwo: null == deliveryAddressLineTwo
          ? _value.deliveryAddressLineTwo
          : deliveryAddressLineTwo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressPostCode: null == deliveryAddressPostCode
          ? _value.deliveryAddressPostCode
          : deliveryAddressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressInstructions: null == deliveryAddressInstructions
          ? _value.deliveryAddressInstructions
          : deliveryAddressInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryId: null == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptedStatus,
      deliveryPartnerAccepted: null == deliveryPartnerAccepted
          ? _value.deliveryPartnerAccepted
          : deliveryPartnerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPartnerConfirmed: null == deliveryPartnerConfirmed
          ? _value.deliveryPartnerConfirmed
          : deliveryPartnerConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsIssued: null == rewardsIssued
          ? _value.rewardsIssued
          : rewardsIssued // ignore: cast_nullable_to_non_nullable
              as int,
      sentToDeliveryPartner: null == sentToDeliveryPartner
          ? _value.sentToDeliveryPartner
          : sentToDeliveryPartner // ignore: cast_nullable_to_non_nullable
              as bool,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Order extends _Order {
  _$_Order(
      {required this.id,
      required this.items,
      required this.total,
      required this.subtotal,
      @JsonKey(fromJson: _toTS)
          required this.orderedDateTime,
      @JsonKey(fromJson: _toTSNullable)
          this.paidDateTime,
      @JsonKey(fromJson: _toTSNullable)
          this.refundDateTime,
      required this.deliveryName,
      required this.deliveryEmail,
      required this.deliveryPhoneNumber,
      required this.deliveryAddressLineOne,
      required this.deliveryAddressLineTwo,
      required this.deliveryAddressCity,
      required this.deliveryAddressPostCode,
      required this.deliveryAddressInstructions,
      required this.deliveryId,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          required this.paymentStatus,
      @JsonEnum()
      @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
          required this.restaurantAcceptanceStatus,
      required this.deliveryPartnerAccepted,
      required this.deliveryPartnerConfirmed,
      required this.fulfilmentSlotFrom,
      required this.fulfilmentSlotTo,
      required this.publicId,
      required this.tipAmount,
      required this.rewardsIssued,
      required this.sentToDeliveryPartner,
      required this.vendor,
      required this.deliveryPartner,
      @JsonKey(readValue: getFulfilmentMethodType)
          required this.fulfilmentMethod})
      : super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final int id;
  @override
  final List<OrderItem> items;
  @override
  final num total;
  @override
  final num subtotal;
  @override
  @JsonKey(fromJson: _toTS)
  final DateTime orderedDateTime;
  @override
  @JsonKey(fromJson: _toTSNullable)
  final DateTime? paidDateTime;
  @override
  @JsonKey(fromJson: _toTSNullable)
  final DateTime? refundDateTime;
  @override
  final String? deliveryName;
  @override
  final String? deliveryEmail;
  @override
  final String? deliveryPhoneNumber;
  @override
  final String deliveryAddressLineOne;
  @override
  final String deliveryAddressLineTwo;
  @override
  final String deliveryAddressCity;
  @override
  final String deliveryAddressPostCode;
  @override
  final String deliveryAddressInstructions;
  @override
  final String deliveryId;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  final OrderPaidStatus paymentStatus;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
  final RestaurantAcceptedStatus restaurantAcceptanceStatus;
  @override
  final bool deliveryPartnerAccepted;
  @override
  final bool deliveryPartnerConfirmed;
  @override
  final DateTime fulfilmentSlotFrom;
// "2022-09-29T10:00:00.000Z"
  @override
  final DateTime fulfilmentSlotTo;
// "2022-09-29T10:00:00.000Z"
  @override
  final String publicId;
  @override
  final int tipAmount;
  @override
  final int rewardsIssued;
  @override
  final bool sentToDeliveryPartner;
  @override
  final VendorDTO vendor;
  @override
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(readValue: getFulfilmentMethodType)
  final FulfilmentMethodType fulfilmentMethod;

  @override
  String toString() {
    return 'Order(id: $id, items: $items, total: $total, subtotal: $subtotal, orderedDateTime: $orderedDateTime, paidDateTime: $paidDateTime, refundDateTime: $refundDateTime, deliveryName: $deliveryName, deliveryEmail: $deliveryEmail, deliveryPhoneNumber: $deliveryPhoneNumber, deliveryAddressLineOne: $deliveryAddressLineOne, deliveryAddressLineTwo: $deliveryAddressLineTwo, deliveryAddressCity: $deliveryAddressCity, deliveryAddressPostCode: $deliveryAddressPostCode, deliveryAddressInstructions: $deliveryAddressInstructions, deliveryId: $deliveryId, paymentStatus: $paymentStatus, restaurantAcceptanceStatus: $restaurantAcceptanceStatus, deliveryPartnerAccepted: $deliveryPartnerAccepted, deliveryPartnerConfirmed: $deliveryPartnerConfirmed, fulfilmentSlotFrom: $fulfilmentSlotFrom, fulfilmentSlotTo: $fulfilmentSlotTo, publicId: $publicId, tipAmount: $tipAmount, rewardsIssued: $rewardsIssued, sentToDeliveryPartner: $sentToDeliveryPartner, vendor: $vendor, deliveryPartner: $deliveryPartner, fulfilmentMethod: $fulfilmentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.orderedDateTime, orderedDateTime) ||
                other.orderedDateTime == orderedDateTime) &&
            (identical(other.paidDateTime, paidDateTime) ||
                other.paidDateTime == paidDateTime) &&
            (identical(other.refundDateTime, refundDateTime) ||
                other.refundDateTime == refundDateTime) &&
            (identical(other.deliveryName, deliveryName) ||
                other.deliveryName == deliveryName) &&
            (identical(other.deliveryEmail, deliveryEmail) ||
                other.deliveryEmail == deliveryEmail) &&
            (identical(other.deliveryPhoneNumber, deliveryPhoneNumber) ||
                other.deliveryPhoneNumber == deliveryPhoneNumber) &&
            (identical(other.deliveryAddressLineOne, deliveryAddressLineOne) ||
                other.deliveryAddressLineOne == deliveryAddressLineOne) &&
            (identical(other.deliveryAddressLineTwo, deliveryAddressLineTwo) ||
                other.deliveryAddressLineTwo == deliveryAddressLineTwo) &&
            (identical(other.deliveryAddressCity, deliveryAddressCity) ||
                other.deliveryAddressCity == deliveryAddressCity) &&
            (identical(other.deliveryAddressPostCode, deliveryAddressPostCode) ||
                other.deliveryAddressPostCode == deliveryAddressPostCode) &&
            (identical(other.deliveryAddressInstructions,
                    deliveryAddressInstructions) ||
                other.deliveryAddressInstructions ==
                    deliveryAddressInstructions) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.restaurantAcceptanceStatus, restaurantAcceptanceStatus) ||
                other.restaurantAcceptanceStatus ==
                    restaurantAcceptanceStatus) &&
            (identical(other.deliveryPartnerAccepted, deliveryPartnerAccepted) ||
                other.deliveryPartnerAccepted == deliveryPartnerAccepted) &&
            (identical(other.deliveryPartnerConfirmed, deliveryPartnerConfirmed) ||
                other.deliveryPartnerConfirmed == deliveryPartnerConfirmed) &&
            (identical(other.fulfilmentSlotFrom, fulfilmentSlotFrom) ||
                other.fulfilmentSlotFrom == fulfilmentSlotFrom) &&
            (identical(other.fulfilmentSlotTo, fulfilmentSlotTo) ||
                other.fulfilmentSlotTo == fulfilmentSlotTo) &&
            (identical(other.publicId, publicId) ||
                other.publicId == publicId) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.rewardsIssued, rewardsIssued) ||
                other.rewardsIssued == rewardsIssued) &&
            (identical(other.sentToDeliveryPartner, sentToDeliveryPartner) ||
                other.sentToDeliveryPartner == sentToDeliveryPartner) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryPartner, deliveryPartner) ||
                other.deliveryPartner == deliveryPartner) &&
            (identical(other.fulfilmentMethod, fulfilmentMethod) ||
                other.fulfilmentMethod == fulfilmentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(items),
        total,
        subtotal,
        orderedDateTime,
        paidDateTime,
        refundDateTime,
        deliveryName,
        deliveryEmail,
        deliveryPhoneNumber,
        deliveryAddressLineOne,
        deliveryAddressLineTwo,
        deliveryAddressCity,
        deliveryAddressPostCode,
        deliveryAddressInstructions,
        deliveryId,
        paymentStatus,
        restaurantAcceptanceStatus,
        deliveryPartnerAccepted,
        deliveryPartnerConfirmed,
        fulfilmentSlotFrom,
        fulfilmentSlotTo,
        publicId,
        tipAmount,
        rewardsIssued,
        sentToDeliveryPartner,
        vendor,
        deliveryPartner,
        fulfilmentMethod
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  factory _Order(
      {required final int id,
      required final List<OrderItem> items,
      required final num total,
      required final num subtotal,
      @JsonKey(fromJson: _toTS)
          required final DateTime orderedDateTime,
      @JsonKey(fromJson: _toTSNullable)
          final DateTime? paidDateTime,
      @JsonKey(fromJson: _toTSNullable)
          final DateTime? refundDateTime,
      required final String? deliveryName,
      required final String? deliveryEmail,
      required final String? deliveryPhoneNumber,
      required final String deliveryAddressLineOne,
      required final String deliveryAddressLineTwo,
      required final String deliveryAddressCity,
      required final String deliveryAddressPostCode,
      required final String deliveryAddressInstructions,
      required final String deliveryId,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          required final OrderPaidStatus paymentStatus,
      @JsonEnum()
      @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
          required final RestaurantAcceptedStatus restaurantAcceptanceStatus,
      required final bool deliveryPartnerAccepted,
      required final bool deliveryPartnerConfirmed,
      required final DateTime fulfilmentSlotFrom,
      required final DateTime fulfilmentSlotTo,
      required final String publicId,
      required final int tipAmount,
      required final int rewardsIssued,
      required final bool sentToDeliveryPartner,
      required final VendorDTO vendor,
      required final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(readValue: getFulfilmentMethodType)
          required final FulfilmentMethodType fulfilmentMethod}) = _$_Order;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int get id;
  @override
  List<OrderItem> get items;
  @override
  num get total;
  @override
  num get subtotal;
  @override
  @JsonKey(fromJson: _toTS)
  DateTime get orderedDateTime;
  @override
  @JsonKey(fromJson: _toTSNullable)
  DateTime? get paidDateTime;
  @override
  @JsonKey(fromJson: _toTSNullable)
  DateTime? get refundDateTime;
  @override
  String? get deliveryName;
  @override
  String? get deliveryEmail;
  @override
  String? get deliveryPhoneNumber;
  @override
  String get deliveryAddressLineOne;
  @override
  String get deliveryAddressLineTwo;
  @override
  String get deliveryAddressCity;
  @override
  String get deliveryAddressPostCode;
  @override
  String get deliveryAddressInstructions;
  @override
  String get deliveryId;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  OrderPaidStatus get paymentStatus;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: RestaurantAcceptedStatus.pending)
  RestaurantAcceptedStatus get restaurantAcceptanceStatus;
  @override
  bool get deliveryPartnerAccepted;
  @override
  bool get deliveryPartnerConfirmed;
  @override
  DateTime get fulfilmentSlotFrom;
  @override // "2022-09-29T10:00:00.000Z"
  DateTime get fulfilmentSlotTo;
  @override // "2022-09-29T10:00:00.000Z"
  String get publicId;
  @override
  int get tipAmount;
  @override
  int get rewardsIssued;
  @override
  bool get sentToDeliveryPartner;
  @override
  VendorDTO get vendor;
  @override
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(readValue: getFulfilmentMethodType)
  FulfilmentMethodType get fulfilmentMethod;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
