import 'dart:async';
import 'dart:convert';
import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/fullfilmentMethods.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class UpdateCartItems {
  UpdateCartItems({required this.cartItems});
  final List<CartItem> cartItems;

  @override
  String toString() {
    return 'UpdateCartItems : $cartItems';
  }
}

class UpdateComputedCartValues {
  UpdateComputedCartValues(
    this.cartSubTotal,
    this.cartTax,
    this.cartTotal,
    this.cartDiscountComputed,
  );
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountComputed;

  @override
  String toString() {
    return 'UpdateComputedCartValues : CartSubTotal: $cartSubTotal, cartTax: $cartTax, cartTotal: $cartTotal, cartDiscountComputed: $cartDiscountComputed';
  }
}

class UpdateCartDiscount {
  UpdateCartDiscount(this.cartDiscountPercent, this.discountCode);
  final int cartDiscountPercent;
  final String discountCode;

  @override
  String toString() {
    return 'UpdateCartDiscount : cartDiscountPercent: $cartDiscountPercent, discountCode: $discountCode';
  }
}

class ClearCart {
  ClearCart();

  @override
  String toString() {
    return 'ClearCart';
  }
}

class UpdateSlots {
  UpdateSlots(this.deliverySlots, this.collectionSlots);
  final List<Map<String, String>> deliverySlots;
  final List<Map<String, String>> collectionSlots;

  @override
  String toString() {
    return 'UpdateSlots : deliverySlots: $deliverySlots, collectionSlots: $collectionSlots';
  }
}

class UpdateSelectedDeliveryAddress {
  UpdateSelectedDeliveryAddress(this.selectedAddress);
  final DeliveryAddresses? selectedAddress;

  @override
  String toString() {
    return 'UpdateSelectedDeliveryAddress : selectedAddress: $selectedAddress';
  }
}

class UpdateSelectedTimeSlot {
  UpdateSelectedTimeSlot(this.selectedTimeSlot);
  final Map<String, String> selectedTimeSlot;

  @override
  String toString() {
    return 'UpdateSelectedTimeSlot : selectedTimeSlot: $selectedTimeSlot';
  }
}

class UpdateTipAmount {
  UpdateTipAmount(this.tipAmount);
  final int tipAmount;

  @override
  String toString() {
    return 'UpdateTipAmount : tipAmount: $tipAmount';
  }
}

class CreateOrder {
  CreateOrder(this.orderID, this.paymentIntentID);
  final String orderID;
  final String paymentIntentID;

  @override
  String toString() {
    return 'CreateOrder : orderID: $orderID, paymentIntentID: $paymentIntentID';
  }
}

class SetTransferringPayment {
  SetTransferringPayment({required this.flag});
  bool flag;

  @override
  String toString() {
    return 'SetTransferringPayment : flag;$flag';
  }
}

class SetError {
  SetError({required this.flag});
  bool flag;

  @override
  String toString() {
    return 'SetError : flag: $flag';
  }
}

class SetConfirmed {
  SetConfirmed({required this.flag});
  bool flag;

  @override
  String toString() {
    return 'SetConfirmed : flag: $flag';
  }
}

class UpdateSelectedAmounts {
  UpdateSelectedAmounts(this.GBPxAmount, this.PPLAmount);
  final double GBPxAmount;
  final double PPLAmount;

  @override
  String toString() {
    return 'UpdateSelectedAmounts : GBPxAmount: $GBPxAmount, PPLAmount:$PPLAmount';
  }
}

class SetRestaurantDetails {
  SetRestaurantDetails(
    this.restaurantID,
    this.restaurantName,
    this.restaurantAddress,
    this.walletAddress,
    this.minimumOrder,
    this.platformFee,
  );
  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses restaurantAddress;
  final String walletAddress;
  final int minimumOrder;
  final int platformFee;

  @override
  String toString() {
    return 'SetRestaurantDetails : restaurantID: $restaurantID, restaurantName: $restaurantName, restaurantAddress:$restaurantAddress, walletAddress:$walletAddress, minimumOrder:$minimumOrder, platformFee:$platformFee';
  }
}

class SetDeliveryCharge {
  SetDeliveryCharge(this.deliveryCharge);
  final int deliveryCharge;

