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

  /// DO NOT USE, USE cartTotal INSTEAD
  num get total => throw _privateConstructorUsedError;

  /// DO NOT USE, USE cartSubTotal INSTEAD
  num get subtotal => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  DateTime get orderedDateTime => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  DateTime? get paidDateTime => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  DateTime? get refundDateTime => throw _privateConstructorUsedError;
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  OrderPaidStatus get paymentStatus => throw _privateConstructorUsedError;
  String get paymentIntentId => throw _privateConstructorUsedError;
  String? get firebaseRegistrationToken => throw _privateConstructorUsedError;
  String? get deliveryName => throw _privateConstructorUsedError;
  String? get deliveryEmail => throw _privateConstructorUsedError;
  String? get deliveryPhoneNumber => throw _privateConstructorUsedError;
  String get deliveryAddressLineOne => throw _privateConstructorUsedError;
  String? get deliveryAddressLineTwo => throw _privateConstructorUsedError;
  String get deliveryAddressCity => throw _privateConstructorUsedError;
  String get deliveryAddressCountry => throw _privateConstructorUsedError;
  String get deliveryAddressCounty => throw _privateConstructorUsedError;
  String get deliveryAddressPostCode => throw _privateConstructorUsedError;
  double? get deliveryAddressLatitude => throw _privateConstructorUsedError;
  double? get deliveryAddressLongitude => throw _privateConstructorUsedError;
  String? get deliveryAddressInstructions => throw _privateConstructorUsedError;
  String? get deliveryId => throw _privateConstructorUsedError;
  bool get deliveryPartnerAccepted => throw _privateConstructorUsedError;
  bool get deliveryPartnerConfirmed => throw _privateConstructorUsedError;
  String get customerWalletAddress => throw _privateConstructorUsedError;
  String get publicId => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
  RestaurantAcceptanceStatus get restaurantAcceptanceStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
  OrderAcceptanceStatus get orderAcceptanceStatus =>
      throw _privateConstructorUsedError;
  int get tipAmount => throw _privateConstructorUsedError;
  double get rewardsIssued => throw _privateConstructorUsedError;
  bool get sentToDeliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
  OrderCompletedFlag get completedFlag => throw _privateConstructorUsedError;
  String? get completedOrderFeedback => throw _privateConstructorUsedError;
  int? get deliveryPunctuality => throw _privateConstructorUsedError;
  int? get orderCondition => throw _privateConstructorUsedError;
  DateTime get fulfilmentSlotFrom =>
      throw _privateConstructorUsedError; // "2022-09-29T10:00:00.000Z"
  DateTime get fulfilmentSlotTo =>
      throw _privateConstructorUsedError; // "2022-09-29T10:00:00.000Z"
  @JsonKey(fromJson: fromJsonFulfilmentMethod)
  FulfilmentMethod? get fulfilmentMethod => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDiscountList)
  List<Discount> get discounts => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonOrderItemList)
  List<OrderItem> get items => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonOrder)
  Order? get parentOrder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonOrderItemList)
  List<OrderItem> get unfulfilledItems => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonTransactionItemList)
  List<TransactionItem> get transactions => throw _privateConstructorUsedError;
  num get fulfilmentCharge => throw _privateConstructorUsedError;
  num get platformFee => throw _privateConstructorUsedError;

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
      num total,
      num subtotal,
      Currency currency,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          DateTime orderedDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          DateTime? paidDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          DateTime? refundDateTime,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          OrderPaidStatus paymentStatus,
      String paymentIntentId,
      String? firebaseRegistrationToken,
      String? deliveryName,
      String? deliveryEmail,
      String? deliveryPhoneNumber,
      String deliveryAddressLineOne,
      String? deliveryAddressLineTwo,
      String deliveryAddressCity,
      String deliveryAddressCountry,
      String deliveryAddressCounty,
      String deliveryAddressPostCode,
      double? deliveryAddressLatitude,
      double? deliveryAddressLongitude,
      String? deliveryAddressInstructions,
      String? deliveryId,
      bool deliveryPartnerAccepted,
      bool deliveryPartnerConfirmed,
      String customerWalletAddress,
      String publicId,
      @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
          RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
          OrderAcceptanceStatus orderAcceptanceStatus,
      int tipAmount,
      double rewardsIssued,
      bool sentToDeliveryPartner,
      @JsonKey(fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
          OrderCompletedFlag completedFlag,
      String? completedOrderFeedback,
      int? deliveryPunctuality,
      int? orderCondition,
      DateTime fulfilmentSlotFrom,
      DateTime fulfilmentSlotTo,
      @JsonKey(fromJson: fromJsonFulfilmentMethod)
          FulfilmentMethod? fulfilmentMethod,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonDiscountList)
          List<Discount> discounts,
      @JsonKey(fromJson: fromJsonOrderItemList)
          List<OrderItem> items,
      @JsonKey(fromJson: fromJsonOrder)
          Order? parentOrder,
      @JsonKey(fromJson: fromJsonOrderItemList)
          List<OrderItem> unfulfilledItems,
      @JsonKey(fromJson: fromJsonTransactionItemList)
          List<TransactionItem> transactions,
      num fulfilmentCharge,
      num platformFee});

  $FulfilmentMethodCopyWith<$Res>? get fulfilmentMethod;
  $VendorDTOCopyWith<$Res>? get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $OrderCopyWith<$Res>? get parentOrder;
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
    Object? total = null,
    Object? subtotal = null,
    Object? currency = null,
    Object? orderedDateTime = null,
    Object? paidDateTime = freezed,
    Object? refundDateTime = freezed,
    Object? paymentStatus = null,
    Object? paymentIntentId = null,
    Object? firebaseRegistrationToken = freezed,
    Object? deliveryName = freezed,
    Object? deliveryEmail = freezed,
    Object? deliveryPhoneNumber = freezed,
    Object? deliveryAddressLineOne = null,
    Object? deliveryAddressLineTwo = freezed,
    Object? deliveryAddressCity = null,
    Object? deliveryAddressCountry = null,
    Object? deliveryAddressCounty = null,
    Object? deliveryAddressPostCode = null,
    Object? deliveryAddressLatitude = freezed,
    Object? deliveryAddressLongitude = freezed,
    Object? deliveryAddressInstructions = freezed,
    Object? deliveryId = freezed,
    Object? deliveryPartnerAccepted = null,
    Object? deliveryPartnerConfirmed = null,
    Object? customerWalletAddress = null,
    Object? publicId = null,
    Object? restaurantAcceptanceStatus = null,
    Object? orderAcceptanceStatus = null,
    Object? tipAmount = null,
    Object? rewardsIssued = null,
    Object? sentToDeliveryPartner = null,
    Object? completedFlag = null,
    Object? completedOrderFeedback = freezed,
    Object? deliveryPunctuality = freezed,
    Object? orderCondition = freezed,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? fulfilmentMethod = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? discounts = null,
    Object? items = null,
    Object? parentOrder = freezed,
    Object? unfulfilledItems = null,
    Object? transactions = null,
    Object? fulfilmentCharge = null,
    Object? platformFee = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
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
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
      paymentIntentId: null == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseRegistrationToken: freezed == firebaseRegistrationToken
          ? _value.firebaseRegistrationToken
          : firebaseRegistrationToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      deliveryAddressLineTwo: freezed == deliveryAddressLineTwo
          ? _value.deliveryAddressLineTwo
          : deliveryAddressLineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCountry: null == deliveryAddressCountry
          ? _value.deliveryAddressCountry
          : deliveryAddressCountry // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCounty: null == deliveryAddressCounty
          ? _value.deliveryAddressCounty
          : deliveryAddressCounty // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressPostCode: null == deliveryAddressPostCode
          ? _value.deliveryAddressPostCode
          : deliveryAddressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressLatitude: freezed == deliveryAddressLatitude
          ? _value.deliveryAddressLatitude
          : deliveryAddressLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryAddressLongitude: freezed == deliveryAddressLongitude
          ? _value.deliveryAddressLongitude
          : deliveryAddressLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryAddressInstructions: freezed == deliveryAddressInstructions
          ? _value.deliveryAddressInstructions
          : deliveryAddressInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPartnerAccepted: null == deliveryPartnerAccepted
          ? _value.deliveryPartnerAccepted
          : deliveryPartnerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPartnerConfirmed: null == deliveryPartnerConfirmed
          ? _value.deliveryPartnerConfirmed
          : deliveryPartnerConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      customerWalletAddress: null == customerWalletAddress
          ? _value.customerWalletAddress
          : customerWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptanceStatus,
      orderAcceptanceStatus: null == orderAcceptanceStatus
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsIssued: null == rewardsIssued
          ? _value.rewardsIssued
          : rewardsIssued // ignore: cast_nullable_to_non_nullable
              as double,
      sentToDeliveryPartner: null == sentToDeliveryPartner
          ? _value.sentToDeliveryPartner
          : sentToDeliveryPartner // ignore: cast_nullable_to_non_nullable
              as bool,
      completedFlag: null == completedFlag
          ? _value.completedFlag
          : completedFlag // ignore: cast_nullable_to_non_nullable
              as OrderCompletedFlag,
      completedOrderFeedback: freezed == completedOrderFeedback
          ? _value.completedOrderFeedback
          : completedOrderFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPunctuality: freezed == deliveryPunctuality
          ? _value.deliveryPunctuality
          : deliveryPunctuality // ignore: cast_nullable_to_non_nullable
              as int?,
      orderCondition: freezed == orderCondition
          ? _value.orderCondition
          : orderCondition // ignore: cast_nullable_to_non_nullable
              as int?,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentMethod: freezed == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      discounts: null == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<Discount>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      parentOrder: freezed == parentOrder
          ? _value.parentOrder
          : parentOrder // ignore: cast_nullable_to_non_nullable
              as Order?,
      unfulfilledItems: null == unfulfilledItems
          ? _value.unfulfilledItems
          : unfulfilledItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      fulfilmentCharge: null == fulfilmentCharge
          ? _value.fulfilmentCharge
          : fulfilmentCharge // ignore: cast_nullable_to_non_nullable
              as num,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FulfilmentMethodCopyWith<$Res>? get fulfilmentMethod {
    if (_value.fulfilmentMethod == null) {
      return null;
    }

    return $FulfilmentMethodCopyWith<$Res>(_value.fulfilmentMethod!, (value) {
      return _then(_value.copyWith(fulfilmentMethod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VendorDTOCopyWith<$Res>? get vendor {
    if (_value.vendor == null) {
      return null;
    }

    return $VendorDTOCopyWith<$Res>(_value.vendor!, (value) {
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

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res>? get parentOrder {
    if (_value.parentOrder == null) {
      return null;
    }

    return $OrderCopyWith<$Res>(_value.parentOrder!, (value) {
      return _then(_value.copyWith(parentOrder: value) as $Val);
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
      num total,
      num subtotal,
      Currency currency,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          DateTime orderedDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          DateTime? paidDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          DateTime? refundDateTime,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          OrderPaidStatus paymentStatus,
      String paymentIntentId,
      String? firebaseRegistrationToken,
      String? deliveryName,
      String? deliveryEmail,
      String? deliveryPhoneNumber,
      String deliveryAddressLineOne,
      String? deliveryAddressLineTwo,
      String deliveryAddressCity,
      String deliveryAddressCountry,
      String deliveryAddressCounty,
      String deliveryAddressPostCode,
      double? deliveryAddressLatitude,
      double? deliveryAddressLongitude,
      String? deliveryAddressInstructions,
      String? deliveryId,
      bool deliveryPartnerAccepted,
      bool deliveryPartnerConfirmed,
      String customerWalletAddress,
      String publicId,
      @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
          RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
          OrderAcceptanceStatus orderAcceptanceStatus,
      int tipAmount,
      double rewardsIssued,
      bool sentToDeliveryPartner,
      @JsonKey(fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
          OrderCompletedFlag completedFlag,
      String? completedOrderFeedback,
      int? deliveryPunctuality,
      int? orderCondition,
      DateTime fulfilmentSlotFrom,
      DateTime fulfilmentSlotTo,
      @JsonKey(fromJson: fromJsonFulfilmentMethod)
          FulfilmentMethod? fulfilmentMethod,
      @JsonKey(fromJson: fromJsonVendorDTO)
          VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonDiscountList)
          List<Discount> discounts,
      @JsonKey(fromJson: fromJsonOrderItemList)
          List<OrderItem> items,
      @JsonKey(fromJson: fromJsonOrder)
          Order? parentOrder,
      @JsonKey(fromJson: fromJsonOrderItemList)
          List<OrderItem> unfulfilledItems,
      @JsonKey(fromJson: fromJsonTransactionItemList)
          List<TransactionItem> transactions,
      num fulfilmentCharge,
      num platformFee});

  @override
  $FulfilmentMethodCopyWith<$Res>? get fulfilmentMethod;
  @override
  $VendorDTOCopyWith<$Res>? get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $OrderCopyWith<$Res>? get parentOrder;
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
    Object? total = null,
    Object? subtotal = null,
    Object? currency = null,
    Object? orderedDateTime = null,
    Object? paidDateTime = freezed,
    Object? refundDateTime = freezed,
    Object? paymentStatus = null,
    Object? paymentIntentId = null,
    Object? firebaseRegistrationToken = freezed,
    Object? deliveryName = freezed,
    Object? deliveryEmail = freezed,
    Object? deliveryPhoneNumber = freezed,
    Object? deliveryAddressLineOne = null,
    Object? deliveryAddressLineTwo = freezed,
    Object? deliveryAddressCity = null,
    Object? deliveryAddressCountry = null,
    Object? deliveryAddressCounty = null,
    Object? deliveryAddressPostCode = null,
    Object? deliveryAddressLatitude = freezed,
    Object? deliveryAddressLongitude = freezed,
    Object? deliveryAddressInstructions = freezed,
    Object? deliveryId = freezed,
    Object? deliveryPartnerAccepted = null,
    Object? deliveryPartnerConfirmed = null,
    Object? customerWalletAddress = null,
    Object? publicId = null,
    Object? restaurantAcceptanceStatus = null,
    Object? orderAcceptanceStatus = null,
    Object? tipAmount = null,
    Object? rewardsIssued = null,
    Object? sentToDeliveryPartner = null,
    Object? completedFlag = null,
    Object? completedOrderFeedback = freezed,
    Object? deliveryPunctuality = freezed,
    Object? orderCondition = freezed,
    Object? fulfilmentSlotFrom = null,
    Object? fulfilmentSlotTo = null,
    Object? fulfilmentMethod = freezed,
    Object? vendor = freezed,
    Object? deliveryPartner = freezed,
    Object? discounts = null,
    Object? items = null,
    Object? parentOrder = freezed,
    Object? unfulfilledItems = null,
    Object? transactions = null,
    Object? fulfilmentCharge = null,
    Object? platformFee = null,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
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
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as OrderPaidStatus,
      paymentIntentId: null == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseRegistrationToken: freezed == firebaseRegistrationToken
          ? _value.firebaseRegistrationToken
          : firebaseRegistrationToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      deliveryAddressLineTwo: freezed == deliveryAddressLineTwo
          ? _value.deliveryAddressLineTwo
          : deliveryAddressLineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCountry: null == deliveryAddressCountry
          ? _value.deliveryAddressCountry
          : deliveryAddressCountry // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCounty: null == deliveryAddressCounty
          ? _value.deliveryAddressCounty
          : deliveryAddressCounty // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressPostCode: null == deliveryAddressPostCode
          ? _value.deliveryAddressPostCode
          : deliveryAddressPostCode // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressLatitude: freezed == deliveryAddressLatitude
          ? _value.deliveryAddressLatitude
          : deliveryAddressLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryAddressLongitude: freezed == deliveryAddressLongitude
          ? _value.deliveryAddressLongitude
          : deliveryAddressLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryAddressInstructions: freezed == deliveryAddressInstructions
          ? _value.deliveryAddressInstructions
          : deliveryAddressInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPartnerAccepted: null == deliveryPartnerAccepted
          ? _value.deliveryPartnerAccepted
          : deliveryPartnerAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryPartnerConfirmed: null == deliveryPartnerConfirmed
          ? _value.deliveryPartnerConfirmed
          : deliveryPartnerConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      customerWalletAddress: null == customerWalletAddress
          ? _value.customerWalletAddress
          : customerWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      publicId: null == publicId
          ? _value.publicId
          : publicId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAcceptanceStatus: null == restaurantAcceptanceStatus
          ? _value.restaurantAcceptanceStatus
          : restaurantAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as RestaurantAcceptanceStatus,
      orderAcceptanceStatus: null == orderAcceptanceStatus
          ? _value.orderAcceptanceStatus
          : orderAcceptanceStatus // ignore: cast_nullable_to_non_nullable
              as OrderAcceptanceStatus,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      rewardsIssued: null == rewardsIssued
          ? _value.rewardsIssued
          : rewardsIssued // ignore: cast_nullable_to_non_nullable
              as double,
      sentToDeliveryPartner: null == sentToDeliveryPartner
          ? _value.sentToDeliveryPartner
          : sentToDeliveryPartner // ignore: cast_nullable_to_non_nullable
              as bool,
      completedFlag: null == completedFlag
          ? _value.completedFlag
          : completedFlag // ignore: cast_nullable_to_non_nullable
              as OrderCompletedFlag,
      completedOrderFeedback: freezed == completedOrderFeedback
          ? _value.completedOrderFeedback
          : completedOrderFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryPunctuality: freezed == deliveryPunctuality
          ? _value.deliveryPunctuality
          : deliveryPunctuality // ignore: cast_nullable_to_non_nullable
              as int?,
      orderCondition: freezed == orderCondition
          ? _value.orderCondition
          : orderCondition // ignore: cast_nullable_to_non_nullable
              as int?,
      fulfilmentSlotFrom: null == fulfilmentSlotFrom
          ? _value.fulfilmentSlotFrom
          : fulfilmentSlotFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentSlotTo: null == fulfilmentSlotTo
          ? _value.fulfilmentSlotTo
          : fulfilmentSlotTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fulfilmentMethod: freezed == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod?,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO?,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      discounts: null == discounts
          ? _value.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<Discount>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      parentOrder: freezed == parentOrder
          ? _value.parentOrder
          : parentOrder // ignore: cast_nullable_to_non_nullable
              as Order?,
      unfulfilledItems: null == unfulfilledItems
          ? _value.unfulfilledItems
          : unfulfilledItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
      fulfilmentCharge: null == fulfilmentCharge
          ? _value.fulfilmentCharge
          : fulfilmentCharge // ignore: cast_nullable_to_non_nullable
              as num,
      platformFee: null == platformFee
          ? _value.platformFee
          : platformFee // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Order extends _Order {
  _$_Order(
      {required this.id,
      required this.total,
      required this.subtotal,
      this.currency = Currency.GBPx,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          required this.orderedDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          this.paidDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          this.refundDateTime,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          required this.paymentStatus,
      required this.paymentIntentId,
      required this.firebaseRegistrationToken,
      required this.deliveryName,
      required this.deliveryEmail,
      required this.deliveryPhoneNumber,
      required this.deliveryAddressLineOne,
      required this.deliveryAddressLineTwo,
      required this.deliveryAddressCity,
      this.deliveryAddressCountry = 'GB',
      this.deliveryAddressCounty = '',
      required this.deliveryAddressPostCode,
      required this.deliveryAddressLatitude,
      required this.deliveryAddressLongitude,
      required this.deliveryAddressInstructions,
      required this.deliveryId,
      required this.deliveryPartnerAccepted,
      required this.deliveryPartnerConfirmed,
      required this.customerWalletAddress,
      required this.publicId,
      @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
          required this.restaurantAcceptanceStatus,
      @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
          required this.orderAcceptanceStatus,
      required this.tipAmount,
      required this.rewardsIssued,
      required this.sentToDeliveryPartner,
      @JsonKey(fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
          required this.completedFlag,
      required this.completedOrderFeedback,
      required this.deliveryPunctuality,
      required this.orderCondition,
      required this.fulfilmentSlotFrom,
      required this.fulfilmentSlotTo,
      @JsonKey(fromJson: fromJsonFulfilmentMethod)
          required this.fulfilmentMethod,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required this.vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required this.deliveryPartner,
      @JsonKey(fromJson: fromJsonDiscountList)
          this.discounts = const [],
      @JsonKey(fromJson: fromJsonOrderItemList)
          required this.items,
      @JsonKey(fromJson: fromJsonOrder)
          this.parentOrder = null,
      @JsonKey(fromJson: fromJsonOrderItemList)
          this.unfulfilledItems = const [],
      @JsonKey(fromJson: fromJsonTransactionItemList)
          this.transactions = const [],
      required this.fulfilmentCharge,
      required this.platformFee})
      : super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final int id;

  /// DO NOT USE, USE cartTotal INSTEAD
  @override
  final num total;

  /// DO NOT USE, USE cartSubTotal INSTEAD
  @override
  final num subtotal;
  @override
  @JsonKey()
  final Currency currency;
  @override
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  final DateTime orderedDateTime;
  @override
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  final DateTime? paidDateTime;
  @override
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  final DateTime? refundDateTime;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  final OrderPaidStatus paymentStatus;
  @override
  final String paymentIntentId;
  @override
  final String? firebaseRegistrationToken;
  @override
  final String? deliveryName;
  @override
  final String? deliveryEmail;
  @override
  final String? deliveryPhoneNumber;
  @override
  final String deliveryAddressLineOne;
  @override
  final String? deliveryAddressLineTwo;
  @override
  final String deliveryAddressCity;
  @override
  @JsonKey()
  final String deliveryAddressCountry;
  @override
  @JsonKey()
  final String deliveryAddressCounty;
  @override
  final String deliveryAddressPostCode;
  @override
  final double? deliveryAddressLatitude;
  @override
  final double? deliveryAddressLongitude;
  @override
  final String? deliveryAddressInstructions;
  @override
  final String? deliveryId;
  @override
  final bool deliveryPartnerAccepted;
  @override
  final bool deliveryPartnerConfirmed;
  @override
  final String customerWalletAddress;
  @override
  final String publicId;
  @override
  @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
  final RestaurantAcceptanceStatus restaurantAcceptanceStatus;
  @override
  @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
  final OrderAcceptanceStatus orderAcceptanceStatus;
  @override
  final int tipAmount;
  @override
  final double rewardsIssued;
  @override
  final bool sentToDeliveryPartner;
  @override
  @JsonKey(
      fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
  final OrderCompletedFlag completedFlag;
  @override
  final String? completedOrderFeedback;
  @override
  final int? deliveryPunctuality;
  @override
  final int? orderCondition;
  @override
  final DateTime fulfilmentSlotFrom;
// "2022-09-29T10:00:00.000Z"
  @override
  final DateTime fulfilmentSlotTo;
// "2022-09-29T10:00:00.000Z"
  @override
  @JsonKey(fromJson: fromJsonFulfilmentMethod)
  final FulfilmentMethod? fulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  final VendorDTO? vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonDiscountList)
  final List<Discount> discounts;
  @override
  @JsonKey(fromJson: fromJsonOrderItemList)
  final List<OrderItem> items;
  @override
  @JsonKey(fromJson: fromJsonOrder)
  final Order? parentOrder;
  @override
  @JsonKey(fromJson: fromJsonOrderItemList)
  final List<OrderItem> unfulfilledItems;
  @override
  @JsonKey(fromJson: fromJsonTransactionItemList)
  final List<TransactionItem> transactions;
  @override
  final num fulfilmentCharge;
  @override
  final num platformFee;

  @override
  String toString() {
    return 'Order(id: $id, total: $total, subtotal: $subtotal, currency: $currency, orderedDateTime: $orderedDateTime, paidDateTime: $paidDateTime, refundDateTime: $refundDateTime, paymentStatus: $paymentStatus, paymentIntentId: $paymentIntentId, firebaseRegistrationToken: $firebaseRegistrationToken, deliveryName: $deliveryName, deliveryEmail: $deliveryEmail, deliveryPhoneNumber: $deliveryPhoneNumber, deliveryAddressLineOne: $deliveryAddressLineOne, deliveryAddressLineTwo: $deliveryAddressLineTwo, deliveryAddressCity: $deliveryAddressCity, deliveryAddressCountry: $deliveryAddressCountry, deliveryAddressCounty: $deliveryAddressCounty, deliveryAddressPostCode: $deliveryAddressPostCode, deliveryAddressLatitude: $deliveryAddressLatitude, deliveryAddressLongitude: $deliveryAddressLongitude, deliveryAddressInstructions: $deliveryAddressInstructions, deliveryId: $deliveryId, deliveryPartnerAccepted: $deliveryPartnerAccepted, deliveryPartnerConfirmed: $deliveryPartnerConfirmed, customerWalletAddress: $customerWalletAddress, publicId: $publicId, restaurantAcceptanceStatus: $restaurantAcceptanceStatus, orderAcceptanceStatus: $orderAcceptanceStatus, tipAmount: $tipAmount, rewardsIssued: $rewardsIssued, sentToDeliveryPartner: $sentToDeliveryPartner, completedFlag: $completedFlag, completedOrderFeedback: $completedOrderFeedback, deliveryPunctuality: $deliveryPunctuality, orderCondition: $orderCondition, fulfilmentSlotFrom: $fulfilmentSlotFrom, fulfilmentSlotTo: $fulfilmentSlotTo, fulfilmentMethod: $fulfilmentMethod, vendor: $vendor, deliveryPartner: $deliveryPartner, discounts: $discounts, items: $items, parentOrder: $parentOrder, unfulfilledItems: $unfulfilledItems, transactions: $transactions, fulfilmentCharge: $fulfilmentCharge, platformFee: $platformFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.orderedDateTime, orderedDateTime) ||
                other.orderedDateTime == orderedDateTime) &&
            (identical(other.paidDateTime, paidDateTime) ||
                other.paidDateTime == paidDateTime) &&
            (identical(other.refundDateTime, refundDateTime) ||
                other.refundDateTime == refundDateTime) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.firebaseRegistrationToken, firebaseRegistrationToken) ||
                other.firebaseRegistrationToken == firebaseRegistrationToken) &&
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
            (identical(other.deliveryAddressCountry, deliveryAddressCountry) ||
                other.deliveryAddressCountry == deliveryAddressCountry) &&
            (identical(other.deliveryAddressCounty, deliveryAddressCounty) ||
                other.deliveryAddressCounty == deliveryAddressCounty) &&
            (identical(other.deliveryAddressPostCode, deliveryAddressPostCode) ||
                other.deliveryAddressPostCode == deliveryAddressPostCode) &&
            (identical(other.deliveryAddressLatitude, deliveryAddressLatitude) ||
                other.deliveryAddressLatitude == deliveryAddressLatitude) &&
            (identical(other.deliveryAddressLongitude, deliveryAddressLongitude) ||
                other.deliveryAddressLongitude == deliveryAddressLongitude) &&
            (identical(other.deliveryAddressInstructions, deliveryAddressInstructions) ||
                other.deliveryAddressInstructions ==
                    deliveryAddressInstructions) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId) &&
            (identical(other.deliveryPartnerAccepted, deliveryPartnerAccepted) ||
                other.deliveryPartnerAccepted == deliveryPartnerAccepted) &&
            (identical(other.deliveryPartnerConfirmed, deliveryPartnerConfirmed) ||
                other.deliveryPartnerConfirmed == deliveryPartnerConfirmed) &&
            (identical(other.customerWalletAddress, customerWalletAddress) ||
                other.customerWalletAddress == customerWalletAddress) &&
            (identical(other.publicId, publicId) ||
                other.publicId == publicId) &&
            (identical(other.restaurantAcceptanceStatus, restaurantAcceptanceStatus) ||
                other.restaurantAcceptanceStatus ==
                    restaurantAcceptanceStatus) &&
            (identical(other.orderAcceptanceStatus, orderAcceptanceStatus) ||
                other.orderAcceptanceStatus == orderAcceptanceStatus) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount) &&
            (identical(other.rewardsIssued, rewardsIssued) || other.rewardsIssued == rewardsIssued) &&
            (identical(other.sentToDeliveryPartner, sentToDeliveryPartner) || other.sentToDeliveryPartner == sentToDeliveryPartner) &&
            (identical(other.completedFlag, completedFlag) || other.completedFlag == completedFlag) &&
            (identical(other.completedOrderFeedback, completedOrderFeedback) || other.completedOrderFeedback == completedOrderFeedback) &&
            (identical(other.deliveryPunctuality, deliveryPunctuality) || other.deliveryPunctuality == deliveryPunctuality) &&
            (identical(other.orderCondition, orderCondition) || other.orderCondition == orderCondition) &&
            (identical(other.fulfilmentSlotFrom, fulfilmentSlotFrom) || other.fulfilmentSlotFrom == fulfilmentSlotFrom) &&
            (identical(other.fulfilmentSlotTo, fulfilmentSlotTo) || other.fulfilmentSlotTo == fulfilmentSlotTo) &&
            (identical(other.fulfilmentMethod, fulfilmentMethod) || other.fulfilmentMethod == fulfilmentMethod) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.deliveryPartner, deliveryPartner) || other.deliveryPartner == deliveryPartner) &&
            const DeepCollectionEquality().equals(other.discounts, discounts) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.parentOrder, parentOrder) || other.parentOrder == parentOrder) &&
            const DeepCollectionEquality().equals(other.unfulfilledItems, unfulfilledItems) &&
            const DeepCollectionEquality().equals(other.transactions, transactions) &&
            (identical(other.fulfilmentCharge, fulfilmentCharge) || other.fulfilmentCharge == fulfilmentCharge) &&
            (identical(other.platformFee, platformFee) || other.platformFee == platformFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        total,
        subtotal,
        currency,
        orderedDateTime,
        paidDateTime,
        refundDateTime,
        paymentStatus,
        paymentIntentId,
        firebaseRegistrationToken,
        deliveryName,
        deliveryEmail,
        deliveryPhoneNumber,
        deliveryAddressLineOne,
        deliveryAddressLineTwo,
        deliveryAddressCity,
        deliveryAddressCountry,
        deliveryAddressCounty,
        deliveryAddressPostCode,
        deliveryAddressLatitude,
        deliveryAddressLongitude,
        deliveryAddressInstructions,
        deliveryId,
        deliveryPartnerAccepted,
        deliveryPartnerConfirmed,
        customerWalletAddress,
        publicId,
        restaurantAcceptanceStatus,
        orderAcceptanceStatus,
        tipAmount,
        rewardsIssued,
        sentToDeliveryPartner,
        completedFlag,
        completedOrderFeedback,
        deliveryPunctuality,
        orderCondition,
        fulfilmentSlotFrom,
        fulfilmentSlotTo,
        fulfilmentMethod,
        vendor,
        deliveryPartner,
        const DeepCollectionEquality().hash(discounts),
        const DeepCollectionEquality().hash(items),
        parentOrder,
        const DeepCollectionEquality().hash(unfulfilledItems),
        const DeepCollectionEquality().hash(transactions),
        fulfilmentCharge,
        platformFee
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
      required final num total,
      required final num subtotal,
      final Currency currency,
      @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
          required final DateTime orderedDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          final DateTime? paidDateTime,
      @JsonKey(fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
          final DateTime? refundDateTime,
      @JsonEnum()
      @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
          required final OrderPaidStatus paymentStatus,
      required final String paymentIntentId,
      required final String? firebaseRegistrationToken,
      required final String? deliveryName,
      required final String? deliveryEmail,
      required final String? deliveryPhoneNumber,
      required final String deliveryAddressLineOne,
      required final String? deliveryAddressLineTwo,
      required final String deliveryAddressCity,
      final String deliveryAddressCountry,
      final String deliveryAddressCounty,
      required final String deliveryAddressPostCode,
      required final double? deliveryAddressLatitude,
      required final double? deliveryAddressLongitude,
      required final String? deliveryAddressInstructions,
      required final String? deliveryId,
      required final bool deliveryPartnerAccepted,
      required final bool deliveryPartnerConfirmed,
      required final String customerWalletAddress,
      required final String publicId,
      @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
          required final RestaurantAcceptanceStatus restaurantAcceptanceStatus,
      @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
          required final OrderAcceptanceStatus orderAcceptanceStatus,
      required final int tipAmount,
      required final double rewardsIssued,
      required final bool sentToDeliveryPartner,
      @JsonKey(fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
          required final OrderCompletedFlag completedFlag,
      required final String? completedOrderFeedback,
      required final int? deliveryPunctuality,
      required final int? orderCondition,
      required final DateTime fulfilmentSlotFrom,
      required final DateTime fulfilmentSlotTo,
      @JsonKey(fromJson: fromJsonFulfilmentMethod)
          required final FulfilmentMethod? fulfilmentMethod,
      @JsonKey(fromJson: fromJsonVendorDTO)
          required final VendorDTO? vendor,
      @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
          required final DeliveryPartnerDTO? deliveryPartner,
      @JsonKey(fromJson: fromJsonDiscountList)
          final List<Discount> discounts,
      @JsonKey(fromJson: fromJsonOrderItemList)
          required final List<OrderItem> items,
      @JsonKey(fromJson: fromJsonOrder)
          final Order? parentOrder,
      @JsonKey(fromJson: fromJsonOrderItemList)
          final List<OrderItem> unfulfilledItems,
      @JsonKey(fromJson: fromJsonTransactionItemList)
          final List<TransactionItem> transactions,
      required final num fulfilmentCharge,
      required final num platformFee}) = _$_Order;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int get id;
  @override

  /// DO NOT USE, USE cartTotal INSTEAD
  num get total;
  @override

  /// DO NOT USE, USE cartSubTotal INSTEAD
  num get subtotal;
  @override
  Currency get currency;
  @override
  @JsonKey(fromJson: jsonToTimeStamp, toJson: timeStampToJsonInt)
  DateTime get orderedDateTime;
  @override
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  DateTime? get paidDateTime;
  @override
  @JsonKey(
      fromJson: jsonToTimeStampNullable, toJson: timeStampToJsonIntNullable)
  DateTime? get refundDateTime;
  @override
  @JsonEnum()
  @JsonKey(unknownEnumValue: OrderPaidStatus.unpaid)
  OrderPaidStatus get paymentStatus;
  @override
  String get paymentIntentId;
  @override
  String? get firebaseRegistrationToken;
  @override
  String? get deliveryName;
  @override
  String? get deliveryEmail;
  @override
  String? get deliveryPhoneNumber;
  @override
  String get deliveryAddressLineOne;
  @override
  String? get deliveryAddressLineTwo;
  @override
  String get deliveryAddressCity;
  @override
  String get deliveryAddressCountry;
  @override
  String get deliveryAddressCounty;
  @override
  String get deliveryAddressPostCode;
  @override
  double? get deliveryAddressLatitude;
  @override
  double? get deliveryAddressLongitude;
  @override
  String? get deliveryAddressInstructions;
  @override
  String? get deliveryId;
  @override
  bool get deliveryPartnerAccepted;
  @override
  bool get deliveryPartnerConfirmed;
  @override
  String get customerWalletAddress;
  @override
  String get publicId;
  @override
  @JsonKey(unknownEnumValue: RestaurantAcceptanceStatus.pending)
  RestaurantAcceptanceStatus get restaurantAcceptanceStatus;
  @override
  @JsonKey(unknownEnumValue: OrderAcceptanceStatus.pending)
  OrderAcceptanceStatus get orderAcceptanceStatus;
  @override
  int get tipAmount;
  @override
  double get rewardsIssued;
  @override
  bool get sentToDeliveryPartner;
  @override
  @JsonKey(
      fromJson: orderCompletedFlagFromJson, toJson: orderCompletedFlagToJson)
  OrderCompletedFlag get completedFlag;
  @override
  String? get completedOrderFeedback;
  @override
  int? get deliveryPunctuality;
  @override
  int? get orderCondition;
  @override
  DateTime get fulfilmentSlotFrom;
  @override // "2022-09-29T10:00:00.000Z"
  DateTime get fulfilmentSlotTo;
  @override // "2022-09-29T10:00:00.000Z"
  @JsonKey(fromJson: fromJsonFulfilmentMethod)
  FulfilmentMethod? get fulfilmentMethod;
  @override
  @JsonKey(fromJson: fromJsonVendorDTO)
  VendorDTO? get vendor;
  @override
  @JsonKey(fromJson: fromJsonDeliveryPartnerDTO)
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  @JsonKey(fromJson: fromJsonDiscountList)
  List<Discount> get discounts;
  @override
  @JsonKey(fromJson: fromJsonOrderItemList)
  List<OrderItem> get items;
  @override
  @JsonKey(fromJson: fromJsonOrder)
  Order? get parentOrder;
  @override
  @JsonKey(fromJson: fromJsonOrderItemList)
  List<OrderItem> get unfulfilledItems;
  @override
  @JsonKey(fromJson: fromJsonTransactionItemList)
  List<TransactionItem> get transactions;
  @override
  num get fulfilmentCharge;
  @override
  num get platformFee;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
