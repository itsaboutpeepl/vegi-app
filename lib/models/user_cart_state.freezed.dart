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
      _$UserCartStateCopyWithImpl<$Res, UserCartState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) List<CartItem> cartItems,
      @JsonKey(ignore: true) int cartSubTotal,
      @JsonKey(ignore: true) int cartTax,
      @JsonKey(ignore: true) int cartTotal,
      @JsonKey(ignore: true) int cartDiscountPercent,
      @JsonKey(ignore: true) int cartDiscountComputed,
      @JsonKey(ignore: true) int cartDeliveryCharge,
      @JsonKey(ignore: true) List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true) List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true) DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true) Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true) int selectedTipAmount,
      @JsonKey(ignore: true) String discountCode,
      @JsonKey(ignore: true) String paymentIntentID,
      @JsonKey(ignore: true) String orderID,
      @JsonKey(ignore: true) double selectedGBPxAmount,
      @JsonKey(ignore: true) double selectedPPLAmount,
      @JsonKey(ignore: true) bool transferringTokens,
      @JsonKey(ignore: true) bool errorCompletingPayment,
      @JsonKey(ignore: true) bool confirmedPayment,
      @JsonKey(ignore: true) String restaurantName,
      @JsonKey(ignore: true) String restaurantID,
      @JsonKey(ignore: true) DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true) String restaurantWalletAddress,
      @JsonKey(ignore: true) int deliveryCharge,
      @JsonKey(ignore: true) int collectionCharge,
      @JsonKey(ignore: true) FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true) bool isDelivery,
      @JsonKey(ignore: true) int restaurantMinimumOrder,
      @JsonKey(ignore: true) int restaurantPlatformFee,
      @JsonKey(ignore: true) String deliveryInstructions,
      @JsonKey(ignore: true) int deliveryMethodId,
      @JsonKey(ignore: true) int collectionMethodId});

  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
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
    Object? cartDeliveryCharge = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = null,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? deliveryCharge = null,
    Object? collectionCharge = null,
    Object? fulfilmentMethod = null,
    Object? isDelivery = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? deliveryMethodId = null,
    Object? collectionMethodId = null,
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
      cartDeliveryCharge: null == cartDeliveryCharge
          ? _value.cartDeliveryCharge
          : cartDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedDeliveryAddress: freezed == selectedDeliveryAddress
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: null == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharge: null == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
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
      deliveryMethodId: null == deliveryMethodId
          ? _value.deliveryMethodId
          : deliveryMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionMethodId: null == collectionMethodId
          ? _value.collectionMethodId
          : collectionMethodId // ignore: cast_nullable_to_non_nullable
              as int,
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
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress {
    if (_value.restaurantAddress == null) {
      return null;
    }

    return $DeliveryAddressesCopyWith<$Res>(_value.restaurantAddress!, (value) {
      return _then(_value.copyWith(restaurantAddress: value) as $Val);
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
      {@JsonKey(ignore: true) List<CartItem> cartItems,
      @JsonKey(ignore: true) int cartSubTotal,
      @JsonKey(ignore: true) int cartTax,
      @JsonKey(ignore: true) int cartTotal,
      @JsonKey(ignore: true) int cartDiscountPercent,
      @JsonKey(ignore: true) int cartDiscountComputed,
      @JsonKey(ignore: true) int cartDeliveryCharge,
      @JsonKey(ignore: true) List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true) List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true) DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true) Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true) int selectedTipAmount,
      @JsonKey(ignore: true) String discountCode,
      @JsonKey(ignore: true) String paymentIntentID,
      @JsonKey(ignore: true) String orderID,
      @JsonKey(ignore: true) double selectedGBPxAmount,
      @JsonKey(ignore: true) double selectedPPLAmount,
      @JsonKey(ignore: true) bool transferringTokens,
      @JsonKey(ignore: true) bool errorCompletingPayment,
      @JsonKey(ignore: true) bool confirmedPayment,
      @JsonKey(ignore: true) String restaurantName,
      @JsonKey(ignore: true) String restaurantID,
      @JsonKey(ignore: true) DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true) String restaurantWalletAddress,
      @JsonKey(ignore: true) int deliveryCharge,
      @JsonKey(ignore: true) int collectionCharge,
      @JsonKey(ignore: true) FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true) bool isDelivery,
      @JsonKey(ignore: true) int restaurantMinimumOrder,
      @JsonKey(ignore: true) int restaurantPlatformFee,
      @JsonKey(ignore: true) String deliveryInstructions,
      @JsonKey(ignore: true) int deliveryMethodId,
      @JsonKey(ignore: true) int collectionMethodId});

  @override
  $DeliveryAddressesCopyWith<$Res>? get selectedDeliveryAddress;
  @override
  $DeliveryAddressesCopyWith<$Res>? get restaurantAddress;
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
    Object? cartDeliveryCharge = null,
    Object? deliverySlots = null,
    Object? collectionSlots = null,
    Object? selectedDeliveryAddress = freezed,
    Object? selectedTimeSlot = null,
    Object? selectedTipAmount = null,
    Object? discountCode = null,
    Object? paymentIntentID = null,
    Object? orderID = null,
    Object? selectedGBPxAmount = null,
    Object? selectedPPLAmount = null,
    Object? transferringTokens = null,
    Object? errorCompletingPayment = null,
    Object? confirmedPayment = null,
    Object? restaurantName = null,
    Object? restaurantID = null,
    Object? restaurantAddress = freezed,
    Object? restaurantWalletAddress = null,
    Object? deliveryCharge = null,
    Object? collectionCharge = null,
    Object? fulfilmentMethod = null,
    Object? isDelivery = null,
    Object? restaurantMinimumOrder = null,
    Object? restaurantPlatformFee = null,
    Object? deliveryInstructions = null,
    Object? deliveryMethodId = null,
    Object? collectionMethodId = null,
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
      cartDeliveryCharge: null == cartDeliveryCharge
          ? _value.cartDeliveryCharge
          : cartDeliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      deliverySlots: null == deliverySlots
          ? _value.deliverySlots
          : deliverySlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      collectionSlots: null == collectionSlots
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedDeliveryAddress: freezed == selectedDeliveryAddress
          ? _value.selectedDeliveryAddress
          : selectedDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as DeliveryAddresses?,
      selectedTimeSlot: null == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
      deliveryCharge: null == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as int,
      collectionCharge: null == collectionCharge
          ? _value.collectionCharge
          : collectionCharge // ignore: cast_nullable_to_non_nullable
              as int,
      fulfilmentMethod: null == fulfilmentMethod
          ? _value.fulfilmentMethod
          : fulfilmentMethod // ignore: cast_nullable_to_non_nullable
              as FulfilmentMethod,
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
      deliveryMethodId: null == deliveryMethodId
          ? _value.deliveryMethodId
          : deliveryMethodId // ignore: cast_nullable_to_non_nullable
              as int,
      collectionMethodId: null == collectionMethodId
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
      {@JsonKey(ignore: true) this.cartItems = const [],
      @JsonKey(ignore: true) this.cartSubTotal = 0,
      @JsonKey(ignore: true) this.cartTax = 0,
      @JsonKey(ignore: true) this.cartTotal = 0,
      @JsonKey(ignore: true) this.cartDiscountPercent = 0,
      @JsonKey(ignore: true) this.cartDiscountComputed = 0,
      @JsonKey(ignore: true) this.cartDeliveryCharge = 0,
      @JsonKey(ignore: true) this.deliverySlots = const [],
      @JsonKey(ignore: true) this.collectionSlots = const [],
      @JsonKey(ignore: true) this.selectedDeliveryAddress = null,
      @JsonKey(ignore: true) this.selectedTimeSlot = const {},
      @JsonKey(ignore: true) this.selectedTipAmount = 0,
      @JsonKey(ignore: true) this.discountCode = '',
      @JsonKey(ignore: true) this.paymentIntentID = '',
      @JsonKey(ignore: true) this.orderID = '',
      @JsonKey(ignore: true) this.selectedGBPxAmount = 0.0,
      @JsonKey(ignore: true) this.selectedPPLAmount = 0.0,
      @JsonKey(ignore: true) this.transferringTokens = false,
      @JsonKey(ignore: true) this.errorCompletingPayment = false,
      @JsonKey(ignore: true) this.confirmedPayment = false,
      @JsonKey(ignore: true) this.restaurantName = '',
      @JsonKey(ignore: true) this.restaurantID = '',
      @JsonKey(ignore: true) this.restaurantAddress = null,
      @JsonKey(ignore: true) this.restaurantWalletAddress = '',
      @JsonKey(ignore: true) this.deliveryCharge = 0,
      @JsonKey(ignore: true) this.collectionCharge = 0,
      @JsonKey(ignore: true) this.fulfilmentMethod = FulfilmentMethod.delivery,
      @JsonKey(ignore: true) this.isDelivery = false,
      @JsonKey(ignore: true) this.restaurantMinimumOrder = 0,
      @JsonKey(ignore: true) this.restaurantPlatformFee = 0,
      @JsonKey(ignore: true) this.deliveryInstructions = '',
      @JsonKey(ignore: true) this.deliveryMethodId = 0,
      @JsonKey(ignore: true) this.collectionMethodId = 0})
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
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed, cartDeliveryCharge: $cartDeliveryCharge, deliverySlots: $deliverySlots, collectionSlots: $collectionSlots, selectedDeliveryAddress: $selectedDeliveryAddress, selectedTimeSlot: $selectedTimeSlot, selectedTipAmount: $selectedTipAmount, discountCode: $discountCode, paymentIntentID: $paymentIntentID, orderID: $orderID, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, restaurantID: $restaurantID, restaurantAddress: $restaurantAddress, restaurantWalletAddress: $restaurantWalletAddress, deliveryCharge: $deliveryCharge, collectionCharge: $collectionCharge, fulfilmentMethod: $fulfilmentMethod, isDelivery: $isDelivery, restaurantMinimumOrder: $restaurantMinimumOrder, restaurantPlatformFee: $restaurantPlatformFee, deliveryInstructions: $deliveryInstructions, deliveryMethodId: $deliveryMethodId, collectionMethodId: $collectionMethodId)';
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
            (identical(other.cartDeliveryCharge, cartDeliveryCharge) ||
                other.cartDeliveryCharge == cartDeliveryCharge) &&
            const DeepCollectionEquality()
                .equals(other.deliverySlots, deliverySlots) &&
            const DeepCollectionEquality()
                .equals(other.collectionSlots, collectionSlots) &&
            (identical(
                    other.selectedDeliveryAddress, selectedDeliveryAddress) ||
                other.selectedDeliveryAddress == selectedDeliveryAddress) &&
            const DeepCollectionEquality()
                .equals(other.selectedTimeSlot, selectedTimeSlot) &&
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
            (identical(
                    other.restaurantWalletAddress, restaurantWalletAddress) ||
                other.restaurantWalletAddress == restaurantWalletAddress) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.collectionCharge, collectionCharge) ||
                other.collectionCharge == collectionCharge) &&
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
            (identical(other.deliveryMethodId, deliveryMethodId) ||
                other.deliveryMethodId == deliveryMethodId) &&
            (identical(other.collectionMethodId, collectionMethodId) ||
                other.collectionMethodId == collectionMethodId));
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
        cartDeliveryCharge,
        const DeepCollectionEquality().hash(deliverySlots),
        const DeepCollectionEquality().hash(collectionSlots),
        selectedDeliveryAddress,
        const DeepCollectionEquality().hash(selectedTimeSlot),
        selectedTipAmount,
        discountCode,
        paymentIntentID,
        orderID,
        selectedGBPxAmount,
        selectedPPLAmount,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
        restaurantName,
        restaurantID,
        restaurantAddress,
        restaurantWalletAddress,
        deliveryCharge,
        collectionCharge,
        fulfilmentMethod,
        isDelivery,
        restaurantMinimumOrder,
        restaurantPlatformFee,
        deliveryInstructions,
        deliveryMethodId,
        collectionMethodId
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
      {@JsonKey(ignore: true) final List<CartItem> cartItems,
      @JsonKey(ignore: true) final int cartSubTotal,
      @JsonKey(ignore: true) final int cartTax,
      @JsonKey(ignore: true) final int cartTotal,
      @JsonKey(ignore: true) final int cartDiscountPercent,
      @JsonKey(ignore: true) final int cartDiscountComputed,
      @JsonKey(ignore: true) final int cartDeliveryCharge,
      @JsonKey(ignore: true) final List<Map<String, String>> deliverySlots,
      @JsonKey(ignore: true) final List<Map<String, String>> collectionSlots,
      @JsonKey(ignore: true) final DeliveryAddresses? selectedDeliveryAddress,
      @JsonKey(ignore: true) final Map<String, String> selectedTimeSlot,
      @JsonKey(ignore: true) final int selectedTipAmount,
      @JsonKey(ignore: true) final String discountCode,
      @JsonKey(ignore: true) final String paymentIntentID,
      @JsonKey(ignore: true) final String orderID,
      @JsonKey(ignore: true) final double selectedGBPxAmount,
      @JsonKey(ignore: true) final double selectedPPLAmount,
      @JsonKey(ignore: true) final bool transferringTokens,
      @JsonKey(ignore: true) final bool errorCompletingPayment,
      @JsonKey(ignore: true) final bool confirmedPayment,
      @JsonKey(ignore: true) final String restaurantName,
      @JsonKey(ignore: true) final String restaurantID,
      @JsonKey(ignore: true) final DeliveryAddresses? restaurantAddress,
      @JsonKey(ignore: true) final String restaurantWalletAddress,
      @JsonKey(ignore: true) final int deliveryCharge,
      @JsonKey(ignore: true) final int collectionCharge,
      @JsonKey(ignore: true) final FulfilmentMethod fulfilmentMethod,
      @JsonKey(ignore: true) final bool isDelivery,
      @JsonKey(ignore: true) final int restaurantMinimumOrder,
      @JsonKey(ignore: true) final int restaurantPlatformFee,
      @JsonKey(ignore: true) final String deliveryInstructions,
      @JsonKey(ignore: true) final int deliveryMethodId,
      @JsonKey(ignore: true) final int collectionMethodId}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  @JsonKey(ignore: true)
  List<CartItem> get cartItems;
  @override
  @JsonKey(ignore: true)
  int get cartSubTotal;
  @override
  @JsonKey(ignore: true)
  int get cartTax;
  @override
  @JsonKey(ignore: true)
  int get cartTotal;
  @override
  @JsonKey(ignore: true)
  int get cartDiscountPercent;
  @override
  @JsonKey(ignore: true)
  int get cartDiscountComputed;
  @override
  @JsonKey(ignore: true)
  int get cartDeliveryCharge;
  @override
  @JsonKey(ignore: true)
  List<Map<String, String>> get deliverySlots;
  @override
  @JsonKey(ignore: true)
  List<Map<String, String>> get collectionSlots;
  @override
  @JsonKey(ignore: true)
  DeliveryAddresses? get selectedDeliveryAddress;
  @override
  @JsonKey(ignore: true)
  Map<String, String> get selectedTimeSlot;
  @override
  @JsonKey(ignore: true)
  int get selectedTipAmount;
  @override
  @JsonKey(ignore: true)
  String get discountCode;
  @override
  @JsonKey(ignore: true)
  String get paymentIntentID;
  @override
  @JsonKey(ignore: true)
  String get orderID;
  @override
  @JsonKey(ignore: true)
  double get selectedGBPxAmount;
  @override
  @JsonKey(ignore: true)
  double get selectedPPLAmount;
  @override
  @JsonKey(ignore: true)
  bool get transferringTokens;
  @override
  @JsonKey(ignore: true)
  bool get errorCompletingPayment;
  @override
  @JsonKey(ignore: true)
  bool get confirmedPayment;
  @override
  @JsonKey(ignore: true)
  String get restaurantName;
  @override
  @JsonKey(ignore: true)
  String get restaurantID;
  @override
  @JsonKey(ignore: true)
  DeliveryAddresses? get restaurantAddress;
  @override
  @JsonKey(ignore: true)
  String get restaurantWalletAddress;
  @override
  @JsonKey(ignore: true)
  int get deliveryCharge;
  @override
  @JsonKey(ignore: true)
  int get collectionCharge;
  @override
  @JsonKey(ignore: true)
  FulfilmentMethod get fulfilmentMethod;
  @override
  @JsonKey(ignore: true)
  bool get isDelivery;
  @override
  @JsonKey(ignore: true)
  int get restaurantMinimumOrder;
  @override
  @JsonKey(ignore: true)
  int get restaurantPlatformFee;
  @override
  @JsonKey(ignore: true)
  String get deliveryInstructions;
  @override
  @JsonKey(ignore: true)
  int get deliveryMethodId;
  @override
  @JsonKey(ignore: true)
  int get collectionMethodId;
  @override
  @JsonKey(ignore: true)
  _$$_UserCartStateCopyWith<_$_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
