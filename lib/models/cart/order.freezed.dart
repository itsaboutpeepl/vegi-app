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
  num get total => throw _privateConstructorUsedError;
  num get subtotal => throw _privateConstructorUsedError;
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
  FulfilmentMethod get fulfilmentMethod => throw _privateConstructorUsedError;
  VendorDTO get vendor => throw _privateConstructorUsedError;
  DeliveryPartnerDTO? get deliveryPartner => throw _privateConstructorUsedError;
  Discount? get discount => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  Order? get parentOrder => throw _privateConstructorUsedError;
  List<OrderItem> get unfulfilledItems => throw _privateConstructorUsedError;
  List<TransactionItem> get transactions => throw _privateConstructorUsedError;
  num get fulfilmentCharge => throw _privateConstructorUsedError;
  num get platformFee => throw _privateConstructorUsedError;
  String get cartDiscountCode => throw _privateConstructorUsedError;
  String get cartDiscountType => throw _privateConstructorUsedError;
  num get cartDiscountAmount => throw _privateConstructorUsedError;

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
      FulfilmentMethod fulfilmentMethod,
      VendorDTO vendor,
      DeliveryPartnerDTO? deliveryPartner,
      Discount? discount,
      List<OrderItem> items,
      Order? parentOrder,
      List<OrderItem> unfulfilledItems,
      List<TransactionItem> transactions,
      num fulfilmentCharge,
      num platformFee,
      String cartDiscountCode,
      String cartDiscountType,
      num cartDiscountAmount});

  $FulfilmentMethodCopyWith<$Res> get fulfilmentMethod;
  $VendorDTOCopyWith<$Res> get vendor;
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  $DiscountCopyWith<$Res>? get discount;
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
    Object? fulfilmentMethod = null,
    Object? vendor = null,
    Object? deliveryPartner = freezed,
    Object? discount = freezed,
    Object? items = null,
    Object? parentOrder = freezed,
    Object? unfulfilledItems = null,
    Object? transactions = null,
    Object? fulfilmentCharge = null,
    Object? platformFee = null,
    Object? cartDiscountCode = null,
    Object? cartDiscountType = null,
    Object? cartDiscountAmount = null,
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
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Discount?,
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
      cartDiscountCode: null == cartDiscountCode
          ? _value.cartDiscountCode
          : cartDiscountCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartDiscountType: null == cartDiscountType
          ? _value.cartDiscountType
          : cartDiscountType // ignore: cast_nullable_to_non_nullable
              as String,
      cartDiscountAmount: null == cartDiscountAmount
          ? _value.cartDiscountAmount
          : cartDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FulfilmentMethodCopyWith<$Res> get fulfilmentMethod {
    return $FulfilmentMethodCopyWith<$Res>(_value.fulfilmentMethod, (value) {
      return _then(_value.copyWith(fulfilmentMethod: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $DiscountCopyWith<$Res>? get discount {
    if (_value.discount == null) {
      return null;
    }

    return $DiscountCopyWith<$Res>(_value.discount!, (value) {
      return _then(_value.copyWith(discount: value) as $Val);
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
      FulfilmentMethod fulfilmentMethod,
      VendorDTO vendor,
      DeliveryPartnerDTO? deliveryPartner,
      Discount? discount,
      List<OrderItem> items,
      Order? parentOrder,
      List<OrderItem> unfulfilledItems,
      List<TransactionItem> transactions,
      num fulfilmentCharge,
      num platformFee,
      String cartDiscountCode,
      String cartDiscountType,
      num cartDiscountAmount});

  @override
  $FulfilmentMethodCopyWith<$Res> get fulfilmentMethod;
  @override
  $VendorDTOCopyWith<$Res> get vendor;
  @override
  $DeliveryPartnerDTOCopyWith<$Res>? get deliveryPartner;
  @override
  $DiscountCopyWith<$Res>? get discount;
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
    Object? fulfilmentMethod = null,
    Object? vendor = null,
    Object? deliveryPartner = freezed,
    Object? discount = freezed,
    Object? items = null,
    Object? parentOrder = freezed,
    Object? unfulfilledItems = null,
    Object? transactions = null,
    Object? fulfilmentCharge = null,
    Object? platformFee = null,
    Object? cartDiscountCode = null,
    Object? cartDiscountType = null,
    Object? cartDiscountAmount = null,
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
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as VendorDTO,
      deliveryPartner: freezed == deliveryPartner
          ? _value.deliveryPartner
          : deliveryPartner // ignore: cast_nullable_to_non_nullable
              as DeliveryPartnerDTO?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Discount?,
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
      cartDiscountCode: null == cartDiscountCode
          ? _value.cartDiscountCode
          : cartDiscountCode // ignore: cast_nullable_to_non_nullable
              as String,
      cartDiscountType: null == cartDiscountType
          ? _value.cartDiscountType
          : cartDiscountType // ignore: cast_nullable_to_non_nullable
              as String,
      cartDiscountAmount: null == cartDiscountAmount
          ? _value.cartDiscountAmount
          : cartDiscountAmount // ignore: cast_nullable_to_non_nullable
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
      required this.fulfilmentMethod,
      required this.vendor,
      required this.deliveryPartner,
      this.discount = null,
      required this.items,
      this.parentOrder = null,
      this.unfulfilledItems = const [],
      this.transactions = const [],
      required this.fulfilmentCharge,
      required this.platformFee,
      this.cartDiscountCode = '',
      this.cartDiscountType = 'fixed',
      this.cartDiscountAmount = 0})
      : super._();

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final int id;
  @override
  final num total;
  @override
  final num subtotal;
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
  final FulfilmentMethod fulfilmentMethod;
  @override
  final VendorDTO vendor;
  @override
  final DeliveryPartnerDTO? deliveryPartner;
  @override
  @JsonKey()
  final Discount? discount;
  @override
  final List<OrderItem> items;
  @override
  @JsonKey()
  final Order? parentOrder;
  @override
  @JsonKey()
  final List<OrderItem> unfulfilledItems;
  @override
  @JsonKey()
  final List<TransactionItem> transactions;
  @override
  final num fulfilmentCharge;
  @override
  final num platformFee;
  @override
  @JsonKey()
  final String cartDiscountCode;
  @override
  @JsonKey()
  final String cartDiscountType;
  @override
  @JsonKey()
  final num cartDiscountAmount;

  @override
  String toString() {
    return 'Order(id: $id, total: $total, subtotal: $subtotal, orderedDateTime: $orderedDateTime, paidDateTime: $paidDateTime, refundDateTime: $refundDateTime, paymentStatus: $paymentStatus, paymentIntentId: $paymentIntentId, firebaseRegistrationToken: $firebaseRegistrationToken, deliveryName: $deliveryName, deliveryEmail: $deliveryEmail, deliveryPhoneNumber: $deliveryPhoneNumber, deliveryAddressLineOne: $deliveryAddressLineOne, deliveryAddressLineTwo: $deliveryAddressLineTwo, deliveryAddressCity: $deliveryAddressCity, deliveryAddressPostCode: $deliveryAddressPostCode, deliveryAddressLatitude: $deliveryAddressLatitude, deliveryAddressLongitude: $deliveryAddressLongitude, deliveryAddressInstructions: $deliveryAddressInstructions, deliveryId: $deliveryId, deliveryPartnerAccepted: $deliveryPartnerAccepted, deliveryPartnerConfirmed: $deliveryPartnerConfirmed, customerWalletAddress: $customerWalletAddress, publicId: $publicId, restaurantAcceptanceStatus: $restaurantAcceptanceStatus, orderAcceptanceStatus: $orderAcceptanceStatus, tipAmount: $tipAmount, rewardsIssued: $rewardsIssued, sentToDeliveryPartner: $sentToDeliveryPartner, completedFlag: $completedFlag, completedOrderFeedback: $completedOrderFeedback, deliveryPunctuality: $deliveryPunctuality, orderCondition: $orderCondition, fulfilmentSlotFrom: $fulfilmentSlotFrom, fulfilmentSlotTo: $fulfilmentSlotTo, fulfilmentMethod: $fulfilmentMethod, vendor: $vendor, deliveryPartner: $deliveryPartner, discount: $discount, items: $items, parentOrder: $parentOrder, unfulfilledItems: $unfulfilledItems, transactions: $transactions, fulfilmentCharge: $fulfilmentCharge, platformFee: $platformFee, cartDiscountCode: $cartDiscountCode, cartDiscountType: $cartDiscountType, cartDiscountAmount: $cartDiscountAmount)';
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
            (identical(other.rewardsIssued, rewardsIssued) ||
                other.rewardsIssued == rewardsIssued) &&
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
            (identical(other.discount, discount) || other.discount == discount) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.parentOrder, parentOrder) || other.parentOrder == parentOrder) &&
            const DeepCollectionEquality().equals(other.unfulfilledItems, unfulfilledItems) &&
            const DeepCollectionEquality().equals(other.transactions, transactions) &&
            (identical(other.fulfilmentCharge, fulfilmentCharge) || other.fulfilmentCharge == fulfilmentCharge) &&
            (identical(other.platformFee, platformFee) || other.platformFee == platformFee) &&
            (identical(other.cartDiscountCode, cartDiscountCode) || other.cartDiscountCode == cartDiscountCode) &&
            (identical(other.cartDiscountType, cartDiscountType) || other.cartDiscountType == cartDiscountType) &&
            (identical(other.cartDiscountAmount, cartDiscountAmount) || other.cartDiscountAmount == cartDiscountAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        total,
        subtotal,
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
        discount,
        const DeepCollectionEquality().hash(items),
        parentOrder,
        const DeepCollectionEquality().hash(unfulfilledItems),
        const DeepCollectionEquality().hash(transactions),
        fulfilmentCharge,
        platformFee,
        cartDiscountCode,
        cartDiscountType,
        cartDiscountAmount
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
      required final FulfilmentMethod fulfilmentMethod,
      required final VendorDTO vendor,
      required final DeliveryPartnerDTO? deliveryPartner,
      final Discount? discount,
      required final List<OrderItem> items,
      final Order? parentOrder,
      final List<OrderItem> unfulfilledItems,
      final List<TransactionItem> transactions,
      required final num fulfilmentCharge,
      required final num platformFee,
      final String cartDiscountCode,
      final String cartDiscountType,
      final num cartDiscountAmount}) = _$_Order;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  int get id;
  @override
  num get total;
  @override
  num get subtotal;
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
  FulfilmentMethod get fulfilmentMethod;
  @override
  VendorDTO get vendor;
  @override
  DeliveryPartnerDTO? get deliveryPartner;
  @override
  Discount? get discount;
  @override
  List<OrderItem> get items;
  @override
  Order? get parentOrder;
  @override
  List<OrderItem> get unfulfilledItems;
  @override
  List<TransactionItem> get transactions;
  @override
  num get fulfilmentCharge;
  @override
  num get platformFee;
  @override
  String get cartDiscountCode;
  @override
  String get cartDiscountType;
  @override
  num get cartDiscountAmount;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