  @override
  String toString() {
    return 'SetDeliveryCharge : deliveryCharge: $deliveryCharge';
  }
}

class SetFulfilmentFees {
  SetFulfilmentFees(this.deliveryCharge, this.collectionCharge);
  final int deliveryCharge;
  final int collectionCharge;

  @override
  String toString() {
    return 'SetFulfilmentFees : deliveryCharge: $deliveryCharge, collectionCharge: $collectionCharge';
  }
}

class SetFulfilmentMethodIds {
  SetFulfilmentMethodIds(this.deliveryMethodId, this.collectionMethodId);
  final int deliveryMethodId;
  final int collectionMethodId;

  @override
  String toString() {
    return 'SetFulfilmentMethodIds : deliveryMethodId: $deliveryMethodId, collectionMethodId: $collectionMethodId';
  }
}

class SetFulfilmentMethod {
  SetFulfilmentMethod(this.fulfilmentMethod);
  final FulfilmentMethod fulfilmentMethod;

  @override
  String toString() {
    return 'SetFulfilmentMethod : fulfilmentMethod: $fulfilmentMethod';
  }
}

class SetIsDelivery {
  SetIsDelivery({required this.isDelivery});
  final bool isDelivery;

  @override
  String toString() {
    return 'SetIsDelivery : isDelivery: $isDelivery';
  }
}

class SetDeliveryInstructions {
  SetDeliveryInstructions(this.deliveryInstructions);
  final String deliveryInstructions;

  @override
  String toString() {
    return 'SetDeliveryInstructions : deliveryInstructions: $deliveryInstructions';
  }
}

ThunkAction<AppState> getFullfillmentMethods({DateTime? newDate}) {
  return (Store<AppState> store) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      FullfilmentMethods fullfilmentMethods;

      if (newDate == null) {
        fullfilmentMethods = await peeplEatsService.getFulfilmentSlots(
          vendorID: store.state.cartState.restaurantID,
          dateRequired: formatter.format(DateTime.now()),
        );
      } else {
        fullfilmentMethods = await peeplEatsService.getFulfilmentSlots(
          vendorID: store.state.cartState.restaurantID,
          dateRequired: formatter.format(newDate),
        );
      }
      store
        ..dispatch(
          UpdateSlots(
            fullfilmentMethods.deliverySlots,
            fullfilmentMethods.collectionSlots,
          ),
        )
        ..dispatch(
          SetFulfilmentFees(
            fullfilmentMethods.deliveryMethod == null
                ? 0
                : fullfilmentMethods.deliveryMethod!['priceModifier'] as int? ??
                    0,
            fullfilmentMethods.collectionMethod == null
                ? 0
                : fullfilmentMethods.collectionMethod!['priceModifier']
                        as int? ??
                    0,
          ),
        )
        ..dispatch(
          SetFulfilmentMethodIds(
            fullfilmentMethods.deliveryMethod!['id'] as int,
            fullfilmentMethods.collectionMethod!['id'] as int,
          ),
        )
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - getFullfillmentMethods $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getFullfillmentMethods $e',
      );
    }
  };
}

ThunkAction<AppState> updateCartTip(int newTip) {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(UpdateTipAmount(newTip))
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateCartTip $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCartTip $e',
      );
    }
  };
}

