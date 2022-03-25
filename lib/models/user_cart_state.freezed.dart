// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCartState _$UserCartStateFromJson(Map<String, dynamic> json) {
  return _UserCartState.fromJson(json);
}

/// @nodoc
class _$UserCartStateTearOff {
  const _$UserCartStateTearOff();

  _UserCartState call(
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscountPercent,
      required int cartDiscountComputed,
      required int cartDeliveryCharge,
      required List<Map<String, String>> deliverySlots,
      required List<Map<String, String>> collectionSlots,
      required int selectedSlotIndex,
      required int selectedTipAmount,
      required String discountCode,
      required int selectedDeliveryAddressIndex,
      required String paymentIntentID,
      required String orderID,
      required double selectedGBPxAmount,
      required double selectedPPLAmount,
      required bool transferringTokens,
      required bool errorCompletingPayment,
      required bool confirmedPayment,
      required String restaurantName,
      required String restaurantID,
      required DeliveryAddresses restaurantAddress,
      required String restaurantWalletAddress,
      required int deliveryCharge,
      required int collectionCharge}) {
    return _UserCartState(
      cartItems: cartItems,
      cartSubTotal: cartSubTotal,
      cartTax: cartTax,
      cartTotal: cartTotal,
      cartDiscountPercent: cartDiscountPercent,
      cartDiscountComputed: cartDiscountComputed,
      cartDeliveryCharge: cartDeliveryCharge,
      deliverySlots: deliverySlots,
      collectionSlots: collectionSlots,
      selectedSlotIndex: selectedSlotIndex,
      selectedTipAmount: selectedTipAmount,
      discountCode: discountCode,
      selectedDeliveryAddressIndex: selectedDeliveryAddressIndex,
      paymentIntentID: paymentIntentID,
      orderID: orderID,
      selectedGBPxAmount: selectedGBPxAmount,
      selectedPPLAmount: selectedPPLAmount,
      transferringTokens: transferringTokens,
      errorCompletingPayment: errorCompletingPayment,
      confirmedPayment: confirmedPayment,
      restaurantName: restaurantName,
      restaurantID: restaurantID,
      restaurantAddress: restaurantAddress,
      restaurantWalletAddress: restaurantWalletAddress,
      deliveryCharge: deliveryCharge,
      collectionCharge: collectionCharge,
    );
  }

  UserCartState fromJson(Map<String, Object> json) {
    return UserCartState.fromJson(json);
  }
}

/// @nodoc
const $UserCartState = _$UserCartStateTearOff();

