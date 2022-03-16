import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/models/tokens/token.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:redux/redux.dart';
import 'package:intl/intl.dart';
import 'package:wallet_core/wallet_core.dart';

class UpdateCartItems {
  final List<OrderItem> cartItems;
  UpdateCartItems({required this.cartItems});
}

class UpdateComputedCartValues {
  final int cartSubTotal;
  final int cartTax;
  final int cartTotal;
  final int cartDiscountComputed;

  UpdateComputedCartValues(this.cartSubTotal, this.cartTax, this.cartTotal,
      this.cartDiscountComputed);
}

class UpdateCartDiscount {
  final int cartDiscountPercent;
  final String discountCode;
  UpdateCartDiscount(this.cartDiscountPercent, this.discountCode);
}

class ClearCart {
  ClearCart();
}

class UpdateSlots {
  final List<Map<String, String>> deliverySlots;
  final List<Map<String, String>> collectionSlots;

  UpdateSlots(this.deliverySlots, this.collectionSlots);
}

class UpdateDeliveryAddressIndex {
  final int indexOfAddress;
  UpdateDeliveryAddressIndex(this.indexOfAddress);
}

class UpdateSlotIndex {
  final int index;
  UpdateSlotIndex(this.index);
}

class UpdateTipAmount {
  final int tipAmount;
  UpdateTipAmount(this.tipAmount);
}

class UpdateDeliveryAddress {
  final int index;
  UpdateDeliveryAddress(this.index);
}

class CreateOrder {
  final String orderID;
  final String paymentIntentID;
  CreateOrder(this.orderID, this.paymentIntentID);
}

class SetTransferringPayment {
  bool flag;
  SetTransferringPayment(this.flag);
}

class SetError {
  bool flag;
  SetError(this.flag);
}

class SetConfirmed {
  bool flag;
  SetConfirmed(this.flag);
}

class UpdateSelectedAmounts {
  final double GBPxAmount;
  final double PPLAmount;
  UpdateSelectedAmounts(this.GBPxAmount, this.PPLAmount);
}

class SetRestaurantDetails {
  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses restaurantAddress;

  SetRestaurantDetails(
      this.restaurantID, this.restaurantName, this.restaurantAddress);
}

