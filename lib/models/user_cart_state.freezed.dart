// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCartState _$UserCartStateFromJson(Map<String, dynamic> json) {
  return _UserCartState.fromJson(json);
}

/// @nodoc
mixin _$UserCartState {
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  int get cartSubTotal => throw _privateConstructorUsedError;
  int get cartTax => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  List<TimeSlot> get deliverySlots => throw _privateConstructorUsedError;
  List<TimeSlot> get collectionSlots => throw _privateConstructorUsedError;
  DeliveryAddresses? get selectedDeliveryAddress =>
      throw _privateConstructorUsedError;
  TimeSlot? get selectedTimeSlot => throw _privateConstructorUsedError;
  int get selectedTipAmount => throw _privateConstructorUsedError;
  String get discountCode => throw _privateConstructorUsedError;
  String get paymentIntentID => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  bool get payButtonLoading => throw _privateConstructorUsedError;
  bool get transferringTokens => throw _privateConstructorUsedError;
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  bool get confirmedPayment => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantID => throw _privateConstructorUsedError;
  DeliveryAddresses? get restaurantAddress =>
      throw _privateConstructorUsedError;
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  FulfilmentMethodType get fulfilmentMethod =>
      throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;
  int get restaurantMinimumOrder => throw _privateConstructorUsedError;
  int get restaurantPlatformFee => throw _privateConstructorUsedError;
  String get deliveryInstructions => throw _privateConstructorUsedError;
  PaymentMethod? get selectedPaymentMethod =>
      throw _privateConstructorUsedError;
  List<String> get fulfilmentPostalDistricts =>
      throw _privateConstructorUsedError;
  List<DateTime> get eligibleOrderDates => throw _privateConstructorUsedError;
  TimeSlot? get nextCollectionSlot => throw _privateConstructorUsedError;
  TimeSlot? get nextDeliverySlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCartStateCopyWith<UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCartStateCopyWith<$Res> {
  factory $UserCartStateCopyWith(
          UserCartState value, $Res Function(UserCartState) then) =
      _$UserCartStateCopyWithImpl<$Res, UserCartState>;
  @useResult
  $Res call(
      {List<CartItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed,
      List<TimeSlot> deliverySlots,
      List<TimeSlot> collectionSlots,
      DeliveryAddresses? selectedDeliveryAddress,
      TimeSlot? selectedTimeSlot,
      int selectedTipAmount,
      String discountCode,
      String paymentIntentID,
      String orderID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool payButtonLoading,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      DeliveryAddresses? restaurantAddress,
      String restaurantWalletAddress,
      FulfilmentMethodType fulfilmentMethod,
      bool isDelivery,
      int restaurantMinimumOrder,
      int restaurantPlatformFee,
      String deliveryInstructions,
      PaymentMethod? selectedPaymentMethod,
      List<String> fulfilmentPostalDistricts,
      List<DateTime> eligibleOrderDates,
      TimeSlot? nextCollectionSlot,
      TimeSlot? nextDeliverySlot});

  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  $TimeSlotCopyWith<$Res>? get selectedTimeSlot;
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
  $TimeSlotCopyWith<$Res>? get nextCollectionSlot;
  $TimeSlotCopyWith<$Res>? get nextDeliverySlot;
}

/// @nodoc
class _$UserCartStateCopyWithImpl<$Res, $Val extends UserCartState>
    implements $UserCartStateCopyWith<$Res> {
  _$UserCartStateCopyWithImpl(this._value, this._then);

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
    Object? cartDiscountPercent = null,
    Object? cartDiscountComputed = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? payButtonLoading = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? fulfilmentMethod = null,
    Object? isDelivery = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? selectedPaymentMethod = freezed,
    Object? fulfilmentPostalDistricts = null,
    Object? eligibleOrderDates = null,
    Object? nextCollectionSlot = freezed,
    Object? nextDeliverySlot = freezed,
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
      cartDiscountPercent: null == cartDiscountPercent
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscountComputed: null == cartDiscountComputed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      selectedDeliveryAddress: freezed == selectedDeliveryAddress
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: freezed == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      selectedTipAmount: null == selectedTipAmount
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: null == selectedGBPxAmount
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: null == selectedPPLAmount
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      payButtonLoading: null == payButtonLoading
          ? _value.payButtonLoading
          : payButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transferringTokens: null == transferringTokens
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: null == errorCompletingPayment
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: null == confirmedPayment
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: freezed == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      restaurantWalletAddress: null == restaurantWalletAddress
          ? _value.restaurantWalletAddress
          : restaurantWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantMinimumOrder: null == restaurantMinimumOrder
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: null == restaurantPlatformFee
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPaymentMethod: freezed == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      fulfilmentPostalDistricts: null == fulfilmentPostalDistricts
          ? _value.fulfilmentPostalDistricts
          : fulfilmentPostalDistricts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eligibleOrderDates: null == eligibleOrderDates
          ? _value.eligibleOrderDates
          : eligibleOrderDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      nextCollectionSlot: freezed == nextCollectionSlot
          ? _value.nextCollectionSlot
          : nextCollectionSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      nextDeliverySlot: freezed == nextDeliverySlot
          ? _value.nextDeliverySlot
          : nextDeliverySlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress {
    if (_value.selectedDeliveryAddress == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.selectedDeliveryAddress!,
        (value) {
      return _then(_value.copyWith(selectedDeliveryAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSlotCopyWith<$Res>? get selectedTimeSlot {
    if (_value.selectedTimeSlot == null) {
      return null;
    }

    return $TimeSlotCopyWith<$Res>(_value.selectedTimeSlot!, (value) {
      return _then(_value.copyWith(selectedTimeSlot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress {
    if (_value.restaurantAddress == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.restaurantAddress!, (value) {
      return _then(_value.copyWith(restaurantAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSlotCopyWith<$Res>? get nextCollectionSlot {
    if (_value.nextCollectionSlot == null) {
      return null;
    }

    return $TimeSlotCopyWith<$Res>(_value.nextCollectionSlot!, (value) {
      return _then(_value.copyWith(nextCollectionSlot: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSlotCopyWith<$Res>? get nextDeliverySlot {
    if (_value.nextDeliverySlot == null) {
      return null;
    }

    return $TimeSlotCopyWith<$Res>(_value.nextDeliverySlot!, (value) {
      return _then(_value.copyWith(nextDeliverySlot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCartStateCopyWith<$Res>
    implements $UserCartStateCopyWith<$Res> {
  factory _$$_UserCartStateCopyWith(
          _$_UserCartState value, $Res Function(_$_UserCartState) then) =
      __$$_UserCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed,
      List<TimeSlot> deliverySlots,
      List<TimeSlot> collectionSlots,
      DeliveryAddresses? selectedDeliveryAddress,
      TimeSlot? selectedTimeSlot,
      int selectedTipAmount,
      String discountCode,
      String paymentIntentID,
      String orderID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool payButtonLoading,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      DeliveryAddresses? restaurantAddress,
      String restaurantWalletAddress,
      FulfilmentMethodType fulfilmentMethod,
      bool isDelivery,
      int restaurantMinimumOrder,
      int restaurantPlatformFee,
      String deliveryInstructions,
      PaymentMethod? selectedPaymentMethod,
      List<String> fulfilmentPostalDistricts,
      List<DateTime> eligibleOrderDates,
      TimeSlot? nextCollectionSlot,
      TimeSlot? nextDeliverySlot});

  @override
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  @override
  $TimeSlotCopyWith<$Res>? get selectedTimeSlot;
  @override
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
  @override
  $TimeSlotCopyWith<$Res>? get nextCollectionSlot;
  @override
  $TimeSlotCopyWith<$Res>? get nextDeliverySlot;
}

/// @nodoc
class __$$_UserCartStateCopyWithImpl<$Res>
    extends _$UserCartStateCopyWithImpl<$Res, _$_UserCartState>
    implements _$$_UserCartStateCopyWith<$Res> {
  __$$_UserCartStateCopyWithImpl(
      _$_UserCartState _value, $Res Function(_$_UserCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? cartSubTotal = null,
    Object? cartTax = null,
    Object? cartTotal = null,
    Object? cartDiscountPercent = null,
    Object? cartDiscountComputed = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? payButtonLoading = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? fulfilmentMethod = null,
    Object? isDelivery = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? selectedPaymentMethod = freezed,
    Object? fulfilmentPostalDistricts = null,
    Object? eligibleOrderDates = null,
    Object? nextCollectionSlot = freezed,
    Object? nextDeliverySlot = freezed,
  }) {
    return _then(_$_UserCartState(
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
      cartDiscountPercent: null == cartDiscountPercent
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      cartDiscountComputed: null == cartDiscountComputed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>,
      selectedDeliveryAddress: freezed == selectedDeliveryAddress
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: freezed == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      selectedTipAmount: null == selectedTipAmount
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: null == selectedGBPxAmount
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: null == selectedPPLAmount
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      payButtonLoading: null == payButtonLoading
          ? _value.payButtonLoading
          : payButtonLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transferringTokens: null == transferringTokens
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: null == errorCompletingPayment
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: null == confirmedPayment
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: null == restaurantID
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: freezed == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      restaurantWalletAddress: null == restaurantWalletAddress
          ? _value.restaurantWalletAddress
          : restaurantWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethodType,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantMinimumOrder: null == restaurantMinimumOrder
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: null == restaurantPlatformFee
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPaymentMethod: freezed == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      fulfilmentPostalDistricts: null == fulfilmentPostalDistricts
          ? _value.fulfilmentPostalDistricts
          : fulfilmentPostalDistricts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eligibleOrderDates: null == eligibleOrderDates
          ? _value.eligibleOrderDates
          : eligibleOrderDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      nextCollectionSlot: freezed == nextCollectionSlot
          ? _value.nextCollectionSlot
          : nextCollectionSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
      nextDeliverySlot: freezed == nextDeliverySlot
          ? _value.nextDeliverySlot
          : nextDeliverySlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState {
  _$_UserCartState(
      {this.cartItems = const [],
      this.cartSubTotal = 0,
      this.cartTax = 0,
      this.cartTotal = 0,
      this.cartDiscountPercent = 0,
      this.cartDiscountComputed = 0,
      this.deliverySlots = const [],
      this.collectionSlots = const [],
      this.selectedDeliveryAddress = null,
      this.selectedTimeSlot = null,
      this.selectedTipAmount = 0,
      this.discountCode = '',
      this.paymentIntentID = '',
      this.orderID = '',
      this.selectedGBPxAmount = 0.0,
      this.selectedPPLAmount = 0.0,
      this.payButtonLoading = false,
      this.transferringTokens = false,
      this.errorCompletingPayment = false,
      this.confirmedPayment = false,
      this.restaurantName = '',
      this.restaurantID = '',
      this.restaurantAddress = null,
      this.restaurantWalletAddress = '',
      this.fulfilmentMethod = FulfilmentMethodType.delivery,
      this.isDelivery = false,
      this.restaurantMinimumOrder = 0,
      this.restaurantPlatformFee = 0,
      this.deliveryInstructions = '',
      this.selectedPaymentMethod = null,
      this.fulfilmentPostalDistricts = const [],
      this.eligibleOrderDates = const [],
      this.nextCollectionSlot = null,
      this.nextDeliverySlot = null})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  @JsonKey()
  final List<CartItem> cartItems;
  @override
  @JsonKey()
  final int cartSubTotal;
  @override
  @JsonKey()
  final int cartTax;
  @override
  @JsonKey()
  final int cartTotal;
  @override
  @JsonKey()
  final int cartDiscountPercent;
  @override
  @JsonKey()
  final int cartDiscountComputed;
  @override
  @JsonKey()
  final List<TimeSlot> deliverySlots;
  @override
  @JsonKey()
  final List<TimeSlot> collectionSlots;
  @override
  @JsonKey()
  final DeliveryAddresses? selectedDeliveryAddress;
  @override
  @JsonKey()
  final TimeSlot? selectedTimeSlot;
  @override
  @JsonKey()
  final int selectedTipAmount;
  @override
  @JsonKey()
  final String discountCode;
  @override
  @JsonKey()
  final String paymentIntentID;
  @override
  @JsonKey()
  final String orderID;
  @override
  @JsonKey()
  final double selectedGBPxAmount;
  @override
  @JsonKey()
  final double selectedPPLAmount;
  @override
  @JsonKey()
  final bool payButtonLoading;
  @override
  @JsonKey()
  final bool transferringTokens;
  @override
  @JsonKey()
  final bool errorCompletingPayment;
  @override
  @JsonKey()
  final bool confirmedPayment;
  @override
  @JsonKey()
  final String restaurantName;
  @override
  @JsonKey()
  final String restaurantID;
  @override
  @JsonKey()
  final DeliveryAddresses? restaurantAddress;
  @override
  @JsonKey()
  final String restaurantWalletAddress;
  @override
  @JsonKey()
  final FulfilmentMethodType fulfilmentMethod;
  @override
  @JsonKey()
  final bool isDelivery;
  @override
  @JsonKey()
  final int restaurantMinimumOrder;
  @override
  @JsonKey()
  final int restaurantPlatformFee;
  @override
  @JsonKey()
  final String deliveryInstructions;
  @override
  @JsonKey()
  final PaymentMethod? selectedPaymentMethod;
  @override
  @JsonKey()
  final List<String> fulfilmentPostalDistricts;
  @override
  @JsonKey()
  final List<DateTime> eligibleOrderDates;
  @override
  @JsonKey()
  final TimeSlot? nextCollectionSlot;
  @override
  @JsonKey()
  final TimeSlot? nextDeliverySlot;

  @override
  String toString() {
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed, deliverySlots: $deliverySlots, collectionSlots: $collectionSlots, selectedDeliveryAddress: $selectedDeliveryAddress, selectedTimeSlot: $selectedTimeSlot, selectedTipAmount: $selectedTipAmount, discountCode: $discountCode, paymentIntentID: $paymentIntentID, orderID: $orderID, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, payButtonLoading: $payButtonLoading, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, restaurantID: $restaurantID, restaurantAddress: $restaurantAddress, restaurantWalletAddress: $restaurantWalletAddress, fulfilmentMethod: $fulfilmentMethod, isDelivery: $isDelivery, restaurantMinimumOrder: $restaurantMinimumOrder, restaurantPlatformFee: $restaurantPlatformFee, deliveryInstructions: $deliveryInstructions, selectedPaymentMethod: $selectedPaymentMethod, fulfilmentPostalDistricts: $fulfilmentPostalDistricts, eligibleOrderDates: $eligibleOrderDates, nextCollectionSlot: $nextCollectionSlot, nextDeliverySlot: $nextDeliverySlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCartState &&
            const DeepCollectionEquality().equals(other.cartItems, cartItems) &&
            (identical(other.cartSubTotal, cartSubTotal) ||
                other.cartSubTotal == cartSubTotal) &&
            (identical(other.cartTax, cartTax) || other.cartTax == cartTax) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal) &&
            (identical(other.cartDiscountPercent, cartDiscountPercent) ||
                other.cartDiscountPercent == cartDiscountPercent) &&
            (identical(other.cartDiscountComputed, cartDiscountComputed) ||
                other.cartDiscountComputed == cartDiscountComputed) &&
            const DeepCollectionEquality()
                .equals(other.deliverySlots, deliverySlots) &&
            const DeepCollectionEquality()
                .equals(other.collectionSlots, collectionSlots) &&
            (identical(other.selectedDeliveryAddress, selectedDeliveryAddress) ||
                other.selectedDeliveryAddress == selectedDeliveryAddress) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.selectedTipAmount, selectedTipAmount) ||
                other.selectedTipAmount == selectedTipAmount) &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.paymentIntentID, paymentIntentID) ||
                other.paymentIntentID == paymentIntentID) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.selectedGBPxAmount, selectedGBPxAmount) ||
                other.selectedGBPxAmount == selectedGBPxAmount) &&
            (identical(other.selectedPPLAmount, selectedPPLAmount) ||
                other.selectedPPLAmount == selectedPPLAmount) &&
            (identical(other.payButtonLoading, payButtonLoading) ||
                other.payButtonLoading == payButtonLoading) &&
            (identical(other.transferringTokens, transferringTokens) ||
                other.transferringTokens == transferringTokens) &&
            (identical(other.errorCompletingPayment, errorCompletingPayment) ||
                other.errorCompletingPayment == errorCompletingPayment) &&
            (identical(other.confirmedPayment, confirmedPayment) ||
                other.confirmedPayment == confirmedPayment) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantID, restaurantID) ||
                other.restaurantID == restaurantID) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                other.restaurantAddress == restaurantAddress) &&
            (identical(other.restaurantWalletAddress, restaurantWalletAddress) ||
                other.restaurantWalletAddress == restaurantWalletAddress) &&
            (identical(other.fulfilmentMethod, fulfilmentMethod) ||
                other.fulfilmentMethod == fulfilmentMethod) &&
            (identical(other.isDelivery, isDelivery) ||
                other.isDelivery == isDelivery) &&
            (identical(other.restaurantMinimumOrder, restaurantMinimumOrder) ||
                other.restaurantMinimumOrder == restaurantMinimumOrder) &&
            (identical(other.restaurantPlatformFee, restaurantPlatformFee) ||
                other.restaurantPlatformFee == restaurantPlatformFee) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            const DeepCollectionEquality().equals(
                other.fulfilmentPostalDistricts, fulfilmentPostalDistricts) &&
            const DeepCollectionEquality()
                .equals(other.eligibleOrderDates, eligibleOrderDates) &&
            (identical(other.nextCollectionSlot, nextCollectionSlot) ||
                other.nextCollectionSlot == nextCollectionSlot) &&
            (identical(other.nextDeliverySlot, nextDeliverySlot) ||
                other.nextDeliverySlot == nextDeliverySlot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(cartItems),
        cartSubTotal,
        cartTax,
        cartTotal,
        cartDiscountPercent,
        cartDiscountComputed,
        const DeepCollectionEquality().hash(deliverySlots),
        const DeepCollectionEquality().hash(collectionSlots),
        selectedDeliveryAddress,
        selectedTimeSlot,
        selectedTipAmount,
        discountCode,
        paymentIntentID,
        orderID,
        selectedGBPxAmount,
        selectedPPLAmount,
        payButtonLoading,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
        restaurantName,
        restaurantID,
        restaurantAddress,
        restaurantWalletAddress,
        fulfilmentMethod,
        isDelivery,
        restaurantMinimumOrder,
        restaurantPlatformFee,
        deliveryInstructions,
        selectedPaymentMethod,
        const DeepCollectionEquality().hash(fulfilmentPostalDistricts),
        const DeepCollectionEquality().hash(eligibleOrderDates),
        nextCollectionSlot,
        nextDeliverySlot
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCartStateCopyWith<_$_UserCartState> get copyWith =>
      __$$_UserCartStateCopyWithImpl<_$_UserCartState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCartStateToJson(
      this,
    );
  }
}

abstract class _UserCartState extends UserCartState {
  factory _UserCartState(
      {final List<CartItem> cartItems,
      final int cartSubTotal,
      final int cartTax,
      final int cartTotal,
      final int cartDiscountPercent,
      final int cartDiscountComputed,
      final List<TimeSlot> deliverySlots,
      final List<TimeSlot> collectionSlots,
      final DeliveryAddresses? selectedDeliveryAddress,
      final TimeSlot? selectedTimeSlot,
      final int selectedTipAmount,
      final String discountCode,
      final String paymentIntentID,
      final String orderID,
      final double selectedGBPxAmount,
      final double selectedPPLAmount,
      final bool payButtonLoading,
      final bool transferringTokens,
      final bool errorCompletingPayment,
      final bool confirmedPayment,
      final String restaurantName,
      final String restaurantID,
      final DeliveryAddresses? restaurantAddress,
      final String restaurantWalletAddress,
      final FulfilmentMethodType fulfilmentMethod,
      final bool isDelivery,
      final int restaurantMinimumOrder,
      final int restaurantPlatformFee,
      final String deliveryInstructions,
      final PaymentMethod? selectedPaymentMethod,
      final List<String> fulfilmentPostalDistricts,
      final List<DateTime> eligibleOrderDates,
      final TimeSlot? nextCollectionSlot,
      final TimeSlot? nextDeliverySlot}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  List<CartItem> get cartItems;
  @override
  int get cartSubTotal;
  @override
  int get cartTax;
  @override
  int get cartTotal;
  @override
  int get cartDiscountPercent;
  @override
  int get cartDiscountComputed;
  @override
  List<TimeSlot> get deliverySlots;
  @override
  List<TimeSlot> get collectionSlots;
  @override
  DeliveryAddresses? get selectedDeliveryAddress;
  @override
  TimeSlot? get selectedTimeSlot;
  @override
  int get selectedTipAmount;
  @override
  String get discountCode;
  @override
  String get paymentIntentID;
  @override
  String get orderID;
  @override
  double get selectedGBPxAmount;
  @override
  double get selectedPPLAmount;
  @override
  bool get payButtonLoading;
  @override
  bool get transferringTokens;
  @override
  bool get errorCompletingPayment;
  @override
  bool get confirmedPayment;
  @override
  String get restaurantName;
  @override
  String get restaurantID;
  @override
  DeliveryAddresses? get restaurantAddress;
  @override
  String get restaurantWalletAddress;
  @override
  FulfilmentMethodType get fulfilmentMethod;
  @override
  bool get isDelivery;
  @override
  int get restaurantMinimumOrder;
  @override
  int get restaurantPlatformFee;
  @override
  String get deliveryInstructions;
  @override
  PaymentMethod? get selectedPaymentMethod;
  @override
  List<String> get fulfilmentPostalDistricts;
  @override
  List<DateTime> get eligibleOrderDates;
  @override
  TimeSlot? get nextCollectionSlot;
  @override
  TimeSlot? get nextDeliverySlot;
  @override
  @JsonKey(ignore: true)
  _$$_UserCartStateCopyWith<_$_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
