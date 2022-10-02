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
  @JsonKey(ignore: true)
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartSubTotal => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartTax => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartTotal => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get cartDeliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Map<String, String>> get deliverySlots =>
      throw _privateConstructorUsedError;
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  EligibleOrderDates get eligibleCollectionDates =>
      throw _privateConstructorUsedError;
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  EligibleOrderDates get eligibleDeliveryDates =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Map<String, String>> get collectionSlots =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DeliveryAddresses? get selectedDeliveryAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Map<String, String> get selectedTimeSlot =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get selectedTipAmount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get discountCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get paymentIntentID => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get orderID => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get transferringTokens => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get confirmedPayment => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get restaurantName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get restaurantID => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DeliveryAddresses? get restaurantAddress =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get collectionCharge => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  FulfilmentMethod get fulfilmentMethod => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool get isDelivery => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get restaurantMinimumOrder => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get restaurantPlatformFee => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get deliveryMethodId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get collectionMethodId => throw _privateConstructorUsedError;

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
      {@JsonKey(ignore: true)
          List<CartItem> cartItems,
      @JsonKey(ignore: true)
          int cartSubTotal,
      @JsonKey(ignore: true)
          int cartTax,
      @JsonKey(ignore: true)
          int cartTotal,
      @JsonKey(ignore: true)
          int cartDiscountPercent,
      @JsonKey(ignore: true)
          int cartDiscountComputed,
      @JsonKey(ignore: true)
          int cartDeliveryCharge,
      @JsonKey(ignore: true)
          List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          EligibleOrderDates eligibleCollectionDates,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          EligibleOrderDates eligibleDeliveryDates,
      @JsonKey(ignore: true)
          List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true)
          DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true)
          Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true)
          int selectedTipAmount,
      @JsonKey(ignore: true)
          String discountCode,
      @JsonKey(ignore: true)
          String paymentIntentID,
      @JsonKey(ignore: true)
          String orderID,
      @JsonKey(ignore: true)
          double selectedGBPxAmount,
      @JsonKey(ignore: true)
          double selectedPPLAmount,
      @JsonKey(ignore: true)
          bool transferringTokens,
      @JsonKey(ignore: true)
          bool errorCompletingPayment,
      @JsonKey(ignore: true)
          bool confirmedPayment,
      @JsonKey(ignore: true)
          String restaurantName,
      @JsonKey(ignore: true)
          String restaurantID,
      @JsonKey(ignore: true)
          DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true)
          String restaurantWalletAddress,
      @JsonKey(ignore: true)
          int deliveryCharge,
      @JsonKey(ignore: true)
          int collectionCharge,
      @JsonKey(ignore: true)
          FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true)
          bool isDelivery,
      @JsonKey(ignore: true)
          int restaurantMinimumOrder,
      @JsonKey(ignore: true)
          int restaurantPlatformFee,
      @JsonKey(ignore: true)
          String deliveryInstructions,
      @JsonKey(ignore: true)
          int deliveryMethodId,
      @JsonKey(ignore: true)
          int collectionMethodId});

  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates;
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates;
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
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
    Object? cartDeliveryCharge = freezed,
    Object? deliverySlots = freezed,
    Object? eligibleCollectionDates = freezed,
    Object? eligibleDeliveryDates = freezed,
    Object? collectionSlots = freezed,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = freezed,
    Object? discountCode = freezed,
    Object? paymentIntentID = freezed,
    Object? orderID = freezed,
    Object? selectedGBPxAmount = freezed,
    Object? selectedPPLAmount = freezed,
    Object? transferringTokens = freezed,
    Object? errorCompletingPayment = freezed,
    Object? confirmedPayment = freezed,
    Object? restaurantName = freezed,
    Object? restaurantID = freezed,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = freezed,
    Object? deliveryCharge = freezed,
    Object? collectionCharge = freezed,
    Object? fulfilmentMethod = freezed,
    Object? isDelivery = freezed,
    Object? restaurantMinimumOrder = freezed,
    Object? restaurantPlatformFee = freezed,
    Object? deliveryInstructions = freezed,
    Object? deliveryMethodId = freezed,
    Object? collectionMethodId = freezed,
  }) {
    return _then(_value.copyWith(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
      cartDeliveryCharge: cartDeliveryCharge == freezed
          ? _value.cartDeliveryCharge
          : cartDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: deliverySlots == freezed
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      eligibleCollectionDates: eligibleCollectionDates == freezed
          ? _value.eligibleCollectionDates
          : eligibleCollectionDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      eligibleDeliveryDates: eligibleDeliveryDates == freezed
          ? _value.eligibleDeliveryDates
          : eligibleDeliveryDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      collectionSlots: collectionSlots == freezed
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedDeliveryAddress: selectedDeliveryAddress == freezed
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: selectedTimeSlot == freezed
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      selectedTipAmount: selectedTipAmount == freezed
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: selectedGBPxAmount == freezed
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: selectedPPLAmount == freezed
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transferringTokens: transferringTokens == freezed
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: errorCompletingPayment == freezed
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: confirmedPayment == freezed
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: restaurantAddress == freezed
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      restaurantWalletAddress: restaurantWalletAddress == freezed
          ? _value.restaurantWalletAddress
          : restaurantWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCharge: deliveryCharge == freezed
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharge: collectionCharge == freezed
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentMethod: fulfilmentMethod == freezed
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
      isDelivery: isDelivery == freezed
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantMinimumOrder: restaurantMinimumOrder == freezed
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: restaurantPlatformFee == freezed
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryInstructions: deliveryInstructions == freezed
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryMethodId: deliveryMethodId == freezed
          ? _value.deliveryMethodId
          : deliveryMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionMethodId: collectionMethodId == freezed
          ? _value.collectionMethodId
          : collectionMethodId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates {
    return $EligibleOrderDatesCopyWith<$Res>(_value.eligibleCollectionDates,
        (value) {
      return _then(_value.copyWith(eligibleCollectionDates: value));
    });
  }

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates {
    return $EligibleOrderDatesCopyWith<$Res>(_value.eligibleDeliveryDates,
        (value) {
      return _then(_value.copyWith(eligibleDeliveryDates: value));
    });
  }

  @override
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress {
    if (_value.selectedDeliveryAddress == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.selectedDeliveryAddress!,
        (value) {
      return _then(_value.copyWith(selectedDeliveryAddress: value));
    });
  }

  @override
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress {
    if (_value.restaurantAddress == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.restaurantAddress!, (value) {
      return _then(_value.copyWith(restaurantAddress: value));
    });
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
      {@JsonKey(ignore: true)
          List<CartItem> cartItems,
      @JsonKey(ignore: true)
          int cartSubTotal,
      @JsonKey(ignore: true)
          int cartTax,
      @JsonKey(ignore: true)
          int cartTotal,
      @JsonKey(ignore: true)
          int cartDiscountPercent,
      @JsonKey(ignore: true)
          int cartDiscountComputed,
      @JsonKey(ignore: true)
          int cartDeliveryCharge,
      @JsonKey(ignore: true)
          List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          EligibleOrderDates eligibleCollectionDates,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          EligibleOrderDates eligibleDeliveryDates,
      @JsonKey(ignore: true)
          List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true)
          DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true)
          Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true)
          int selectedTipAmount,
      @JsonKey(ignore: true)
          String discountCode,
      @JsonKey(ignore: true)
          String paymentIntentID,
      @JsonKey(ignore: true)
          String orderID,
      @JsonKey(ignore: true)
          double selectedGBPxAmount,
      @JsonKey(ignore: true)
          double selectedPPLAmount,
      @JsonKey(ignore: true)
          bool transferringTokens,
      @JsonKey(ignore: true)
          bool errorCompletingPayment,
      @JsonKey(ignore: true)
          bool confirmedPayment,
      @JsonKey(ignore: true)
          String restaurantName,
      @JsonKey(ignore: true)
          String restaurantID,
      @JsonKey(ignore: true)
          DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true)
          String restaurantWalletAddress,
      @JsonKey(ignore: true)
          int deliveryCharge,
      @JsonKey(ignore: true)
          int collectionCharge,
      @JsonKey(ignore: true)
          FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true)
          bool isDelivery,
      @JsonKey(ignore: true)
          int restaurantMinimumOrder,
      @JsonKey(ignore: true)
          int restaurantPlatformFee,
      @JsonKey(ignore: true)
          String deliveryInstructions,
      @JsonKey(ignore: true)
          int deliveryMethodId,
      @JsonKey(ignore: true)
          int collectionMethodId});

  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleCollectionDates;
  @override
  $EligibleOrderDatesCopyWith<$Res> get eligibleDeliveryDates;
  @override
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  @override
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
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
    Object? cartDeliveryCharge = freezed,
    Object? deliverySlots = freezed,
    Object? eligibleCollectionDates = freezed,
    Object? eligibleDeliveryDates = freezed,
    Object? collectionSlots = freezed,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = freezed,
    Object? selectedTipAmount = freezed,
    Object? discountCode = freezed,
    Object? paymentIntentID = freezed,
    Object? orderID = freezed,
    Object? selectedGBPxAmount = freezed,
    Object? selectedPPLAmount = freezed,
    Object? transferringTokens = freezed,
    Object? errorCompletingPayment = freezed,
    Object? confirmedPayment = freezed,
    Object? restaurantName = freezed,
    Object? restaurantID = freezed,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = freezed,
    Object? deliveryCharge = freezed,
    Object? collectionCharge = freezed,
    Object? fulfilmentMethod = freezed,
    Object? isDelivery = freezed,
    Object? restaurantMinimumOrder = freezed,
    Object? restaurantPlatformFee = freezed,
    Object? deliveryInstructions = freezed,
    Object? deliveryMethodId = freezed,
    Object? collectionMethodId = freezed,
  }) {
    return _then(_UserCartState(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
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
      cartDeliveryCharge: cartDeliveryCharge == freezed
          ? _value.cartDeliveryCharge
          : cartDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: deliverySlots == freezed
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      eligibleCollectionDates: eligibleCollectionDates == freezed
          ? _value.eligibleCollectionDates
          : eligibleCollectionDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      eligibleDeliveryDates: eligibleDeliveryDates == freezed
          ? _value.eligibleDeliveryDates
          : eligibleDeliveryDates // ignore: cast_nullable_to_non_nullable
              as EligibleOrderDates,
      collectionSlots: collectionSlots == freezed
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedDeliveryAddress: selectedDeliveryAddress == freezed
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: selectedTimeSlot == freezed
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      selectedTipAmount: selectedTipAmount == freezed
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIntentID: paymentIntentID == freezed
          ? _value.paymentIntentID
          : paymentIntentID // ignore: cast_nullable_to_non_nullable
              as String,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGBPxAmount: selectedGBPxAmount == freezed
          ? _value.selectedGBPxAmount
          : selectedGBPxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      selectedPPLAmount: selectedPPLAmount == freezed
          ? _value.selectedPPLAmount
          : selectedPPLAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transferringTokens: transferringTokens == freezed
          ? _value.transferringTokens
          : transferringTokens // ignore: cast_nullable_to_non_nullable
              as bool,
      errorCompletingPayment: errorCompletingPayment == freezed
          ? _value.errorCompletingPayment
          : errorCompletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmedPayment: confirmedPayment == freezed
          ? _value.confirmedPayment
          : confirmedPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: restaurantAddress == freezed
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      restaurantWalletAddress: restaurantWalletAddress == freezed
          ? _value.restaurantWalletAddress
          : restaurantWalletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCharge: deliveryCharge == freezed
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharge: collectionCharge == freezed
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentMethod: fulfilmentMethod == freezed
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
      isDelivery: isDelivery == freezed
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurantMinimumOrder: restaurantMinimumOrder == freezed
          ? _value.restaurantMinimumOrder
          : restaurantMinimumOrder // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantPlatformFee: restaurantPlatformFee == freezed
          ? _value.restaurantPlatformFee
          : restaurantPlatformFee // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryInstructions: deliveryInstructions == freezed
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryMethodId: deliveryMethodId == freezed
          ? _value.deliveryMethodId
          : deliveryMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionMethodId: collectionMethodId == freezed
          ? _value.collectionMethodId
          : collectionMethodId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState {
  _$_UserCartState(
      {@JsonKey(ignore: true)
          this.cartItems = const [],
      @JsonKey(ignore: true)
          this.cartSubTotal = 0,
      @JsonKey(ignore: true)
          this.cartTax = 0,
      @JsonKey(ignore: true)
          this.cartTotal = 0,
      @JsonKey(ignore: true)
          this.cartDiscountPercent = 0,
      @JsonKey(ignore: true)
          this.cartDiscountComputed = 0,
      @JsonKey(ignore: true)
          this.cartDeliveryCharge = 0,
      @JsonKey(ignore: true)
          this.deliverySlots = const [],
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          this.eligibleCollectionDates = const EligibleOrderDates(),
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          this.eligibleDeliveryDates = const EligibleOrderDates(),
      @JsonKey(ignore: true)
          this.collectionSlots = const [],
      @JsonKey(ignore: true)
          this.selectedDeliveryAddress = null,
      @JsonKey(ignore: true)
          this.selectedTimeSlot = const {},
      @JsonKey(ignore: true)
          this.selectedTipAmount = 0,
      @JsonKey(ignore: true)
          this.discountCode = "",
      @JsonKey(ignore: true)
          this.paymentIntentID = "",
      @JsonKey(ignore: true)
          this.orderID = "",
      @JsonKey(ignore: true)
          this.selectedGBPxAmount = 0.0,
      @JsonKey(ignore: true)
          this.selectedPPLAmount = 0.0,
      @JsonKey(ignore: true)
          this.transferringTokens = false,
      @JsonKey(ignore: true)
          this.errorCompletingPayment = false,
      @JsonKey(ignore: true)
          this.confirmedPayment = false,
      @JsonKey(ignore: true)
          this.restaurantName = "",
      @JsonKey(ignore: true)
          this.restaurantID = "",
      @JsonKey(ignore: true)
          this.restaurantAddress = null,
      @JsonKey(ignore: true)
          this.restaurantWalletAddress = "",
      @JsonKey(ignore: true)
          this.deliveryCharge = 0,
      @JsonKey(ignore: true)
          this.collectionCharge = 0,
      @JsonKey(ignore: true)
          this.fulfilmentMethod = FulfilmentMethod.delivery,
      @JsonKey(ignore: true)
          this.isDelivery = false,
      @JsonKey(ignore: true)
          this.restaurantMinimumOrder = 0,
      @JsonKey(ignore: true)
          this.restaurantPlatformFee = 0,
      @JsonKey(ignore: true)
          this.deliveryInstructions = "",
      @JsonKey(ignore: true)
          this.deliveryMethodId = 0,
      @JsonKey(ignore: true)
          this.collectionMethodId = 0})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final List<CartItem> cartItems;
  @override
  @JsonKey(ignore: true)
  final int cartSubTotal;
  @override
  @JsonKey(ignore: true)
  final int cartTax;
  @override
  @JsonKey(ignore: true)
  final int cartTotal;
  @override
  @JsonKey(ignore: true)
  final int cartDiscountPercent;
  @override
  @JsonKey(ignore: true)
  final int cartDiscountComputed;
  @override
  @JsonKey(ignore: true)
  final int cartDeliveryCharge;
  @override
  @JsonKey(ignore: true)
  final List<Map<String, String>> deliverySlots;
  @override
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  final EligibleOrderDates eligibleCollectionDates;
  @override
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  final EligibleOrderDates eligibleDeliveryDates;
  @override
  @JsonKey(ignore: true)
  final List<Map<String, String>> collectionSlots;
  @override
  @JsonKey(ignore: true)
  final DeliveryAddresses? selectedDeliveryAddress;
  @override
  @JsonKey(ignore: true)
  final Map<String, String> selectedTimeSlot;
  @override
  @JsonKey(ignore: true)
  final int selectedTipAmount;
  @override
  @JsonKey(ignore: true)
  final String discountCode;
  @override
  @JsonKey(ignore: true)
  final String paymentIntentID;
  @override
  @JsonKey(ignore: true)
  final String orderID;
  @override
  @JsonKey(ignore: true)
  final double selectedGBPxAmount;
  @override
  @JsonKey(ignore: true)
  final double selectedPPLAmount;
  @override
  @JsonKey(ignore: true)
  final bool transferringTokens;
  @override
  @JsonKey(ignore: true)
  final bool errorCompletingPayment;
  @override
  @JsonKey(ignore: true)
  final bool confirmedPayment;
  @override
  @JsonKey(ignore: true)
  final String restaurantName;
  @override
  @JsonKey(ignore: true)
  final String restaurantID;
  @override
  @JsonKey(ignore: true)
  final DeliveryAddresses? restaurantAddress;
  @override
  @JsonKey(ignore: true)
  final String restaurantWalletAddress;
  @override
  @JsonKey(ignore: true)
  final int deliveryCharge;
  @override
  @JsonKey(ignore: true)
  final int collectionCharge;
  @override
  @JsonKey(ignore: true)
  final FulfilmentMethod fulfilmentMethod;
  @override
  @JsonKey(ignore: true)
  final bool isDelivery;
  @override
  @JsonKey(ignore: true)
  final int restaurantMinimumOrder;
  @override
  @JsonKey(ignore: true)
  final int restaurantPlatformFee;
  @override
  @JsonKey(ignore: true)
  final String deliveryInstructions;
  @override
  @JsonKey(ignore: true)
  final int deliveryMethodId;
  @override
  @JsonKey(ignore: true)
  final int collectionMethodId;

  @override
  String toString() {
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed, cartDeliveryCharge: $cartDeliveryCharge, deliverySlots: $deliverySlots, eligibleCollectionDates: $eligibleCollectionDates, eligibleDeliveryDates: $eligibleDeliveryDates, collectionSlots: $collectionSlots, selectedDeliveryAddress: $selectedDeliveryAddress, selectedTimeSlot: $selectedTimeSlot, selectedTipAmount: $selectedTipAmount, discountCode: $discountCode, paymentIntentID: $paymentIntentID, orderID: $orderID, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, restaurantID: $restaurantID, restaurantAddress: $restaurantAddress, restaurantWalletAddress: $restaurantWalletAddress, deliveryCharge: $deliveryCharge, collectionCharge: $collectionCharge, fulfilmentMethod: $fulfilmentMethod, isDelivery: $isDelivery, restaurantMinimumOrder: $restaurantMinimumOrder, restaurantPlatformFee: $restaurantPlatformFee, deliveryInstructions: $deliveryInstructions, deliveryMethodId: $deliveryMethodId, collectionMethodId: $collectionMethodId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCartState &&
            const DeepCollectionEquality().equals(other.cartItems, cartItems) &&
            const DeepCollectionEquality()
                .equals(other.cartSubTotal, cartSubTotal) &&
            const DeepCollectionEquality().equals(other.cartTax, cartTax) &&
            const DeepCollectionEquality().equals(other.cartTotal, cartTotal) &&
            const DeepCollectionEquality()
                .equals(other.cartDiscountPercent, cartDiscountPercent) &&
            const DeepCollectionEquality()
                .equals(other.cartDiscountComputed, cartDiscountComputed) &&
            const DeepCollectionEquality()
                .equals(other.cartDeliveryCharge, cartDeliveryCharge) &&
            const DeepCollectionEquality()
                .equals(other.deliverySlots, deliverySlots) &&
            const DeepCollectionEquality().equals(
                other.eligibleCollectionDates, eligibleCollectionDates) &&
            const DeepCollectionEquality()
                .equals(other.eligibleDeliveryDates, eligibleDeliveryDates) &&
            const DeepCollectionEquality()
                .equals(other.collectionSlots, collectionSlots) &&
            const DeepCollectionEquality().equals(
                other.selectedDeliveryAddress, selectedDeliveryAddress) &&
            const DeepCollectionEquality()
                .equals(other.selectedTimeSlot, selectedTimeSlot) &&
            const DeepCollectionEquality()
                .equals(other.selectedTipAmount, selectedTipAmount) &&
            const DeepCollectionEquality()
                .equals(other.discountCode, discountCode) &&
            const DeepCollectionEquality()
                .equals(other.paymentIntentID, paymentIntentID) &&
            const DeepCollectionEquality().equals(other.orderID, orderID) &&
            const DeepCollectionEquality()
                .equals(other.selectedGBPxAmount, selectedGBPxAmount) &&
            const DeepCollectionEquality()
                .equals(other.selectedPPLAmount, selectedPPLAmount) &&
            const DeepCollectionEquality()
                .equals(other.transferringTokens, transferringTokens) &&
            const DeepCollectionEquality()
                .equals(other.errorCompletingPayment, errorCompletingPayment) &&
            const DeepCollectionEquality()
                .equals(other.confirmedPayment, confirmedPayment) &&
            const DeepCollectionEquality()
                .equals(other.restaurantName, restaurantName) &&
            const DeepCollectionEquality()
                .equals(other.restaurantID, restaurantID) &&
            const DeepCollectionEquality()
                .equals(other.restaurantAddress, restaurantAddress) &&
            const DeepCollectionEquality().equals(
                other.restaurantWalletAddress, restaurantWalletAddress) &&
            const DeepCollectionEquality()
                .equals(other.deliveryCharge, deliveryCharge) &&
            const DeepCollectionEquality()
                .equals(other.collectionCharge, collectionCharge) &&
            const DeepCollectionEquality()
                .equals(other.fulfilmentMethod, fulfilmentMethod) &&
            const DeepCollectionEquality()
                .equals(other.isDelivery, isDelivery) &&
            const DeepCollectionEquality()
                .equals(other.restaurantMinimumOrder, restaurantMinimumOrder) &&
            const DeepCollectionEquality()
                .equals(other.restaurantPlatformFee, restaurantPlatformFee) &&
            const DeepCollectionEquality()
                .equals(other.deliveryInstructions, deliveryInstructions) &&
            const DeepCollectionEquality()
                .equals(other.deliveryMethodId, deliveryMethodId) &&
            const DeepCollectionEquality()
                .equals(other.collectionMethodId, collectionMethodId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(cartItems),
        const DeepCollectionEquality().hash(cartSubTotal),
        const DeepCollectionEquality().hash(cartTax),
        const DeepCollectionEquality().hash(cartTotal),
        const DeepCollectionEquality().hash(cartDiscountPercent),
        const DeepCollectionEquality().hash(cartDiscountComputed),
        const DeepCollectionEquality().hash(cartDeliveryCharge),
        const DeepCollectionEquality().hash(deliverySlots),
        const DeepCollectionEquality().hash(eligibleCollectionDates),
        const DeepCollectionEquality().hash(eligibleDeliveryDates),
        const DeepCollectionEquality().hash(collectionSlots),
        const DeepCollectionEquality().hash(selectedDeliveryAddress),
        const DeepCollectionEquality().hash(selectedTimeSlot),
        const DeepCollectionEquality().hash(selectedTipAmount),
        const DeepCollectionEquality().hash(discountCode),
        const DeepCollectionEquality().hash(paymentIntentID),
        const DeepCollectionEquality().hash(orderID),
        const DeepCollectionEquality().hash(selectedGBPxAmount),
        const DeepCollectionEquality().hash(selectedPPLAmount),
        const DeepCollectionEquality().hash(transferringTokens),
        const DeepCollectionEquality().hash(errorCompletingPayment),
        const DeepCollectionEquality().hash(confirmedPayment),
        const DeepCollectionEquality().hash(restaurantName),
        const DeepCollectionEquality().hash(restaurantID),
        const DeepCollectionEquality().hash(restaurantAddress),
        const DeepCollectionEquality().hash(restaurantWalletAddress),
        const DeepCollectionEquality().hash(deliveryCharge),
        const DeepCollectionEquality().hash(collectionCharge),
        const DeepCollectionEquality().hash(fulfilmentMethod),
        const DeepCollectionEquality().hash(isDelivery),
        const DeepCollectionEquality().hash(restaurantMinimumOrder),
        const DeepCollectionEquality().hash(restaurantPlatformFee),
        const DeepCollectionEquality().hash(deliveryInstructions),
        const DeepCollectionEquality().hash(deliveryMethodId),
        const DeepCollectionEquality().hash(collectionMethodId)
      ]);

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
      {@JsonKey(ignore: true)
          final List<CartItem> cartItems,
      @JsonKey(ignore: true)
          final int cartSubTotal,
      @JsonKey(ignore: true)
          final int cartTax,
      @JsonKey(ignore: true)
          final int cartTotal,
      @JsonKey(ignore: true)
          final int cartDiscountPercent,
      @JsonKey(ignore: true)
          final int cartDiscountComputed,
      @JsonKey(ignore: true)
          final int cartDeliveryCharge,
      @JsonKey(ignore: true)
          final List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          final EligibleOrderDates eligibleCollectionDates,
      @JsonKey(ignore: true, fromJson: eligibleOrderDatesFromJson, toJson: eligibleOrderDatesToJson)
          final EligibleOrderDates eligibleDeliveryDates,
      @JsonKey(ignore: true)
          final List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true)
          final DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true)
          final Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true)
          final int selectedTipAmount,
      @JsonKey(ignore: true)
          final String discountCode,
      @JsonKey(ignore: true)
          final String paymentIntentID,
      @JsonKey(ignore: true)
          final String orderID,
      @JsonKey(ignore: true)
          final double selectedGBPxAmount,
      @JsonKey(ignore: true)
          final double selectedPPLAmount,
      @JsonKey(ignore: true)
          final bool transferringTokens,
      @JsonKey(ignore: true)
          final bool errorCompletingPayment,
      @JsonKey(ignore: true)
          final bool confirmedPayment,
      @JsonKey(ignore: true)
          final String restaurantName,
      @JsonKey(ignore: true)
          final String restaurantID,
      @JsonKey(ignore: true)
          final DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true)
          final String restaurantWalletAddress,
      @JsonKey(ignore: true)
          final int deliveryCharge,
      @JsonKey(ignore: true)
          final int collectionCharge,
      @JsonKey(ignore: true)
          final FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true)
          final bool isDelivery,
      @JsonKey(ignore: true)
          final int restaurantMinimumOrder,
      @JsonKey(ignore: true)
          final int restaurantPlatformFee,
      @JsonKey(ignore: true)
          final String deliveryInstructions,
      @JsonKey(ignore: true)
          final int deliveryMethodId,
      @JsonKey(ignore: true)
          final int collectionMethodId}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  @JsonKey(ignore: true)
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartSubTotal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartTax => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartTotal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get cartDeliveryCharge => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<Map<String, String>> get deliverySlots =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  EligibleOrderDates get eligibleCollectionDates =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(
      ignore: true,
      fromJson: eligibleOrderDatesFromJson,
      toJson: eligibleOrderDatesToJson)
  EligibleOrderDates get eligibleDeliveryDates =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<Map<String, String>> get collectionSlots =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  DeliveryAddresses? get selectedDeliveryAddress =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Map<String, String> get selectedTimeSlot =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get selectedTipAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get discountCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get paymentIntentID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get orderID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get transferringTokens => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get confirmedPayment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get restaurantName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get restaurantID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  DeliveryAddresses? get restaurantAddress =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get deliveryCharge => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get collectionCharge => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  FulfilmentMethod get fulfilmentMethod => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  bool get isDelivery => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get restaurantMinimumOrder => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get restaurantPlatformFee => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  String get deliveryInstructions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get deliveryMethodId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  int get collectionMethodId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