ThunkAction getFullfillmentMethods({DateTime? newDate}) {
  return (Store store) async {
    try {
      DateFormat formatter = DateFormat('dd-MM-yyyy');

      if ([null, ""].contains(newDate)) {
        List<Map<String, String>> deliverySlots =
            await vegiEatsService.getDeliverySlots(
                vendorID: store.state.cartState.restaurantID,
                dateRequired: formatter.format(DateTime.now()));

        List<Map<String, String>> collectionSlots =
            await vegiEatsService.getCollectionSlots(
                vendorID: store.state.cartState.restaurantID,
                dateRequired: formatter.format(DateTime.now()));

        store.dispatch(UpdateSlots(deliverySlots, collectionSlots));
      } else {
        List<Map<String, String>> deliverySlots =
            await vegiEatsService.getDeliverySlots(
                vendorID: store.state.cartState.restaurantID,
                dateRequired: formatter.format(newDate!));

        List<Map<String, String>> collectionSlots =
            await vegiEatsService.getCollectionSlots(
                vendorID: store.state.cartState.restaurantID,
                dateRequired: formatter.format(newDate));

        store.dispatch(UpdateSlots(deliverySlots, collectionSlots));
      }
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

ThunkAction updateCartTip(int newTip) {
  return (Store store) async {
    try {
      store.dispatch(UpdateTipAmount(newTip));
      store.dispatch(computeCartTotals());
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

ThunkAction updateCartDiscount(
    String newDiscountCode, VoidCallback errorCallback) {
  return (Store store) async {
    try {
      if (newDiscountCode == 'REMOVE') {
        store.dispatch(UpdateCartDiscount(0, ""));
        store.dispatch(computeCartTotals());
      } else {
        int discountPercent =
            await vegiEatsService.checkDiscountCode(newDiscountCode).onError(
          (error, stackTrace) {
            errorCallback();
            return 0;
          },
        );

        if (discountPercent != 0) {
          store.dispatch(UpdateCartDiscount(discountPercent, newDiscountCode));
          store.dispatch(computeCartTotals());
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

ThunkAction updateCartItems(OrderItem itemToAdd) {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;

      cartItems.add(itemToAdd);

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
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

ThunkAction updateCartItemQuantity(OrderItem itemToAdd) {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;
      if (itemToAdd.itemQuantity == 0) {
        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);
      } else {
        int index = cartItems.indexWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.removeWhere(
            (element) => element.internalID == itemToAdd.internalID);

        cartItems.insert(index, itemToAdd);
      }

      store.dispatch(UpdateCartItems(cartItems: cartItems));

      store.dispatch(computeCartTotals());
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

ThunkAction computeCartTotals() {
  return (Store store) async {
    try {
      List<OrderItem> cartItems = store.state.cartState.cartItems;

      int cartSubTotal = 0;
      int cartTax = 0;
      int cartTotal = 0;
      int deliveryPrice = 0; //TODO: fetch from API
      int cartDiscountPercent = store.state.cartState.cartDiscountPercent;
      int cartDiscountComputed = 0;
      int cartTip = store.state.cartState.selectedTipAmount * 100;

      cartItems.forEach((element) {
        cartSubTotal += element.totalItemPrice;
      }); // add price of each order Item (which has options included)

      cartDiscountComputed =
          (cartSubTotal * cartDiscountPercent) ~/ 100; // subtotal * discount

      //cartTax = ((cartSubTotal - cartDiscountComputed) * 5) ~/ 100;

      cartTotal = (cartSubTotal + cartTax + cartTip + deliveryPrice) -
          cartDiscountComputed;

      store.dispatch(UpdateComputedCartValues(
          cartSubTotal, cartTax, cartTotal, cartDiscountComputed));
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

ThunkAction prepareAndSendOrder(
    VoidCallback errorCallback, VoidCallback successCallback) {
  return (Store store) async {
    try {
      //Prepare fields for order object
      DeliveryAddresses selectedAddress =
          store.state.userState.listOfDeliveryAddresses[
              store.state.cartState.selectedDeliveryAddressIndex - 1];

      bool isDelivery = store.state.cartState.selectedDeliveryAddressIndex == 0
          ? false
          : true;

      //Format Object for API
      Map<String, dynamic> orderObject = {
        "items": store.state.cartState.cartItems
            .map(
              (e) => {
                "id": int.parse(e.menuItem.menuItemID),
                "options": e.selectedProductOptions.map(
                  (key, value) =>
                      MapEntry<String, int>(key.toString(), value.optionID),
                ),
              },
            )
            .toList(),
        "address": {
          "name": store.state.userState.displayName,
          "phoneNumber": store.state.userState.phoneNumber,
          "email": store.state.userState.email == ""
              ? "surti.huss@gmail.com"
              : store.state.userState.email,
          "lineOne": selectedAddress.houseNumber,
          "lineTwo":
              selectedAddress.buildingName + ", " + selectedAddress.townCity,
          "postCode": selectedAddress.postalCode,
          "deliveryInstructions": " ",
        },
        "total": store.state.cartState.cartTotal,
        "tipAmount": store.state.cartState.selectedTipAmount,
        "marketingOptIn": false,
        "discountCode": store.state.cartState.discountCode,
        "vendor": 1,
        "fulfilmentMethod": isDelivery ? 1 : 0,
        "fulfilmentSlotFrom": isDelivery
            ? formatDateForOrderObject(store
                .state
                .cartState
                .deliverySlots[store.state.cartState.selectedSlotIndex]
                .entries
                .first
                .value)
            : formatDateForOrderObject(store
                .state
                .cartState
                .collectionSlots[store.state.cartState.selectedSlotIndex]
                .entries
                .first
                .value),
        "fulfilmentSlotTo": isDelivery
            ? formatDateForOrderObject(store
                .state
                .cartState
                .deliverySlots[store.state.cartState.selectedSlotIndex]
                .entries
                .last
                .value)
            : formatDateForOrderObject(store
                .state
                .cartState
                .collectionSlots[store.state.cartState.selectedSlotIndex]
                .entries
                .last
                .value),
      };

      print(json.encode(orderObject).toString());

      //Call create order API with prepared orderobject
      Map result = await vegiEatsService
          .createOrder(orderObject)
          .timeout(Duration(seconds: 5), onTimeout: () {
        return {}; //return empty map on timeout to trigger errorCallback
      });

      if (result.isNotEmpty) {
        //Call Peepl Pay API to start checking the paymentIntentID
        Map checkResult = await peeplPayService
            .startPaymentIntentCheck(result['paymentIntentID']);

        print("order result $result");

        //Crosscheck the PaymentIntentID with the amount calculcated on device.
        if (checkResult['paymentIntent']['amount'] ==
            store.state.cartState.cartTotal) {
          store.dispatch(CreateOrder(
              result['orderID'].toString(), result['paymentIntentID']));

          //subscribe to firebase topic of orderID

          firebaseMessaging.subscribeToTopic(result['orderID'].toString());

          successCallback();
        } else {
          //check if it is better to just update the total value with the api returned or return an error
          errorCallback();
        }
      } else {
        errorCallback();
      }
    } catch (e, s) {
      errorCallback();
      log.error('ERROR - prepareAndSendOrder $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareAndSendOrder $e',
      );
    }
  };
}

ThunkAction sendTokenPayment(VoidCallback successCallback) {
  return (Store store) async {
    try {
      //TODO: Remove please
      if (store.state.cartState.discountCode == "") {
        successCallback();
        return;
      }
      //Set loading to true
      store.dispatch(SetTransferringPayment(true));

      //Get tokens for GBPx and PPL
      Token GBPxToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) =>
            token.symbol.toLowerCase() == "GBPx".toString().toLowerCase(),
      );

      Token PPLToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) => token.symbol.toLowerCase() == "PPL".toString().toLowerCase(),
      );

      //If Selected GBPx amount is not 0, transfer GBPx
      dynamic GBPxResponse = store.state.cartState.selectedGBPxAmount != 0.0
          ? await walletApi.tokenTransfer(
              getIt<Web3>(instanceName: 'fuseWeb3'),
              store.state.userState.walletAddress,
              GBPxToken.address,
              "0xf039CD9391cB28a7e632D07821deeBc249a32410",
              store.state.cartState.selectedGBPxAmount.toString(),
              externalId: store.state.cartState.paymentIntentID,
            )
          : null;

      print(GBPxResponse);

      //If Selected PPL Amount is not 0, transfer PPL
      dynamic PPLResponse = store.state.cartState.selectedPPLAmount != 0.0
          ? await walletApi.tokenTransfer(
              getIt<Web3>(instanceName: 'fuseWeb3'),
              store.state.userState.walletAddress,
              PPLToken.address,
              "0xf039CD9391cB28a7e632D07821deeBc249a32410",
              store.state.cartState.selectedPPLAmount.toString(),
              externalId: store.state.cartState.paymentIntentID,
            )
          : null;

      print(PPLResponse);

      //Make periodic API calls to check the order status
      //If status is paid, then set loading = false, and confirmed = true

      Timer.periodic(
        const Duration(seconds: 4),
        (timer) async {
          final Future<Map<dynamic, dynamic>> checkOrderResponse =
              vegiEatsService.checkOrderStatus(store.state.cartState.orderID);

          checkOrderResponse.then(
            (completedValue) {
              if (completedValue['paymentStatus'] == "paid") {
                store.dispatch(SetTransferringPayment(false));
                store.dispatch(SetConfirmed(true));
                successCallback();
                timer.cancel();
              }
            },
          );
        },
      );
    } catch (e, s) {
      store.dispatch(SetError(true));
      log.error('ERROR - updateComputeUserCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateComputeUserCart $e',
      );
    }
  };
}

ThunkAction setRestaurantDetails(String restaurantID, String restaurantName,
    DeliveryAddresses restaurantAddress, VoidCallback sendSnackBar) {
  return (Store store) async {
    try {
      //If cart has existing items -> clear cart, set new restaurant details, show snackbar if cart had items.

      if (store.state.cartState.restaurantName.isNotEmpty &&
          store.state.cartState.restaurantID.isNotEmpty) {
        sendSnackBar();
        store.dispatch(ClearCart());
        store.dispatch(
          SetRestaurantDetails(
            restaurantID,
            restaurantName,
            restaurantAddress,
          ),
        );
      } else {
        store.dispatch(
          SetRestaurantDetails(
            restaurantID,
            restaurantName,
            restaurantAddress,
          ),
        );
      }

      // If cart does not have existing items -> set new restaurant details

    } catch (e, s) {
      store.dispatch(SetError(true));
      log.error('ERROR - setRestaurantDetails $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setRestaurantDetails $e',
      );
    }
  };
}