/// @nodoc
mixin _$UserCartState {
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  int get cartSubTotal => throw _privateConstructorUsedError;
  int get cartTax => throw _privateConstructorUsedError;
  int get cartTotal => throw _privateConstructorUsedError;
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  int get cartDeliveryCharge => throw _privateConstructorUsedError;
  List<Map<String, String>> get deliverySlots =>
      throw _privateConstructorUsedError;
  List<Map<String, String>> get collectionSlots =>
      throw _privateConstructorUsedError;
  int get selectedSlotIndex => throw _privateConstructorUsedError;
  int get selectedTipAmount => throw _privateConstructorUsedError;
  String get discountCode => throw _privateConstructorUsedError;
  int get selectedDeliveryAddressIndex => throw _privateConstructorUsedError;
  String get paymentIntentID => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  bool get transferringTokens => throw _privateConstructorUsedError;
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  bool get confirmedPayment => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantID => throw _privateConstructorUsedError;
  DeliveryAddresses get restaurantAddress => throw _privateConstructorUsedError;
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  int get deliveryCharge => throw _privateConstructorUsedError;
  int get collectionCharge => throw _privateConstructorUsedError;

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
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed,
      int cartDeliveryCharge,
      List<Map<String, String>> deliverySlots,
      List<Map<String, String>> collectionSlots,
      int selectedSlotIndex,
      int selectedTipAmount,
      String discountCode,
      int selectedDeliveryAddressIndex,
      String paymentIntentID,
      String orderID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      DeliveryAddresses restaurantAddress,
      String restaurantWalletAddress,
      int deliveryCharge,
      int collectionCharge});

  $DeliveryAddressesCopyWith<$Res> get restaurantAddress;
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
    Object? collectionSlots = freezed,
    Object? selectedSlotIndex = freezed,
    Object? selectedTipAmount = freezed,
    Object? discountCode = freezed,
    Object? selectedDeliveryAddressIndex = freezed,
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
  }) {
    return _then(_value.copyWith(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
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
      collectionSlots: collectionSlots == freezed
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedSlotIndex: selectedSlotIndex == freezed
          ? _value.selectedSlotIndex
          : selectedSlotIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTipAmount: selectedTipAmount == freezed
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDeliveryAddressIndex: selectedDeliveryAddressIndex == freezed
          ? _value.selectedDeliveryAddressIndex
          : selectedDeliveryAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
              as DeliveryAddresses,
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
    ));
  }

  @override
  $DeliveryAddressesCopyWith<$Res> get restaurantAddress {
    return $DeliveryAddressesCopyWith<$Res>(_value.restaurantAddress, (value) {
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
      {List<OrderItem> cartItems,
      int cartSubTotal,
      int cartTax,
      int cartTotal,
      int cartDiscountPercent,
      int cartDiscountComputed,
      int cartDeliveryCharge,
      List<Map<String, String>> deliverySlots,
      List<Map<String, String>> collectionSlots,
      int selectedSlotIndex,
      int selectedTipAmount,
      String discountCode,
      int selectedDeliveryAddressIndex,
      String paymentIntentID,
      String orderID,
      double selectedGBPxAmount,
      double selectedPPLAmount,
      bool transferringTokens,
      bool errorCompletingPayment,
      bool confirmedPayment,
      String restaurantName,
      String restaurantID,
      DeliveryAddresses restaurantAddress,
      String restaurantWalletAddress,
      int deliveryCharge,
      int collectionCharge});

  @override
  $DeliveryAddressesCopyWith<$Res> get restaurantAddress;
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
    Object? collectionSlots = freezed,
    Object? selectedSlotIndex = freezed,
    Object? selectedTipAmount = freezed,
    Object? discountCode = freezed,
    Object? selectedDeliveryAddressIndex = freezed,
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
  }) {
    return _then(_UserCartState(
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
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
      collectionSlots: collectionSlots == freezed
          ? _value.collectionSlots
          : collectionSlots // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
      selectedSlotIndex: selectedSlotIndex == freezed
          ? _value.selectedSlotIndex
          : selectedSlotIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTipAmount: selectedTipAmount == freezed
          ? _value.selectedTipAmount
          : selectedTipAmount // ignore: cast_nullable_to_non_nullable
              as int,
      discountCode: discountCode == freezed
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDeliveryAddressIndex: selectedDeliveryAddressIndex == freezed
          ? _value.selectedDeliveryAddressIndex
          : selectedDeliveryAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
              as DeliveryAddresses,
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
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_UserCartState extends _UserCartState {
  _$_UserCartState(
      {required this.cartItems,
      required this.cartSubTotal,
      required this.cartTax,
      required this.cartTotal,
      required this.cartDiscountPercent,
      required this.cartDiscountComputed,
      required this.cartDeliveryCharge,
      required this.deliverySlots,
      required this.collectionSlots,
      required this.selectedSlotIndex,
      required this.selectedTipAmount,
      required this.discountCode,
      required this.selectedDeliveryAddressIndex,
      required this.paymentIntentID,
      required this.orderID,
      required this.selectedGBPxAmount,
      required this.selectedPPLAmount,
      required this.transferringTokens,
      required this.errorCompletingPayment,
      required this.confirmedPayment,
      required this.restaurantName,
      required this.restaurantID,
      required this.restaurantAddress,
      required this.restaurantWalletAddress,
      required this.deliveryCharge,
      required this.collectionCharge})
      : super._();

  factory _$_UserCartState.fromJson(Map<String, dynamic> json) =>
      _$$_UserCartStateFromJson(json);

  @override
  final List<OrderItem> cartItems;
  @override
  final int cartSubTotal;
  @override
  final int cartTax;
  @override
  final int cartTotal;
  @override
  final int cartDiscountPercent;
  @override
  final int cartDiscountComputed;
  @override
  final int cartDeliveryCharge;
  @override
  final List<Map<String, String>> deliverySlots;
  @override
  final List<Map<String, String>> collectionSlots;
  @override
  final int selectedSlotIndex;
  @override
  final int selectedTipAmount;
  @override
  final String discountCode;
  @override
  final int selectedDeliveryAddressIndex;
  @override
  final String paymentIntentID;
  @override
  final String orderID;
  @override
  final double selectedGBPxAmount;
  @override
  final double selectedPPLAmount;
  @override
  final bool transferringTokens;
  @override
  final bool errorCompletingPayment;
  @override
  final bool confirmedPayment;
  @override
  final String restaurantName;
  @override
  final String restaurantID;
  @override
  final DeliveryAddresses restaurantAddress;
  @override
  final String restaurantWalletAddress;
  @override
  final int deliveryCharge;
  @override
  final int collectionCharge;

  @override
  String toString() {
    return 'UserCartState(cartItems: $cartItems, cartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountPercent: $cartDiscountPercent, cartDiscountComputed: $cartDiscountComputed, cartDeliveryCharge: $cartDeliveryCharge, deliverySlots: $deliverySlots, collectionSlots: $collectionSlots, selectedSlotIndex: $selectedSlotIndex, selectedTipAmount: $selectedTipAmount, discountCode: $discountCode, selectedDeliveryAddressIndex: $selectedDeliveryAddressIndex, paymentIntentID: $paymentIntentID, orderID: $orderID, selectedGBPxAmount: $selectedGBPxAmount, selectedPPLAmount: $selectedPPLAmount, transferringTokens: $transferringTokens, errorCompletingPayment: $errorCompletingPayment, confirmedPayment: $confirmedPayment, restaurantName: $restaurantName, restaurantID: $restaurantID, restaurantAddress: $restaurantAddress, restaurantWalletAddress: $restaurantWalletAddress, deliveryCharge: $deliveryCharge, collectionCharge: $collectionCharge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserCartState &&
            (identical(other.cartItems, cartItems) ||
                const DeepCollectionEquality()
                    .equals(other.cartItems, cartItems)) &&
            (identical(other.cartSubTotal, cartSubTotal) ||
                const DeepCollectionEquality()
                    .equals(other.cartSubTotal, cartSubTotal)) &&
            (identical(other.cartTax, cartTax) ||
                const DeepCollectionEquality()
                    .equals(other.cartTax, cartTax)) &&
            (identical(other.cartTotal, cartTotal) ||
                const DeepCollectionEquality()
                    .equals(other.cartTotal, cartTotal)) &&
            (identical(other.cartDiscountPercent, cartDiscountPercent) ||
                const DeepCollectionEquality()
                    .equals(other.cartDiscountPercent, cartDiscountPercent)) &&
            (identical(other.cartDiscountComputed, cartDiscountComputed) ||
                const DeepCollectionEquality().equals(
                    other.cartDiscountComputed, cartDiscountComputed)) &&
            (identical(other.cartDeliveryCharge, cartDeliveryCharge) ||
                const DeepCollectionEquality()
                    .equals(other.cartDeliveryCharge, cartDeliveryCharge)) &&
            (identical(other.deliverySlots, deliverySlots) ||
                const DeepCollectionEquality()
                    .equals(other.deliverySlots, deliverySlots)) &&
            (identical(other.collectionSlots, collectionSlots) ||
                const DeepCollectionEquality()
                    .equals(other.collectionSlots, collectionSlots)) &&
            (identical(other.selectedSlotIndex, selectedSlotIndex) ||
                const DeepCollectionEquality()
                    .equals(other.selectedSlotIndex, selectedSlotIndex)) &&
            (identical(other.selectedTipAmount, selectedTipAmount) ||
                const DeepCollectionEquality()
                    .equals(other.selectedTipAmount, selectedTipAmount)) &&
            (identical(other.discountCode, discountCode) ||
                const DeepCollectionEquality()
                    .equals(other.discountCode, discountCode)) &&
            (identical(other.selectedDeliveryAddressIndex, selectedDeliveryAddressIndex) ||
                const DeepCollectionEquality().equals(
                    other.selectedDeliveryAddressIndex,
                    selectedDeliveryAddressIndex)) &&
            (identical(other.paymentIntentID, paymentIntentID) ||
                const DeepCollectionEquality()
                    .equals(other.paymentIntentID, paymentIntentID)) &&
            (identical(other.orderID, orderID) ||
                const DeepCollectionEquality()
                    .equals(other.orderID, orderID)) &&
            (identical(other.selectedGBPxAmount, selectedGBPxAmount) ||
                const DeepCollectionEquality()
                    .equals(other.selectedGBPxAmount, selectedGBPxAmount)) &&
            (identical(other.selectedPPLAmount, selectedPPLAmount) ||
                const DeepCollectionEquality()
                    .equals(other.selectedPPLAmount, selectedPPLAmount)) &&
            (identical(other.transferringTokens, transferringTokens) ||
                const DeepCollectionEquality()
                    .equals(other.transferringTokens, transferringTokens)) &&
            (identical(other.errorCompletingPayment, errorCompletingPayment) ||
                const DeepCollectionEquality().equals(
                    other.errorCompletingPayment, errorCompletingPayment)) &&
            (identical(other.confirmedPayment, confirmedPayment) ||
                const DeepCollectionEquality().equals(other.confirmedPayment, confirmedPayment)) &&
            (identical(other.restaurantName, restaurantName) || const DeepCollectionEquality().equals(other.restaurantName, restaurantName)) &&
            (identical(other.restaurantID, restaurantID) || const DeepCollectionEquality().equals(other.restaurantID, restaurantID)) &&
            (identical(other.restaurantAddress, restaurantAddress) || const DeepCollectionEquality().equals(other.restaurantAddress, restaurantAddress)) &&
            (identical(other.restaurantWalletAddress, restaurantWalletAddress) || const DeepCollectionEquality().equals(other.restaurantWalletAddress, restaurantWalletAddress)) &&
            (identical(other.deliveryCharge, deliveryCharge) || const DeepCollectionEquality().equals(other.deliveryCharge, deliveryCharge)) &&
            (identical(other.collectionCharge, collectionCharge) || const DeepCollectionEquality().equals(other.collectionCharge, collectionCharge)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cartItems) ^
      const DeepCollectionEquality().hash(cartSubTotal) ^
      const DeepCollectionEquality().hash(cartTax) ^
      const DeepCollectionEquality().hash(cartTotal) ^
      const DeepCollectionEquality().hash(cartDiscountPercent) ^
      const DeepCollectionEquality().hash(cartDiscountComputed) ^
      const DeepCollectionEquality().hash(cartDeliveryCharge) ^
      const DeepCollectionEquality().hash(deliverySlots) ^
      const DeepCollectionEquality().hash(collectionSlots) ^
      const DeepCollectionEquality().hash(selectedSlotIndex) ^
      const DeepCollectionEquality().hash(selectedTipAmount) ^
      const DeepCollectionEquality().hash(discountCode) ^
      const DeepCollectionEquality().hash(selectedDeliveryAddressIndex) ^
      const DeepCollectionEquality().hash(paymentIntentID) ^
      const DeepCollectionEquality().hash(orderID) ^
      const DeepCollectionEquality().hash(selectedGBPxAmount) ^
      const DeepCollectionEquality().hash(selectedPPLAmount) ^
      const DeepCollectionEquality().hash(transferringTokens) ^
      const DeepCollectionEquality().hash(errorCompletingPayment) ^
      const DeepCollectionEquality().hash(confirmedPayment) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(restaurantID) ^
      const DeepCollectionEquality().hash(restaurantAddress) ^
      const DeepCollectionEquality().hash(restaurantWalletAddress) ^
      const DeepCollectionEquality().hash(deliveryCharge) ^
      const DeepCollectionEquality().hash(collectionCharge);

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
      {required List<OrderItem> cartItems,
      required int cartSubTotal,
      required int cartTax,
      required int cartTotal,
      required int cartDiscountPercent,
      required int cartDiscountComputed,
      required int cartDeliveryCharge,
      required List<Map<String, String>> deliverySlots,
      required List<Map<String, String>> collectionSlots,
      required int selectedSlotIndex,
      required int selectedTipAmount,
      required String discountCode,
      required int selectedDeliveryAddressIndex,
      required String paymentIntentID,
      required String orderID,
      required double selectedGBPxAmount,
      required double selectedPPLAmount,
      required bool transferringTokens,
      required bool errorCompletingPayment,
      required bool confirmedPayment,
      required String restaurantName,
      required String restaurantID,
      required DeliveryAddresses restaurantAddress,
      required String restaurantWalletAddress,
      required int deliveryCharge,
      required int collectionCharge}) = _$_UserCartState;
  _UserCartState._() : super._();

  factory _UserCartState.fromJson(Map<String, dynamic> json) =
      _$_UserCartState.fromJson;

  @override
  List<OrderItem> get cartItems => throw _privateConstructorUsedError;
  @override
  int get cartSubTotal => throw _privateConstructorUsedError;
  @override
  int get cartTax => throw _privateConstructorUsedError;
  @override
  int get cartTotal => throw _privateConstructorUsedError;
  @override
  int get cartDiscountPercent => throw _privateConstructorUsedError;
  @override
  int get cartDiscountComputed => throw _privateConstructorUsedError;
  @override
  int get cartDeliveryCharge => throw _privateConstructorUsedError;
  @override
  List<Map<String, String>> get deliverySlots =>
      throw _privateConstructorUsedError;
  @override
  List<Map<String, String>> get collectionSlots =>
      throw _privateConstructorUsedError;
  @override
  int get selectedSlotIndex => throw _privateConstructorUsedError;
  @override
  int get selectedTipAmount => throw _privateConstructorUsedError;
  @override
  String get discountCode => throw _privateConstructorUsedError;
  @override
  int get selectedDeliveryAddressIndex => throw _privateConstructorUsedError;
  @override
  String get paymentIntentID => throw _privateConstructorUsedError;
  @override
  String get orderID => throw _privateConstructorUsedError;
  @override
  double get selectedGBPxAmount => throw _privateConstructorUsedError;
  @override
  double get selectedPPLAmount => throw _privateConstructorUsedError;
  @override
  bool get transferringTokens => throw _privateConstructorUsedError;
  @override
  bool get errorCompletingPayment => throw _privateConstructorUsedError;
  @override
  bool get confirmedPayment => throw _privateConstructorUsedError;
  @override
  String get restaurantName => throw _privateConstructorUsedError;
  @override
  String get restaurantID => throw _privateConstructorUsedError;
  @override
  DeliveryAddresses get restaurantAddress => throw _privateConstructorUsedError;
  @override
  String get restaurantWalletAddress => throw _privateConstructorUsedError;
  @override
  int get deliveryCharge => throw _privateConstructorUsedError;
  @override
  int get collectionCharge => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCartStateCopyWith<_UserCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
