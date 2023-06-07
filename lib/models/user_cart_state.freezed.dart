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
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartSubTotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartTax => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartTotal => throw _privateConstructorUsedError;
  Currency get cartCurrency => throw _privateConstructorUsedError;
  num get cartDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartDiscountComputed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get voucherPotValue => throw _privateConstructorUsedError;
  List<Discount> get appliedVouchers => throw _privateConstructorUsedError;
  List<TimeSlot> get deliverySlots => throw _privateConstructorUsedError;
  List<TimeSlot> get collectionSlots => throw _privateConstructorUsedError;
  DeliveryAddresses? get selectedDeliveryAddress =>
      throw _privateConstructorUsedError;
  TimeSlot? get selectedTimeSlot => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get selectedTipAmount => throw _privateConstructorUsedError;
  String get discountCode => throw _privateConstructorUsedError;
  String get paymentIntentID => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get paymentIntentClientSecret => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  StripePaymentIntent? get paymentIntent => throw _privateConstructorUsedError;
  String get ephemeralKey => throw _privateConstructorUsedError;
  String get publishableKey => throw _privateConstructorUsedError;
  Order? get order => throw _privateConstructorUsedError;
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  bool get payButtonLoading => throw _privateConstructorUsedError;
  bool get transferringTokens => throw _privateConstructorUsedError;
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  bool get confirmedPayment => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantID => throw _privateConstructorUsedError;
  bool get restaurantIsLive => throw _privateConstructorUsedError;
  DeliveryAddresses? get restaurantAddress =>
      throw _privateConstructorUsedError;
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  FulfilmentMethodType get fulfilmentMethod =>
      throw _privateConstructorUsedError;
  int get restaurantMinimumOrder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get restaurantPlatformFee => throw _privateConstructorUsedError;
  String get deliveryInstructions => throw _privateConstructorUsedError;
  PaymentMethod? get selectedPaymentMethod =>
      throw _privateConstructorUsedError;
  List<String> get fulfilmentPostalDistricts =>
      throw _privateConstructorUsedError;
  List<DateTime> get eligibleOrderDates => throw _privateConstructorUsedError;
  TimeSlot? get nextCollectionSlot => throw _privateConstructorUsedError;
  TimeSlot? get nextDeliverySlot => throw _privateConstructorUsedError;
  ProductSuggestion? get productSuggestion =>
      throw _privateConstructorUsedError;
  OrderCreationProcessStatus get orderCreationProcessStatus =>
      throw _privateConstructorUsedError;
  StripePaymentStatus get stripePaymentStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
  LivePayment? get paymentInProcess => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isLoadingCartState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  ErrorDetails<CartErrCode>? get errorDetails =>
      throw _privateConstructorUsedError;

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
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartSubTotal,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartTax,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartTotal,
      Currency cartCurrency,
      num cartDiscountPercent,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartDiscountComputed,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money voucherPotValue,
      List<Discount> appliedVouchers,
      List<TimeSlot> deliverySlots,
      List<TimeSlot> collectionSlots,
      DeliveryAddresses? selectedDeliveryAddress,
      TimeSlot? selectedTimeSlot,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money selectedTipAmount,
      String discountCode,
      String paymentIntentID,
      @JsonKey(ignore: true)
          String paymentIntentClientSecret,
      @JsonKey(ignore: true)
          StripePaymentIntent? paymentIntent,
      String ephemeralKey,
      String publishableKey,
      Order? order,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool payButtonLoading,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      bool restaurantIsLive,
      DeliveryAddresses? restaurantAddress,
      String restaurantWalletAddress,
      FulfilmentMethodType fulfilmentMethod,
      int restaurantMinimumOrder,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money restaurantPlatformFee,
      String deliveryInstructions,
      PaymentMethod? selectedPaymentMethod,
      List<String> fulfilmentPostalDistricts,
      List<DateTime> eligibleOrderDates,
      TimeSlot? nextCollectionSlot,
      TimeSlot? nextDeliverySlot,
      ProductSuggestion? productSuggestion,
      OrderCreationProcessStatus orderCreationProcessStatus,
      StripePaymentStatus stripePaymentStatus,
      @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
          LivePayment? paymentInProcess,
      @JsonKey(ignore: true)
          bool isLoadingCartState,
      @JsonKey(ignore: true)
          ErrorDetails<CartErrCode>? errorDetails});

  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  $TimeSlotCopyWith<$Res>? get selectedTimeSlot;
  $StripePaymentIntentCopyWith<$Res>? get paymentIntent;
  $OrderCopyWith<$Res>? get order;
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
  $TimeSlotCopyWith<$Res>? get nextCollectionSlot;
  $TimeSlotCopyWith<$Res>? get nextDeliverySlot;
  $ProductSuggestionCopyWith<$Res>? get productSuggestion;
  $LivePaymentCopyWith<$Res>? get paymentInProcess;
  $ErrorDetailsCopyWith<CartErrCode, $Res>? get errorDetails;
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
    Object? cartCurrency = null,
    Object? cartDiscountPercent = null,
    Object? cartDiscountComputed = null,
    Object? voucherPotValue = null,
    Object? appliedVouchers = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? paymentIntentClientSecret = null,
    Object? paymentIntent = freezed,
    Object? ephemeralKey = null,
    Object? publishableKey = null,
    Object? order = freezed,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? payButtonLoading = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantIsLive = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? fulfilmentMethod = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? selectedPaymentMethod = freezed,
    Object? fulfilmentPostalDistricts = null,
    Object? eligibleOrderDates = null,
    Object? nextCollectionSlot = freezed,
    Object? nextDeliverySlot = freezed,
    Object? productSuggestion = freezed,
    Object? orderCreationProcessStatus = null,
    Object? stripePaymentStatus = null,
    Object? paymentInProcess = freezed,
    Object? isLoadingCartState = null,
    Object? errorDetails = freezed,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartSubTotal: null == cartSubTotal
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as Money,
      cartTax: null == cartTax
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as Money,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as Money,
      cartCurrency: null == cartCurrency
          ? _value.cartCurrency
          : cartCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      cartDiscountPercent: null == cartDiscountPercent
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as num,
      cartDiscountComputed: null == cartDiscountComputed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as Money,
      voucherPotValue: null == voucherPotValue
          ? _value.voucherPotValue
          : voucherPotValue // ignore: cast_nullable_to_non_nullable
              as Money,
      appliedVouchers: null == appliedVouchers
          ? _value.appliedVouchers
          : appliedVouchers // ignore: cast_nullable_to_non_nullable
              as List<Discount>,
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
              as Money,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentClientSecret: null == paymentIntentClientSecret
          ? _value.paymentIntentClientSecret
          : paymentIntentClientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntent: freezed == paymentIntent
          ? _value.paymentIntent
          : paymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntent?,
      ephemeralKey: null == ephemeralKey
          ? _value.ephemeralKey
          : ephemeralKey // ignore: cast_nullable_to_non_nullable
              as String,
      publishableKey: null == publishableKey
          ? _value.publishableKey
          : publishableKey // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
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
      restaurantIsLive: null == restaurantIsLive
          ? _value.restaurantIsLive
          : restaurantIsLive // ignore: cast_nullable_to_non_nullable
              as bool,
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
      restaurantMinimumOrder: null == restaurantMinimumOrder
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: null == restaurantPlatformFee
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as Money,
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
      productSuggestion: freezed == productSuggestion
          ? _value.productSuggestion
          : productSuggestion // ignore: cast_nullable_to_non_nullable
              as ProductSuggestion?,
      orderCreationProcessStatus: null == orderCreationProcessStatus
          ? _value.orderCreationProcessStatus
          : orderCreationProcessStatus // ignore: cast_nullable_to_non_nullable
              as OrderCreationProcessStatus,
      stripePaymentStatus: null == stripePaymentStatus
          ? _value.stripePaymentStatus
          : stripePaymentStatus // ignore: cast_nullable_to_non_nullable
              as StripePaymentStatus,
      paymentInProcess: freezed == paymentInProcess
          ? _value.paymentInProcess
          : paymentInProcess // ignore: cast_nullable_to_non_nullable
              as LivePayment?,
      isLoadingCartState: null == isLoadingCartState
          ? _value.isLoadingCartState
          : isLoadingCartState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorDetails: freezed == errorDetails
          ? _value.errorDetails
          : errorDetails // ignore: cast_nullable_to_non_nullable
              as ErrorDetails<CartErrCode>?,
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
  $StripePaymentIntentCopyWith<$Res>? get paymentIntent {
    if (_value.paymentIntent == null) {
      return null;
    }

    return $StripePaymentIntentCopyWith<$Res>(_value.paymentIntent!, (value) {
      return _then(_value.copyWith(paymentIntent: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $ProductSuggestionCopyWith<$Res>? get productSuggestion {
    if (_value.productSuggestion == null) {
      return null;
    }

    return $ProductSuggestionCopyWith<$Res>(_value.productSuggestion!, (value) {
      return _then(_value.copyWith(productSuggestion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LivePaymentCopyWith<$Res>? get paymentInProcess {
    if (_value.paymentInProcess == null) {
      return null;
    }

    return $LivePaymentCopyWith<$Res>(_value.paymentInProcess!, (value) {
      return _then(_value.copyWith(paymentInProcess: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorDetailsCopyWith<CartErrCode, $Res>? get errorDetails {
    if (_value.errorDetails == null) {
      return null;
    }

    return $ErrorDetailsCopyWith<CartErrCode, $Res>(_value.errorDetails!,
        (value) {
      return _then(_value.copyWith(errorDetails: value) as $Val);
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
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartSubTotal,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartTax,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartTotal,
      Currency cartCurrency,
      num cartDiscountPercent,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money cartDiscountComputed,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money voucherPotValue,
      List<Discount> appliedVouchers,
      List<TimeSlot> deliverySlots,
      List<TimeSlot> collectionSlots,
      DeliveryAddresses? selectedDeliveryAddress,
      TimeSlot? selectedTimeSlot,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money selectedTipAmount,
      String discountCode,
      String paymentIntentID,
      @JsonKey(ignore: true)
          String paymentIntentClientSecret,
      @JsonKey(ignore: true)
          StripePaymentIntent? paymentIntent,
      String ephemeralKey,
      String publishableKey,
      Order? order,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool payButtonLoading,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      bool restaurantIsLive,
      DeliveryAddresses? restaurantAddress,
      String restaurantWalletAddress,
      FulfilmentMethodType fulfilmentMethod,
      int restaurantMinimumOrder,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          Money restaurantPlatformFee,
      String deliveryInstructions,
      PaymentMethod? selectedPaymentMethod,
      List<String> fulfilmentPostalDistricts,
      List<DateTime> eligibleOrderDates,
      TimeSlot? nextCollectionSlot,
      TimeSlot? nextDeliverySlot,
      ProductSuggestion? productSuggestion,
      OrderCreationProcessStatus orderCreationProcessStatus,
      StripePaymentStatus stripePaymentStatus,
      @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
          LivePayment? paymentInProcess,
      @JsonKey(ignore: true)
          bool isLoadingCartState,
      @JsonKey(ignore: true)
          ErrorDetails<CartErrCode>? errorDetails});

  @override
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  @override
  $TimeSlotCopyWith<$Res>? get selectedTimeSlot;
  @override
  $StripePaymentIntentCopyWith<$Res>? get paymentIntent;
  @override
  $OrderCopyWith<$Res>? get order;
  @override
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
  @override
  $TimeSlotCopyWith<$Res>? get nextCollectionSlot;
  @override
  $TimeSlotCopyWith<$Res>? get nextDeliverySlot;
  @override
  $ProductSuggestionCopyWith<$Res>? get productSuggestion;
  @override
  $LivePaymentCopyWith<$Res>? get paymentInProcess;
  @override
  $ErrorDetailsCopyWith<CartErrCode, $Res>? get errorDetails;
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
    Object? cartCurrency = null,
    Object? cartDiscountPercent = null,
    Object? cartDiscountComputed = null,
    Object? voucherPotValue = null,
    Object? appliedVouchers = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? paymentIntentClientSecret = null,
    Object? paymentIntent = freezed,
    Object? ephemeralKey = null,
    Object? publishableKey = null,
    Object? order = freezed,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? payButtonLoading = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantIsLive = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? fulfilmentMethod = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? selectedPaymentMethod = freezed,
    Object? fulfilmentPostalDistricts = null,
    Object? eligibleOrderDates = null,
    Object? nextCollectionSlot = freezed,
    Object? nextDeliverySlot = freezed,
    Object? productSuggestion = freezed,
    Object? orderCreationProcessStatus = null,
    Object? stripePaymentStatus = null,
    Object? paymentInProcess = freezed,
    Object? isLoadingCartState = null,
    Object? errorDetails = freezed,
  }) {
    return _then(_$_UserCartState(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      cartSubTotal: null == cartSubTotal
          ? _value.cartSubTotal
          : cartSubTotal // ignore: cast_nullable_to_non_nullable
              as Money,
      cartTax: null == cartTax
          ? _value.cartTax
          : cartTax // ignore: cast_nullable_to_non_nullable
              as Money,
      cartTotal: null == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as Money,
      cartCurrency: null == cartCurrency
          ? _value.cartCurrency
          : cartCurrency // ignore: cast_nullable_to_non_nullable
              as Currency,
      cartDiscountPercent: null == cartDiscountPercent
          ? _value.cartDiscountPercent
          : cartDiscountPercent // ignore: cast_nullable_to_non_nullable
              as num,
      cartDiscountComputed: null == cartDiscountComputed
          ? _value.cartDiscountComputed
          : cartDiscountComputed // ignore: cast_nullable_to_non_nullable
              as Money,
      voucherPotValue: null == voucherPotValue
          ? _value.voucherPotValue
          : voucherPotValue // ignore: cast_nullable_to_non_nullable
              as Money,
      appliedVouchers: null == appliedVouchers
          ? _value.appliedVouchers
          : appliedVouchers // ignore: cast_nullable_to_non_nullable
              as List<Discount>,
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
              as Money,
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: null == paymentIntentID
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentClientSecret: null == paymentIntentClientSecret
          ? _value.paymentIntentClientSecret
          : paymentIntentClientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntent: freezed == paymentIntent
          ? _value.paymentIntent
          : paymentIntent // ignore: cast_nullable_to_non_nullable
              as StripePaymentIntent?,
      ephemeralKey: null == ephemeralKey
          ? _value.ephemeralKey
          : ephemeralKey // ignore: cast_nullable_to_non_nullable
              as String,
      publishableKey: null == publishableKey
          ? _value.publishableKey
          : publishableKey // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order?,
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
      restaurantIsLive: null == restaurantIsLive
          ? _value.restaurantIsLive
          : restaurantIsLive // ignore: cast_nullable_to_non_nullable
              as bool,
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
      restaurantMinimumOrder: null == restaurantMinimumOrder
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: null == restaurantPlatformFee
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as Money,
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
      productSuggestion: freezed == productSuggestion
          ? _value.productSuggestion
          : productSuggestion // ignore: cast_nullable_to_non_nullable
              as ProductSuggestion?,
      orderCreationProcessStatus: null == orderCreationProcessStatus
          ? _value.orderCreationProcessStatus
          : orderCreationProcessStatus // ignore: cast_nullable_to_non_nullable
              as OrderCreationProcessStatus,
      stripePaymentStatus: null == stripePaymentStatus
          ? _value.stripePaymentStatus
          : stripePaymentStatus // ignore: cast_nullable_to_non_nullable
              as StripePaymentStatus,
      paymentInProcess: freezed == paymentInProcess
          ? _value.paymentInProcess
          : paymentInProcess // ignore: cast_nullable_to_non_nullable
              as LivePayment?,
      isLoadingCartState: null == isLoadingCartState
          ? _value.isLoadingCartState
          : isLoadingCartState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorDetails: freezed == errorDetails
          ? _value.errorDetails
          : errorDetails // ignore: cast_nullable_to_non_nullable
              as ErrorDetails<CartErrCode>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState with DiagnosticableTreeMixin {
  _$_UserCartState(
      {this.cartItems = const [],
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.cartSubTotal = const Money.zeroGBP(),
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.cartTax = const Money.zeroGBP(),
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.cartTotal = const Money.zeroGBP(),
      this.cartCurrency = Currency.GBP,
      this.cartDiscountPercent = 0,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.cartDiscountComputed = const Money.zeroGBP(),
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.voucherPotValue = const Money.zeroGBP(),
      this.appliedVouchers = const [],
      this.deliverySlots = const [],
      this.collectionSlots = const [],
      this.selectedDeliveryAddress = null,
      this.selectedTimeSlot = null,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.selectedTipAmount = const Money.zeroGBP(),
      this.discountCode = '',
      this.paymentIntentID = '',
      @JsonKey(ignore: true)
          this.paymentIntentClientSecret = '',
      @JsonKey(ignore: true)
          this.paymentIntent = null,
      this.ephemeralKey = '',
      this.publishableKey = '',
      this.order = null,
      this.selectedGBPxAmount = 0.0,
      this.selectedPPLAmount = 0.0,
      this.payButtonLoading = false,
      this.transferringTokens = false,
      this.errorCompletingPayment = false,
      this.confirmedPayment = false,
      this.restaurantName = '',
      this.restaurantID = '',
      this.restaurantIsLive = false,
      this.restaurantAddress = null,
      this.restaurantWalletAddress = '',
      this.fulfilmentMethod = FulfilmentMethodType.delivery,
      this.restaurantMinimumOrder = 0,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          this.restaurantPlatformFee = const Money.zeroGBP(),
      this.deliveryInstructions = '',
      this.selectedPaymentMethod = null,
      this.fulfilmentPostalDistricts = const [],
      this.eligibleOrderDates = const [],
      this.nextCollectionSlot = null,
      this.nextDeliverySlot = null,
      this.productSuggestion = null,
      this.orderCreationProcessStatus = OrderCreationProcessStatus.none,
      this.stripePaymentStatus = StripePaymentStatus.none,
      @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
          this.paymentInProcess = null,
      @JsonKey(ignore: true)
          this.isLoadingCartState = false,
      @JsonKey(ignore: true)
          this.errorDetails = null})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  @JsonKey()
  final List<CartItem> cartItems;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money cartSubTotal;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money cartTax;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money cartTotal;
  @override
  @JsonKey()
  final Currency cartCurrency;
  @override
  @JsonKey()
  final num cartDiscountPercent;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money cartDiscountComputed;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money voucherPotValue;
  @override
  @JsonKey()
  final List<Discount> appliedVouchers;
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
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money selectedTipAmount;
  @override
  @JsonKey()
  final String discountCode;
  @override
  @JsonKey()
  final String paymentIntentID;
  @override
  @JsonKey(ignore: true)
  final String paymentIntentClientSecret;
  @override
  @JsonKey(ignore: true)
  final StripePaymentIntent? paymentIntent;
  @override
  @JsonKey()
  final String ephemeralKey;
  @override
  @JsonKey()
  final String publishableKey;
  @override
  @JsonKey()
  final Order? order;
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
  final bool restaurantIsLive;
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
  final int restaurantMinimumOrder;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  final Money restaurantPlatformFee;
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
  @JsonKey()
  final ProductSuggestion? productSuggestion;
  @override
  @JsonKey()
  final OrderCreationProcessStatus orderCreationProcessStatus;
  @override
  @JsonKey()
  final StripePaymentStatus stripePaymentStatus;
  @override
  @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
  final LivePayment? paymentInProcess;
  @override
  @JsonKey(ignore: true)
  final bool isLoadingCartState;
  @override
  @JsonKey(ignore: true)
  final ErrorDetails<CartErrCode>? errorDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartCurrency: $cartCurrency, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed, voucherPotValue: $voucherPotValue, appliedVouchers: $appliedVouchers, deliverySlots: $deliverySlots, collectionSlots: $collectionSlots, selectedDeliveryAddress: $selectedDeliveryAddress, selectedTimeSlot: $selectedTimeSlot, selectedTipAmount: $selectedTipAmount, discountCode: $discountCode, paymentIntentID: $paymentIntentID, paymentIntentClientSecret: $paymentIntentClientSecret, paymentIntent: $paymentIntent, ephemeralKey: $ephemeralKey, publishableKey: $publishableKey, order: $order, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, payButtonLoading: $payButtonLoading, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, restaurantID: $restaurantID, restaurantIsLive: $restaurantIsLive, restaurantAddress: $restaurantAddress, restaurantWalletAddress: $restaurantWalletAddress, fulfilmentMethod: $fulfilmentMethod, restaurantMinimumOrder: $restaurantMinimumOrder, restaurantPlatformFee: $restaurantPlatformFee, deliveryInstructions: $deliveryInstructions, selectedPaymentMethod: $selectedPaymentMethod, fulfilmentPostalDistricts: $fulfilmentPostalDistricts, eligibleOrderDates: $eligibleOrderDates, nextCollectionSlot: $nextCollectionSlot, nextDeliverySlot: $nextDeliverySlot, productSuggestion: $productSuggestion, orderCreationProcessStatus: $orderCreationProcessStatus, stripePaymentStatus: $stripePaymentStatus, paymentInProcess: $paymentInProcess, isLoadingCartState: $isLoadingCartState, errorDetails: $errorDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserCartState'))
      ..add(DiagnosticsProperty('cartItems', cartItems))
      ..add(DiagnosticsProperty('cartSubTotal', cartSubTotal))
      ..add(DiagnosticsProperty('cartTax', cartTax))
      ..add(DiagnosticsProperty('cartTotal', cartTotal))
      ..add(DiagnosticsProperty('cartCurrency', cartCurrency))
      ..add(DiagnosticsProperty('cartDiscountPercent', cartDiscountPercent))
      ..add(DiagnosticsProperty('cartDiscountComputed', cartDiscountComputed))
      ..add(DiagnosticsProperty('voucherPotValue', voucherPotValue))
      ..add(DiagnosticsProperty('appliedVouchers', appliedVouchers))
      ..add(DiagnosticsProperty('deliverySlots', deliverySlots))
      ..add(DiagnosticsProperty('collectionSlots', collectionSlots))
      ..add(DiagnosticsProperty(
          'selectedDeliveryAddress', selectedDeliveryAddress))
      ..add(DiagnosticsProperty('selectedTimeSlot', selectedTimeSlot))
      ..add(DiagnosticsProperty('selectedTipAmount', selectedTipAmount))
      ..add(DiagnosticsProperty('discountCode', discountCode))
      ..add(DiagnosticsProperty('paymentIntentID', paymentIntentID))
      ..add(DiagnosticsProperty(
          'paymentIntentClientSecret', paymentIntentClientSecret))
      ..add(DiagnosticsProperty('paymentIntent', paymentIntent))
      ..add(DiagnosticsProperty('ephemeralKey', ephemeralKey))
      ..add(DiagnosticsProperty('publishableKey', publishableKey))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('selectedGBPxAmount', selectedGBPxAmount))
      ..add(DiagnosticsProperty('selectedPPLAmount', selectedPPLAmount))
      ..add(DiagnosticsProperty('payButtonLoading', payButtonLoading))
      ..add(DiagnosticsProperty('transferringTokens', transferringTokens))
      ..add(
          DiagnosticsProperty('errorCompletingPayment', errorCompletingPayment))
      ..add(DiagnosticsProperty('confirmedPayment', confirmedPayment))
      ..add(DiagnosticsProperty('restaurantName', restaurantName))
      ..add(DiagnosticsProperty('restaurantID', restaurantID))
      ..add(DiagnosticsProperty('restaurantIsLive', restaurantIsLive))
      ..add(DiagnosticsProperty('restaurantAddress', restaurantAddress))
      ..add(DiagnosticsProperty(
          'restaurantWalletAddress', restaurantWalletAddress))
      ..add(DiagnosticsProperty('fulfilmentMethod', fulfilmentMethod))
      ..add(
          DiagnosticsProperty('restaurantMinimumOrder', restaurantMinimumOrder))
      ..add(DiagnosticsProperty('restaurantPlatformFee', restaurantPlatformFee))
      ..add(DiagnosticsProperty('deliveryInstructions', deliveryInstructions))
      ..add(DiagnosticsProperty('selectedPaymentMethod', selectedPaymentMethod))
      ..add(DiagnosticsProperty(
          'fulfilmentPostalDistricts', fulfilmentPostalDistricts))
      ..add(DiagnosticsProperty('eligibleOrderDates', eligibleOrderDates))
      ..add(DiagnosticsProperty('nextCollectionSlot', nextCollectionSlot))
      ..add(DiagnosticsProperty('nextDeliverySlot', nextDeliverySlot))
      ..add(DiagnosticsProperty('productSuggestion', productSuggestion))
      ..add(DiagnosticsProperty(
          'orderCreationProcessStatus', orderCreationProcessStatus))
      ..add(DiagnosticsProperty('stripePaymentStatus', stripePaymentStatus))
      ..add(DiagnosticsProperty('paymentInProcess', paymentInProcess))
      ..add(DiagnosticsProperty('isLoadingCartState', isLoadingCartState))
      ..add(DiagnosticsProperty('errorDetails', errorDetails));
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
            (identical(other.cartCurrency, cartCurrency) ||
                other.cartCurrency == cartCurrency) &&
            (identical(other.cartDiscountPercent, cartDiscountPercent) ||
                other.cartDiscountPercent == cartDiscountPercent) &&
            (identical(other.cartDiscountComputed, cartDiscountComputed) ||
                other.cartDiscountComputed == cartDiscountComputed) &&
            (identical(other.voucherPotValue, voucherPotValue) ||
                other.voucherPotValue == voucherPotValue) &&
            const DeepCollectionEquality()
                .equals(other.appliedVouchers, appliedVouchers) &&
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
            (identical(other.paymentIntentClientSecret, paymentIntentClientSecret) ||
                other.paymentIntentClientSecret == paymentIntentClientSecret) &&
            (identical(other.paymentIntent, paymentIntent) ||
                other.paymentIntent == paymentIntent) &&
            (identical(other.ephemeralKey, ephemeralKey) ||
                other.ephemeralKey == ephemeralKey) &&
            (identical(other.publishableKey, publishableKey) ||
                other.publishableKey == publishableKey) &&
            (identical(other.order, order) || other.order == order) &&
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
            (identical(other.restaurantIsLive, restaurantIsLive) ||
                other.restaurantIsLive == restaurantIsLive) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                other.restaurantAddress == restaurantAddress) &&
            (identical(other.restaurantWalletAddress, restaurantWalletAddress) ||
                other.restaurantWalletAddress == restaurantWalletAddress) &&
            (identical(other.fulfilmentMethod, fulfilmentMethod) ||
                other.fulfilmentMethod == fulfilmentMethod) &&
            (identical(other.restaurantMinimumOrder, restaurantMinimumOrder) ||
                other.restaurantMinimumOrder == restaurantMinimumOrder) &&
            (identical(other.restaurantPlatformFee, restaurantPlatformFee) || other.restaurantPlatformFee == restaurantPlatformFee) &&
            (identical(other.deliveryInstructions, deliveryInstructions) || other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) || other.selectedPaymentMethod == selectedPaymentMethod) &&
            const DeepCollectionEquality().equals(other.fulfilmentPostalDistricts, fulfilmentPostalDistricts) &&
            const DeepCollectionEquality().equals(other.eligibleOrderDates, eligibleOrderDates) &&
            (identical(other.nextCollectionSlot, nextCollectionSlot) || other.nextCollectionSlot == nextCollectionSlot) &&
            (identical(other.nextDeliverySlot, nextDeliverySlot) || other.nextDeliverySlot == nextDeliverySlot) &&
            (identical(other.productSuggestion, productSuggestion) || other.productSuggestion == productSuggestion) &&
            (identical(other.orderCreationProcessStatus, orderCreationProcessStatus) || other.orderCreationProcessStatus == orderCreationProcessStatus) &&
            (identical(other.stripePaymentStatus, stripePaymentStatus) || other.stripePaymentStatus == stripePaymentStatus) &&
            (identical(other.paymentInProcess, paymentInProcess) || other.paymentInProcess == paymentInProcess) &&
            (identical(other.isLoadingCartState, isLoadingCartState) || other.isLoadingCartState == isLoadingCartState) &&
            (identical(other.errorDetails, errorDetails) || other.errorDetails == errorDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(cartItems),
        cartSubTotal,
        cartTax,
        cartTotal,
        cartCurrency,
        cartDiscountPercent,
        cartDiscountComputed,
        voucherPotValue,
        const DeepCollectionEquality().hash(appliedVouchers),
        const DeepCollectionEquality().hash(deliverySlots),
        const DeepCollectionEquality().hash(collectionSlots),
        selectedDeliveryAddress,
        selectedTimeSlot,
        selectedTipAmount,
        discountCode,
        paymentIntentID,
        paymentIntentClientSecret,
        paymentIntent,
        ephemeralKey,
        publishableKey,
        order,
        selectedGBPxAmount,
        selectedPPLAmount,
        payButtonLoading,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
        restaurantName,
        restaurantID,
        restaurantIsLive,
        restaurantAddress,
        restaurantWalletAddress,
        fulfilmentMethod,
        restaurantMinimumOrder,
        restaurantPlatformFee,
        deliveryInstructions,
        selectedPaymentMethod,
        const DeepCollectionEquality().hash(fulfilmentPostalDistricts),
        const DeepCollectionEquality().hash(eligibleOrderDates),
        nextCollectionSlot,
        nextDeliverySlot,
        productSuggestion,
        orderCreationProcessStatus,
        stripePaymentStatus,
        paymentInProcess,
        isLoadingCartState,
        errorDetails
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
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money cartSubTotal,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money cartTax,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money cartTotal,
      final Currency cartCurrency,
      final num cartDiscountPercent,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money cartDiscountComputed,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money voucherPotValue,
      final List<Discount> appliedVouchers,
      final List<TimeSlot> deliverySlots,
      final List<TimeSlot> collectionSlots,
      final DeliveryAddresses? selectedDeliveryAddress,
      final TimeSlot? selectedTimeSlot,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money selectedTipAmount,
      final String discountCode,
      final String paymentIntentID,
      @JsonKey(ignore: true)
          final String paymentIntentClientSecret,
      @JsonKey(ignore: true)
          final StripePaymentIntent? paymentIntent,
      final String ephemeralKey,
      final String publishableKey,
      final Order? order,
      final double selectedGBPxAmount,
      final double selectedPPLAmount,
      final bool payButtonLoading,
      final bool transferringTokens,
      final bool errorCompletingPayment,
      final bool confirmedPayment,
      final String restaurantName,
      final String restaurantID,
      final bool restaurantIsLive,
      final DeliveryAddresses? restaurantAddress,
      final String restaurantWalletAddress,
      final FulfilmentMethodType fulfilmentMethod,
      final int restaurantMinimumOrder,
      @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
          final Money restaurantPlatformFee,
      final String deliveryInstructions,
      final PaymentMethod? selectedPaymentMethod,
      final List<String> fulfilmentPostalDistricts,
      final List<DateTime> eligibleOrderDates,
      final TimeSlot? nextCollectionSlot,
      final TimeSlot? nextDeliverySlot,
      final ProductSuggestion? productSuggestion,
      final OrderCreationProcessStatus orderCreationProcessStatus,
      final StripePaymentStatus stripePaymentStatus,
      @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
          final LivePayment? paymentInProcess,
      @JsonKey(ignore: true)
          final bool isLoadingCartState,
      @JsonKey(ignore: true)
          final ErrorDetails<CartErrCode>? errorDetails}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  List<CartItem> get cartItems;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartSubTotal;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartTax;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartTotal;
  @override
  Currency get cartCurrency;
  @override
  num get cartDiscountPercent;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get cartDiscountComputed;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get voucherPotValue;
  @override
  List<Discount> get appliedVouchers;
  @override
  List<TimeSlot> get deliverySlots;
  @override
  List<TimeSlot> get collectionSlots;
  @override
  DeliveryAddresses? get selectedDeliveryAddress;
  @override
  TimeSlot? get selectedTimeSlot;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get selectedTipAmount;
  @override
  String get discountCode;
  @override
  String get paymentIntentID;
  @override
  @JsonKey(ignore: true)
  String get paymentIntentClientSecret;
  @override
  @JsonKey(ignore: true)
  StripePaymentIntent? get paymentIntent;
  @override
  String get ephemeralKey;
  @override
  String get publishableKey;
  @override
  Order? get order;
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
  bool get restaurantIsLive;
  @override
  DeliveryAddresses? get restaurantAddress;
  @override
  String get restaurantWalletAddress;
  @override
  FulfilmentMethodType get fulfilmentMethod;
  @override
  int get restaurantMinimumOrder;
  @override
  @JsonKey(fromJson: Money.fromJson, toJson: Money.toJson)
  Money get restaurantPlatformFee;
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
  ProductSuggestion? get productSuggestion;
  @override
  OrderCreationProcessStatus get orderCreationProcessStatus;
  @override
  StripePaymentStatus get stripePaymentStatus;
  @override
  @JsonKey(fromJson: LivePayment.fromJson, toJson: paymentInProcessToJson)
  LivePayment? get paymentInProcess;
  @override
  @JsonKey(ignore: true)
  bool get isLoadingCartState;
  @override
  @JsonKey(ignore: true)
  ErrorDetails<CartErrCode>? get errorDetails;
  @override
  @JsonKey(ignore: true)
  _$$_UserCartStateCopyWith<_$_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