ThunkAction<AppState> updateCartDiscount(
  String newDiscountCode,
  VoidCallback errorCallback,
) {
  return (Store<AppState> store) async {
    try {
      if (newDiscountCode == 'REMOVE') {
        store
          ..dispatch(UpdateCartDiscount(0, ''))
          ..dispatch(computeCartTotals());
      } else {
        final int discountPercent =
            await peeplEatsService.checkDiscountCode(newDiscountCode).onError(
          (error, stackTrace) {
            errorCallback();
            return 0;
          },
        );

        if (discountPercent != 0) {
          store
            ..dispatch(UpdateCartDiscount(discountPercent, newDiscountCode))
            ..dispatch(computeCartTotals());
        }
      }
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      errorCallback();
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction<AppState> updateCartItems(List<CartItem> itemsToAdd) {
  return (Store<AppState> store) async {
    try {
      final List<CartItem> cartItems =
          List.from(store.state.cartState.cartItems)..addAll(itemsToAdd);

      store
        ..dispatch(UpdateCartItems(cartItems: cartItems))
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction<AppState> updateCartItemQuantity(CartItem itemToAdd) {
  return (Store<AppState> store) async {
    try {
      final List<CartItem> cartItems = store.state.cartState.cartItems;
      if (itemToAdd.itemQuantity == 0) {
        cartItems.removeWhere(
          (element) => element.internalID == itemToAdd.internalID,
        );
      } else {
        final int index = cartItems.indexWhere(
          (element) => element.internalID == itemToAdd.internalID,
        );

        cartItems
          ..removeWhere(
            (element) => element.internalID == itemToAdd.internalID,
          )
          ..insert(index, itemToAdd);
      }

      store
        ..dispatch(UpdateCartItems(cartItems: cartItems))
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction<AppState> computeCartTotals() {
  return (Store<AppState> store) async {
    try {
      final List<CartItem> cartItems = store.state.cartState.cartItems;

      int cartSubTotal = 0;
      const int cartTax = 0;
      int cartTotal = 0;
      final int deliveryFee = store.state.cartState.deliveryCharge;
      final int collectionFee = store.state.cartState.collectionCharge;
      final int platformFee = store.state.cartState.restaurantPlatformFee;
      final int cartDiscountPercent = store.state.cartState.cartDiscountPercent;
      int cartDiscountComputed = 0;
      final int cartTip = store.state.cartState.selectedTipAmount * 100;
      final bool isDelivery = store.state.cartState.isDelivery;

      for (final element in cartItems) {
        cartSubTotal += element.totalItemPrice;
      }

      // add price of each order Item (which has options included)

      cartDiscountComputed =
          (cartSubTotal * cartDiscountPercent) ~/ 100; // subtotal * discount

      //cartTax = ((cartSubTotal - cartDiscountComputed) * 5) ~/ 100;

      if (isDelivery) {
        cartTotal =
            (cartSubTotal + cartTax + cartTip + deliveryFee + platformFee) -
                cartDiscountComputed;
      } else {
        cartTotal =
            (cartSubTotal + cartTax + cartTip + collectionFee + platformFee) -
                cartDiscountComputed;
      }

      store.dispatch(
        UpdateComputedCartValues(
          cartSubTotal,
          cartTax,
          cartTotal,
          cartDiscountComputed,
        ),
      );
    } catch (e, s) {
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction<AppState> prepareAndSendOrder(
  void Function(String errorText) errorCallback,
  VoidCallback successCallback,
) {
  return (Store<AppState> store) async {
    final int temp = (store.state.cartState.cartSubTotal *
            store.state.cartState.cartDiscountPercent) ~/
        100;

    try {
      if (store.state.cartState.fulfilmentMethod == FulfilmentMethod.none) {
        errorCallback('Please select or create an address');
        return;
      } else if (store.state.cartState.selectedTimeSlot.isEmpty) {
        errorCallback('Please select a time slot');
        return;
      } else if (store.state.cartState.restaurantMinimumOrder >
          store.state.cartState.cartSubTotal - temp) {
        errorCallback('Your order does not satisfy the minimum order amount');
        return;
      }

      final Map<String, dynamic> orderObject = {}..addAll({
          'items': store.state.cartState.cartItems
              .map(
                (e) => {
                  'id': int.parse(e.menuItem.menuItemID),
                  'quantity': e.itemQuantity,
                  'options': e.selectedProductOptions.map(
                    (key, value) =>
                        MapEntry<String, int>(key.toString(), value.optionID),
                  ),
                },
              )
              .toList(),
          'total': store.state.cartState.cartTotal,
          'tipAmount': store.state.cartState.selectedTipAmount * 100,
          'marketingOptIn': false,
          'discountCode': store.state.cartState.discountCode,
          'vendor': store.state.cartState.restaurantID,
          'walletAddress': store.state.userState.walletAddress,
        });

      if (store.state.cartState.fulfilmentMethod == FulfilmentMethod.delivery) {
        if (store.state.cartState.selectedDeliveryAddress == null) {
          errorCallback('Please select an address');
          return;
        }
        final DeliveryAddresses selectedAddress =
            store.state.cartState.selectedDeliveryAddress!;

        orderObject.addAll(
          {
            'address': {
              'name': store.state.userState.displayName,
              'phoneNumber': selectedAddress.phoneNumber ?? '',
              'email': store.state.userState.email == ''
                  ? 'email@notprovided.com'
                  : store.state.userState.email,
              'lineOne': selectedAddress.addressLine1,
              'lineTwo':
                  '${selectedAddress.addressLine2}, ${selectedAddress.townCity}',
              'postCode': selectedAddress.postalCode,
              'deliveryInstructions':
                  store.state.cartState.deliveryInstructions,
            },
            'fulfilmentMethod': store.state.cartState.deliveryMethodId,
            'fulfilmentSlotFrom': formatDateForOrderObject(
              store.state.cartState.selectedTimeSlot.entries.first.value,
            ),
            'fulfilmentSlotTo': formatDateForOrderObject(
              store.state.cartState.selectedTimeSlot.entries.last.value,
            ),
          },
        );
      } else if (store.state.cartState.fulfilmentMethod ==
          FulfilmentMethod.collection) {
        orderObject.addAll(
          {
            'address': {
              'name': store.state.userState.displayName,
              'email': store.state.userState.email == ''
                  ? 'email@notprovided.com'
                  : store.state.userState.email,
              'phoneNumber': store.state.userState.phoneNumber,
              'lineOne': 'Collection Order',
              'lineTwo': '',
              'postCode': 'L7 0HG',
              'deliveryInstructions':
                  store.state.cartState.deliveryInstructions,
            },
            'fulfilmentMethod': store.state.cartState.collectionMethodId,
            'fulfilmentSlotFrom': formatDateForOrderObject(
              store.state.cartState.selectedTimeSlot.entries.first.value,
            ),
            'fulfilmentSlotTo': formatDateForOrderObject(
              store.state.cartState.selectedTimeSlot.entries.last.value,
            ),
          },
        );
      }

      print('Order Object Created: ${json.encode(orderObject)}');

      //Call create order API with prepared orderobject
      final Map<String, dynamic> result =
          await peeplEatsService.createOrder(orderObject).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return {}; //return empty map on timeout to trigger errorCallback
        },
      );

      if (result.isNotEmpty) {
        //Call Peepl Pay API to start checking the paymentIntentID
        final Map<String, dynamic> checkResult = await peeplPayService
            .startPaymentIntentCheck(result['paymentIntentID'] as String);

        print('Order Result $result');

        //Crosscheck the PaymentIntentID with the amount calculcated on device.
        if (checkResult['paymentIntent']['amount'] ==
            store.state.cartState.cartTotal) {
          store.dispatch(
            CreateOrder(
              result['orderID'].toString(),
              result['paymentIntentID'] as String,
            ),
          );

          //subscribe to firebase topic of orderID

          await firebaseMessaging
              .subscribeToTopic('order-${result['orderID']}');

          successCallback();
        } else {
          //check if it is better to just update the total value with the api returned or return an error
          errorCallback("Order totals aren't matching");
        }
      } else {
        errorCallback('Our servers seem to be down');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        errorCallback(
          getErrorMessageForOrder(e.response!.data['cause']['code'] as String),
        );
      }
    } catch (e, s) {
      errorCallback('Something went wrong');
      log.error('ERROR - prepareAndSendOrder $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareAndSendOrder $e',
      );
    }
  };
}

ThunkAction<AppState> sendTokenPayment(
  VoidCallback successCallback,
  VoidCallback errorCallback,
) {
  return (Store<AppState> store) async {
    try {
      //Set loading to true
      store.dispatch(SetTransferringPayment(flag: true));

      final BigInt currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt currentPPLAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt selectedGBPXAmount =
          BigInt.from(store.state.cartState.selectedGBPxAmount);

      final BigInt selectedPPLAmount =
          BigInt.from(store.state.cartState.selectedPPLAmount);

      Map<String, dynamic> gbpxResponse = {};
      Map<String, dynamic> pplResponse = {};

      //Get tokens for GBPx and PPL
      // final Token gbpxToken =
      //     store.state.cashWalletState.tokens.values.firstWhere(
      //   (token) =>
      //       token.symbol.toLowerCase() == 'GBPx'.toString().toLowerCase(),
      // );

      // final Token PPLToken =
      //     store.state.cashWalletState.tokens.values.firstWhere(
      //   (token) => token.symbol.toLowerCase() == 'PPL'.toString().toLowerCase(),
      // );

      //If Selected GBPx amount is not 0, transfer GBPx

      if (selectedGBPXAmount.compareTo(BigInt.zero) > 0) {
        if (currentGBPXAmount.compareTo(selectedGBPXAmount) > 0) {
          gbpxResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            gbpxToken.address,
            store.state.cartState.restaurantWalletAddress,
            tokensAmount: store.state.cartState.selectedGBPxAmount.toString(),
            externalId: store.state.cartState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (selectedPPLAmount.compareTo(BigInt.zero) > 0) {
        if (currentPPLAmount.compareTo(selectedPPLAmount) > 0) {
          pplResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            pplToken.address,
            store.state.cartState.restaurantWalletAddress,
            tokensAmount: store.state.cartState.selectedPPLAmount.toString(),
            externalId: store.state.cartState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      // final Map<String, dynamic> GBPxResponse =
      //     store.state.cartState.selectedGBPxAmount != 0.0
      //         ? gbpxToken.amount > store.state.cartState.selectedGBPxAmount
      //             ? await chargeApi.tokenTransfer(
      //                 getIt<Web3>(),
      //                 store.state.userState.walletAddress,
      //                 gbpxToken.address,
      //                 store.state.cartState.restaurantWalletAddress,
      //                 tokensAmount:
      //                     store.state.cartState.selectedGBPxAmount.toString(),
      //                 externalId: store.state.cartState.paymentIntentID,
      //               )
      //             : {}
      //         : {};

      // print(GBPxResponse);

      //If Selected PPL Amount is not 0, transfer PPL
      // final Map<String, dynamic> PPLResponse =
      //     store.state.cartState.selectedPPLAmount != 0.0
      //         ? PPLToken.amount > store.state.cartState.selectedPPLAmount
      //             ? await chargeApi.tokenTransfer(
      //                 getIt<Web3>(),
      //                 store.state.userState.walletAddress,
      //                 PPLToken.address,
      //                 store.state.cartState.restaurantWalletAddress,
      //                 tokensAmount:
      //                     store.state.cartState.selectedPPLAmount.toString(),
      //                 externalId: store.state.cartState.paymentIntentID,
      //               )
      //             : {}
      //         : {};

      // print(PPLResponse);

      //Make periodic API calls to check the order status
      //If status is paid, then set loading = false, and confirmed = true

      if (gbpxResponse.isNotEmpty || pplResponse.isNotEmpty) {
        Timer.periodic(
          const Duration(seconds: 4),
          (timer) async {
            final Future<Map<dynamic, dynamic>> checkOrderResponse =
                peeplEatsService
                    .checkOrderStatus(store.state.cartState.orderID);

            await checkOrderResponse.then(
              (completedValue) {
                if (completedValue['paymentStatus'] == 'paid') {
                  store
                    ..dispatch(SetTransferringPayment(flag: false))
                    ..dispatch(SetConfirmed(flag: true));
                  successCallback();
                  timer.cancel();
                }
              },
            );
          },
        );
      }
    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - sendTokenPayment $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendTokenPayment $e',
      );
    }
  };
}

ThunkAction<AppState> setRestaurantDetails({
  required String restaurantID,
  required String restaurantName,
  required DeliveryAddresses restaurantAddress,
  required String walletAddress,
  required int minimumOrder,
  required int platformFee,
  required VoidCallback sendSnackBar,
}) {
  return (Store<AppState> store) async {
    try {
      //If cart has existing items -> clear cart, set new restaurant details, show snackbar if cart had items.

      if (store.state.cartState.restaurantName.isNotEmpty &&
          store.state.cartState.restaurantID.isNotEmpty) {
        sendSnackBar();
        store
          ..dispatch(ClearCart())
          ..dispatch(
            SetRestaurantDetails(
              restaurantID,
              restaurantName,
              restaurantAddress,
              walletAddress,
              minimumOrder,
              platformFee,
            ),
          );
      } else {
        store.dispatch(
          SetRestaurantDetails(
            restaurantID,
            restaurantName,
            restaurantAddress,
            walletAddress,
            minimumOrder,
            platformFee,
          ),
        );
      }
      // If cart does not have existing items -> set new restaurant details

    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - setRestaurantDetails $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setRestaurantDetails $e',
      );
    }
  };
}
