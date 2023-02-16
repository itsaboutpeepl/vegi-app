import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/qRFromCartSheet.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForCollection.dart';
import 'package:vegan_liverpool/models/cart/createOrderForDelivery.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/cart/productSuggestion.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/payment_methods.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
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

class CreateProductSuggestion {
  CreateProductSuggestion();

  final productSuggestion = ProductSuggestion.newUid();

  @override
  String toString() {
    return 'CreateProductSuggestion()';
  }
}

class AddImageToProductSuggestionRTO {
  AddImageToProductSuggestionRTO({
    required this.imageType,
    required this.image,
  });

  final ProductSuggestionImageType imageType;
  // final String imageUrl;
  // final String imageUid;
  final UploadProductSuggestionImageResponse image;

  @override
  String toString() {
    return 'AddImageToProductSuggestionRTO : [${imageType.name}, ${image.url}]';
  }
}

class AddQRCodeToProductSuggestionRTO {
  AddQRCodeToProductSuggestionRTO({
    required this.qrCode,
  });

  final String qrCode;

  @override
  String toString() {
    return 'AddQRCodeToProductSuggestionRTO : ${qrCode}';
  }
}

class AddAdditionalInformationToProductSuggestionRTO {
  AddAdditionalInformationToProductSuggestionRTO({
    required this.additionalInfo,
  });

  final String additionalInfo;

  @override
  String toString() {
    return 'AddAdditinalInformationToProductSuggestionRTO : $additionalInfo';
  }
}

class AddProductNameToProductSuggestionRTO {
  AddProductNameToProductSuggestionRTO({
    required this.productName,
    required this.retailerName,
  });

  final String productName;
  final String retailerName;

  @override
  String toString() {
    return 'AddProductNameToProductSuggestionRTO : $productName ; $retailerName';
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
    return 'UpdateComputedCartValues : CartSubTotal: $cartSubTotal, '
        'cartTax: $cartTax, cartTotal: $cartTotal, '
        'cartDiscountComputed: $cartDiscountComputed';
  }
}

class UpdateCartDiscount {
  UpdateCartDiscount(this.cartDiscountPercent, this.discountCode);
  final int cartDiscountPercent;
  final String discountCode;

  @override
  String toString() {
    return 'UpdateCartDiscount : cartDiscountPercent: $cartDiscountPercent, '
        'discountCode: $discountCode';
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
  UpdateSlots({required this.deliverySlots, required this.collectionSlots});
  final List<TimeSlot> deliverySlots;
  final List<TimeSlot> collectionSlots;

  @override
  String toString() {
    return 'UpdateSlots : deliverySlots: $deliverySlots, '
        'collectionSlots: $collectionSlots';
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
  final TimeSlot? selectedTimeSlot;

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
    return 'SetTransferringPayment : flag: $flag';
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
  UpdateSelectedAmounts({required this.gbpxAmount, required this.pplAmount});
  final double gbpxAmount;
  final double pplAmount;

  @override
  String toString() {
    return 'UpdateSelectedAmounts : GBPxAmount: $gbpxAmount,'
        'PPLAmount:$pplAmount';
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
    this.fulfilmentPostalDistricts,
  );
  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses restaurantAddress;
  final String walletAddress;
  final int minimumOrder;
  final int platformFee;
  final List<String> fulfilmentPostalDistricts;

  @override
  String toString() {
    return 'SetRestaurantDetails : restaurantID: $restaurantID, '
        'restaurantName: $restaurantName, restaurantAddress:'
        '$restaurantAddress, walletAddress:$walletAddress, '
        'minimumOrder:$minimumOrder, platformFee:$platformFee, '
        'fulfilmentPostalDistricts: $fulfilmentPostalDistricts';
  }
}

class SetFulfilmentCharge {
  SetFulfilmentCharge(this.fulfilmentCharge);
  final int fulfilmentCharge;

  @override
  String toString() {
    return 'SetFulfilmentCharge : fulfilmentCharge: $fulfilmentCharge';
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
    return 'SetDeliveryInstructions : deliveryInstructions: '
        '$deliveryInstructions';
  }
}

class SetPaymentMethod {
  SetPaymentMethod(this.paymentMethod);
  final PaymentMethod paymentMethod;

  @override
  String toString() {
    return 'SetPaymentMethod : paymentMethod: $paymentMethod';
  }
}

class SetPaymentButtonFlag {
  SetPaymentButtonFlag(this.flag);
  final bool flag;

  @override
  String toString() {
    return 'SetPaymentButtonFlag : flag: $flag';
  }
}

class UpdateEligibleOrderDates {
  UpdateEligibleOrderDates(this.eligibleOrderDates);
  final List<DateTime> eligibleOrderDates;

  @override
  String toString() {
    return 'UpdateEligibleOrderDates : eligibleOrderDates: $eligibleOrderDates';
  }
}

class UpdateNextAvaliableTimeSlots {
  UpdateNextAvaliableTimeSlots({
    required this.collectionSlot,
    required this.deliverySlot,
  });
  final TimeSlot? collectionSlot;
  final TimeSlot? deliverySlot;
  @override
  String toString() {
    return 'UpdateNextAvaliableTimeSlots : collectionSlot: '
        '$collectionSlot, deliverySlot: $deliverySlot';
  }
}

ThunkAction<AppState> getTimeSlots({required DateTime newDate}) {
  return (Store<AppState> store) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final Map<String, List<TimeSlot>> timeSlots =
          await peeplEatsService.getFulfilmentSlots(
        vendorID: store.state.cartState.restaurantID,
        dateRequired: formatter.format(newDate),
      );

      store.dispatch(
        UpdateSlots(
          deliverySlots: timeSlots['deliverySlots']!,
          collectionSlots: timeSlots['collectionSlots']!,
        ),
      );
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

ThunkAction<AppState> getNextAvaliableSlot() {
  return (Store<AppState> store) async {
    try {
      final Map<String, TimeSlot?> nextAvaliableSlots =
          await peeplEatsService.getNextAvaliableSlot(
        vendorID: store.state.cartState.restaurantID,
      );

      store.dispatch(
        UpdateNextAvaliableTimeSlots(
          collectionSlot: nextAvaliableSlots['collectionSlot'],
          deliverySlot: nextAvaliableSlots['deliverySlot'],
        ),
      );

      if (store.state.cartState.isDelivery) {
        store.dispatch(
          updateSelectedTimeSlot(
            selectedTimeSlot: nextAvaliableSlots['deliverySlot'],
          ),
        );
      } else {
        store.dispatch(
          updateSelectedTimeSlot(
            selectedTimeSlot: nextAvaliableSlots['collectionSlot'],
          ),
        );
      }
    } catch (e, s) {
      log.error('ERROR - getNextAvaliableSlot $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getNextAvaliableSlot $e',
      );
    }
  };
}

ThunkAction<AppState> getEligibleOrderDates() {
  return (Store<AppState> store) async {
    try {
      final List<String> eligibleDatesString =
          await peeplEatsService.getAvaliableDates(
        vendorID: store.state.cartState.restaurantID,
        isDelivery: store.state.cartState.isDelivery,
      );

      final List<DateTime> eligibleDates = [];

      for (final date in eligibleDatesString) {
        eligibleDates.add(DateTime.parse(date));
      }

      eligibleDates.sort((first, next) => first.compareTo(next));

      if (eligibleDates.isNotEmpty) {
        store.dispatch(getTimeSlots(newDate: eligibleDates.first));
      }

      store.dispatch(UpdateEligibleOrderDates(eligibleDates));
    } catch (e, s) {
      log.error('ERROR - getEligibleOrderDates $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - getEligibleOrderDates $e',
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

ThunkAction<AppState> updateCartDiscount({
  required String newDiscountCode,
  required void Function() successCallback,
  required void Function() errorCallback,
}) {
  return (Store<AppState> store) async {
    try {
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
        successCallback();
      }
    } catch (e, s) {
      log.error('ERROR - updateCartDiscount $e');
      errorCallback();
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCartDiscount $e',
      );
    }
  };
}

ThunkAction<AppState> updateSelectedTimeSlot({
  required TimeSlot? selectedTimeSlot,
}) {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(
          UpdateSelectedTimeSlot(selectedTimeSlot),
        )
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - updateCartDiscount $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCartDiscount $e',
      );
    }
  };
}

ThunkAction<AppState> removeCartDiscount() {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(UpdateCartDiscount(0, ''))
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - removeCartDiscount $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - removeCartDiscount $e',
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
      log.error('ERROR - updateCartItems $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateCartItems $e',
      );
    }
  };
}

ThunkAction<AppState> scanRestaurantMenuItemQRCode(
  String itemQRCode,
  void Function() successHandler,
  void Function(String, QRCodeScanErrCode) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      final selectedRestaurantId = store.state.cartState.restaurantID;

      final menuItem = await peeplEatsService.getRestaurantMenuItemByQrCode(
        barCode: itemQRCode,
        restaurantID: selectedRestaurantId,
      );

      if (menuItem == null) {
        const warning =
            'WARNING - scanRestaurantMenuItemQRCode - No Barcode matches the scanned QR Code';
        log.warn(warning);
        await Sentry.captureMessage(
          warning,
        );
        errorHandler(warning, QRCodeScanErrCode.productNotFound);
        return;
      }
      final selectedProductOption =
          menuItem.listOfProductOptions[0].listOfOptions[0];
      final cartItem = CartItem(
        internalID: Random(
          DateTime.now().millisecondsSinceEpoch,
        ).nextInt(100000),
        menuItem: menuItem,
        totalItemPrice: calculateMenuItemPrice(
          menuItem: menuItem,
          quantity: 1,
          productOptions: menuItem.listOfProductOptions[0].listOfOptions,
        ).totalPrice,
        // lib/redux/actions/menu_item_actions.dart:119
        //
        itemQuantity: 1,
        //this quantity always needs to be 1 to work
        //with the api. the actual quantity of the
        //object is calculated using the viewmodel
        //quantity field. Then the object is just
        //duplicated and added to the cart items.
        selectedProductOptions: {
          selectedProductOption.optionID: selectedProductOption,
        },
      );

      // final restaurant =
      //     store.state.homePageState.featuredRestaurants.firstWhere(
      //   (element) => element.restaurantID == selectedRestaurantId,
      // );

      // final items = <CartItem>[];
      // for (final menuItem in restaurant.listOfMenuItems) {
      //   for (final productOptionCategory in menuItem.listOfProductOptions) {
      //     for (final productOption in productOptionCategory.listOfOptions) {
      //       if (productOption.productBarCode == itemQRCode) {
      //         items.add(
      //           CartItem(
      //             internalID: Random(
      //               DateTime.now().millisecondsSinceEpoch,
      //             ).nextInt(100000),
      //             menuItem: menuItem,
      //             totalItemPrice: calculateMenuItemPrice(
      //               menuItem: menuItem,
      //               quantity: 1,
      //               productOptions: [productOption],
      //             ).totalPrice,
      //             // lib/redux/actions/menu_item_actions.dart:119
      //             //
      //             itemQuantity: 1,
      //             //this quantity always needs to be 1 to work
      //             //with the api. the actual quantity of the
      //             //object is calculated using the viewmodel
      //             //quantity field. Then the object is just
      //             //duplicated and added to the cart items.
      //             selectedProductOptions: {
      //               productOption.optionID: productOption
      //             },
      //           ),
      //         );
      //       }
      //     }
      //   }
      // }

      // if (items.isEmpty) {
      //   const warning =
      //       'WARNING - scanRestaurantMenuItemQRCode - No Barcode matches the scanned QR Code';
      //   log.warn(warning);
      //   await Sentry.captureMessage(
      //     warning,
      //   );
      //   errorHandler(warning, QRCodeScanErrCode.productNotFound);
      // }

      final List<CartItem> cartItems =
          List.from(store.state.cartState.cartItems)..add(cartItem);

      store
        ..dispatch(UpdateCartItems(cartItems: cartItems))
        ..dispatch(computeCartTotals());

      successHandler();
    } catch (e, s) {
      log.error('ERROR - scanRestaurantMenuItemQRCode $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - scanRestaurantMenuItemQRCode $e',
      );
      if (e is DioError && e.response != null) {
        if (e.response!.statusCode == 404) {
          return errorHandler(
            'ERROR - scanRestaurantMenuItemQRCode $e',
            QRCodeScanErrCode.productNotFound,
          );
        }
      }
      errorHandler(
        'ERROR - scanRestaurantMenuItemQRCode $e',
        QRCodeScanErrCode.connectionIssue,
      );
    }
  };
}

ThunkAction<AppState> addAdditionalInformationToProductSuggestion(
  String additionalInfo,
  void Function() successHandler,
  void Function(String) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        AddAdditionalInformationToProductSuggestionRTO(
          additionalInfo: additionalInfo,
        ),
      );

      successHandler();
    } catch (e, s) {
      log.error('ERROR - addAdditionalInformationToProductSuggestion e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - addAdditionalInformationToProductSuggestion e',
      );
      errorHandler(
        'ERROR - addAdditionalInformationToProductSuggestion e',
      );
    }
  };
}

ThunkAction<AppState> addProductQRCodeToProductSuggestion(
  String itemQRCode,
  void Function() successHandler,
  void Function(String, QRCodeScanErrCode) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      var currentProductSuggestion = store.state.cartState.productSuggestion;
      if (currentProductSuggestion == null) {
        final ps = CreateProductSuggestion();
        await store.dispatch(
          ps,
        );
        currentProductSuggestion =
            store.state.cartState.productSuggestion ?? ps.productSuggestion;
      }
      store.dispatch(AddQRCodeToProductSuggestionRTO(qrCode: itemQRCode));

      successHandler();
    } catch (e, s) {
      log.error('ERROR - addProductQRCodeToProductSuggestion e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - addProductQRCodeToProductSuggestion e',
      );
      errorHandler(
        'ERROR - addProductQRCodeToProductSuggestion e',
        QRCodeScanErrCode.couldntScan,
      );
    }
  };
}

ThunkAction<AppState> addProductNameToProductSuggestion(
  String productName,
  String retailerName,
  void Function() successHandler,
  void Function(String) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      var currentProductSuggestion = store.state.cartState.productSuggestion;
      if (currentProductSuggestion == null) {
        final ps = CreateProductSuggestion();
        await store.dispatch(
          ps,
        );
        currentProductSuggestion =
            store.state.cartState.productSuggestion ?? ps.productSuggestion;
      }
      store.dispatch(
        AddProductNameToProductSuggestionRTO(
          productName: productName,
          retailerName: retailerName,
        ),
      );

      successHandler();
    } catch (e, s) {
      log.error('ERROR - addProductNameToProductSuggestion e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - addProductNameToProductSuggestion e',
      );
      errorHandler(
        'ERROR - addProductNameToProductSuggestion e',
      );
    }
  };
}

// ThunkAction<AppState> createNewProductSuggestion(
//   void Function() successHandler,
//   void Function(String) errorHandler,
// ) {
//   return (Store<AppState> store) async {
//     try {
//       store.dispatch(CreateProductSuggestion());
//       successHandler();
//     } catch (e, s) {
//       log.error('ERROR - createNewProductSuggestion e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - createNewProductSuggestion e',
//       );
//       errorHandler(
//         'ERROR - createNewProductSuggestion e',
//       );
//     }
//   };
// }

ThunkAction<AppState> addImageToProductSuggestion(
  ProductSuggestionImageType imageType,
  File image,
  void Function() successHandler,
  void Function(String) errorHandler,
) {
  return (Store<AppState> store) async {
    var currentProductSuggestion = store.state.cartState.productSuggestion;
    if (currentProductSuggestion == null) {
      final ps = CreateProductSuggestion();
      await store.dispatch(
        ps,
      );
      currentProductSuggestion =
          store.state.cartState.productSuggestion ?? ps.productSuggestion;
    }
    try {
      final response = await peeplEatsService.uploadImageForProductSuggestion(
        deviceSuggestionUID: currentProductSuggestion.uid,
        image: image,
        onError: (error, errCode) => errorHandler(error),
        onReceiveProgress: (count, total) {},
        onSuccess: (p0) {},
      );
      if (response != null) {
        store.dispatch(
          AddImageToProductSuggestionRTO(
            image: response,
            imageType: imageType,
          ),
        );
        successHandler();
      } else {
        log.error('ERROR - addImageToProductSuggestion failed to upload image');
        await Sentry.captureException(
          e,
          hint: 'ERROR - addImageToProductSuggestion failed to upload image',
        );
        errorHandler(
          'ERROR - addImageToProductSuggestion e',
        );
      }
    } catch (e, s) {
      log.error('ERROR - addImageToProductSuggestion $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - addImageToProductSuggestion $e',
      );
      errorHandler(
        'ERROR - addImageToProductSuggestion $e',
      );
    }
  };
}

ThunkAction<AppState> uploadProductSuggestion(
  void Function() successHandler,
  void Function(String, ProductSuggestionUploadErrCode) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      final productSuggestion = store.state.cartState.productSuggestion;
      if (productSuggestion == null) {
        return errorHandler(
          'No product suggestion in application state',
          ProductSuggestionUploadErrCode.unknownError,
        );
      }
      await peeplEatsService.uploadProductSuggestion(
        productSuggestion,
        successHandler,
        errorHandler,
      );
      store.dispatch(CreateProductSuggestion());
    } catch (e, s) {
      log.error('ERROR - uploadProductSuggestion e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - uploadProductSuggestion e',
      );
      errorHandler(
        'ERROR - uploadProductSuggestion e',
        ProductSuggestionUploadErrCode.unknownError,
      );
    }
  };
}

ThunkAction<AppState> addDuplicateCartItem(int itemId) {
  return (Store<AppState> store) async {
    try {
      final cartItem = store.state.cartState.cartItems
          .where((element) => element.internalID == itemId)
          .first
          .copyWith(
            internalID: Random(
              DateTime.now().millisecondsSinceEpoch,
            ).nextInt(100000),
          );

      final List<CartItem> cartItems =
          List.from(store.state.cartState.cartItems)..add(cartItem);

      store
        ..dispatch(UpdateCartItems(cartItems: cartItems))
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error('ERROR - addDuplicateCartItem $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - addDuplicateCartItem $e',
      );
    }
  };
}

ThunkAction<AppState> removeCartItem(int itemId) {
  return (Store<AppState> store) async {
    try {
      final List<CartItem> cartItems =
          List.from(store.state.cartState.cartItems)
            ..removeWhere((element) => element.internalID == itemId);

      store
        ..dispatch(UpdateCartItems(cartItems: cartItems))
        ..dispatch(computeCartTotals());

      if (cartItems.isEmpty) {
        rootRouter.navigateBack();
      }
    } catch (e, s) {
      log.error('ERROR - removeCartItem $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - removeCartItem $e',
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
      final int fulfilmentCharge =
          store.state.cartState.selectedTimeSlot != null
              ? store.state.cartState.selectedTimeSlot!.priceModifier
              : 0;
      final int platformFee = store.state.cartState.restaurantPlatformFee;
      final int cartDiscountPercent = store.state.cartState.cartDiscountPercent;
      int cartDiscountComputed = 0;
      final int cartTip = store.state.cartState.selectedTipAmount;

      for (final element in cartItems) {
        cartSubTotal += element.totalItemPrice;
      }

      cartDiscountComputed =
          (cartSubTotal * cartDiscountPercent) ~/ 100; // subtotal * discount

      cartTotal =
          (cartSubTotal + cartTax + cartTip + fulfilmentCharge + platformFee) -
              cartDiscountComputed;

      if (cartItems.isEmpty) {
        cartSubTotal = 0;
        cartTotal = 0;
        cartDiscountComputed = 0;
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
      log.error('ERROR - computeCartTotals $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - computeCartTotals $e',
      );
    }
  };
}

ThunkAction<AppState> startOrderCreationProcess({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      final cartState = store.state.cartState;
      if (cartState.selectedTimeSlot == null) {
        showErrorSnack(context: context, title: 'Please select a time slot');
        return;
      }
      if (cartState.selectedDeliveryAddress == null && cartState.isDelivery) {
        showErrorSnack(
          context: context,
          title: 'Please select a delivery address',
        );
        return;
      }
      if (cartState.restaurantMinimumOrder > cartState.cartSubTotal) {
        showErrorSnack(
          context: context,
          title: 'This restaurant is not accepting orders below'
              '${cartState.restaurantMinimumOrder.formattedPrice}',
        );
      } else {
        if (cartState.isDelivery) {
          store.dispatch(
            prepareOrderObjectForDelivery(context: context),
          );
        } else {
          store.dispatch(
            prepareOrderObjectForCollection(context: context),
          );
        }
      }
    } catch (e, s) {
      log.error('ERROR - checkCartForErrors $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - checkCartForErrors $e',
      );
    }
  };
}

ThunkAction<AppState> prepareOrderObjectForDelivery({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      final orderObject = CreateOrderForDelivery.fromStore(store);

      log.info(orderObject.toJson());

      store.dispatch(
        sendOrderObject(
          orderObject: orderObject,
          context: context,
        ),
      );
    } catch (e, s) {
      log.error('ERROR - prepareOrderObjectForDelivery $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareOrderObjectForDelivery $e',
      );
    }
  };
}

ThunkAction<AppState> prepareOrderObjectForCollection({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      final orderObject = CreateOrderForCollection.fromStore(store);

      log.info(orderObject.toJson());
      store.dispatch(
        sendOrderObject(orderObject: orderObject, context: context),
      );
    } catch (e, s) {
      log.error('ERROR - prepareOrderObjectForCollection $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareOrderObjectForCollection $e',
      );
    }
  };
}

ThunkAction<AppState> sendOrderObject<T extends CreateOrderForFulfilment>({
  required T orderObject,
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetPaymentButtonFlag(true));
      final Map<String, dynamic> result =
          await peeplEatsService.createOrder(orderObject).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return {};
        },
      );

      if (result.isEmpty) {
        showErrorSnack(context: context, title: 'The operation has timed out');
      } else {
        log.info('Order Result $result');
        final Map<String, dynamic> checkResult = await peeplPayService
            .checkOrderValidity(result['paymentIntentID'] as String);

        final Map<String, dynamic> paymentIntent =
            checkResult['paymentIntent'] as Map<String, dynamic>;

        if (paymentIntent['amount'] != store.state.cartState.cartTotal) {
          showErrorSnack(
            context: context,
            title: "Order totals aren't matching",
          );
        } else {
          store
            ..dispatch(
              CreateOrder(
                result['orderId'].toString(),
                result['paymentIntentID'] as String,
              ),
            )
            ..dispatch(startPaymentProcess(context: context));
          unawaited(
            firebaseMessaging.subscribeToTopic('order-${result['orderId']}'),
          );
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.orderGen,
              properties: {
                'status': 'success',
                'orderId': result['orderId'].toString(),
                'orderTotal': store.state.cartState.cartTotal,
                'paymentIntentID': result['paymentIntentID'] as String,
              },
            ),
          );
        }
      }
    } on DioError catch (e) {
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.orderGen,
          properties: {
            'status': 'failure',
          },
        ),
      );
      store.dispatch(SetPaymentButtonFlag(false));
      if (e.response != null) {
        if (e.response == 'Interal Server Error') {
          await Sentry.captureException(
            e,
            hint: 'DioError - sendOrderObject - '
                'Internal Server Error',
          );
          showErrorSnack(
            context: context,
            title: 'Our servers seem to be down',
          );
        }
        log.error(e.response!.data);
        await Sentry.captureException(
          e,
          hint: 'DioError - sendOrderObject - '
              "${e.response!.data['cause']['code']}",
        );
        showErrorSnack(
          context: context,
          title: getErrorMessageForOrder(
            e.response!.data['cause']['code'] as String,
          ),
        );
      }
    } catch (e, s) {
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.orderGen,
          properties: {
            'status': 'failure',
          },
        ),
      );
      store.dispatch(SetPaymentButtonFlag(false));
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

ThunkAction<AppState> startPaymentProcess({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      if (store.state.cartState.selectedPaymentMethod == PaymentMethod.stripe) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payStripe,
          ),
        );
        await stripeService
            .handleStripe(
          walletAddress: store.state.userState.walletAddress,
          amount: store.state.cartState.cartTotal,
          context: context,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store
                ..dispatch(SetPaymentButtonFlag(false))
                ..dispatch(SetTransferringPayment(flag: value));
              return;
            }
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.mint,
                properties: {
                  'status': 'success',
                },
              ),
            );
            store
              ..dispatch(
                UpdateSelectedAmounts(
                  gbpxAmount: (store.state.cartState.cartTotal) / 100,
                  pplAmount: 0,
                ),
              )
              ..dispatch(
                startTokenPaymentToRestaurant(
                  context: context,
                ),
              );
          },
        );
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.qrPay) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payQRVegi,
          ),
        );

        await showModalBottomSheet<Widget>(
          isScrollControlled: true,
          backgroundColor: const Color.fromARGB(255, 44, 42, 39),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          elevation: 5,
          context: context,
          builder: (context) => const QRFromCartSheet(),
        );
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.applePay) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.mint,
          ),
        );
        await stripeService
            .handleApplePay(
          walletAddress: store.state.userState.walletAddress,
          amount: store.state.cartState.cartTotal,
          context: context,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(SetTransferringPayment(flag: value));
              return;
            }
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.mint,
                properties: {
                  'status': 'success',
                },
              ),
            );
            store
              ..dispatch(
                UpdateSelectedAmounts(
                  gbpxAmount: (store.state.cartState.cartTotal) / 100,
                  pplAmount: 0,
                ),
              )
              ..dispatch(
                startTokenPaymentToRestaurant(
                  context: context,
                ),
              );
          },
        ).catchError((error) {
          throw Exception('Apple Pay Failed - $error');
        });
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.peeplPay) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payPeepl,
          ),
        );
        //show the peepl pay sheet
        //user selects to pay with peepl rewards or GBPx
        //if gbpx is not enough -> stripe payment until GBPx gets added.
        //transfer tokens
        //show loading popup
        //show order confirmed

        await showModalBottomSheet<Widget>(
          isScrollControlled: true,
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          elevation: 5,
          context: context,
          builder: (context) => const PaymentSheet(),
        );
      }
    } catch (e, s) {
      store.dispatch(SetPaymentButtonFlag(false));
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

ThunkAction<AppState> startPeeplPayProcess({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      final double currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.getAmount();

      final double selectedGBPXAmount =
          store.state.cartState.selectedGBPxAmount;

      final hasSufficientGbpxBalance =
          selectedGBPXAmount.compareTo(currentGBPXAmount) < 0;

      if (hasSufficientGbpxBalance) {
        store.dispatch(startTokenPaymentToRestaurant(context: context));
      } else {
        await stripeService
            .handleStripe(
          walletAddress: store.state.userState.walletAddress,
          amount: (selectedGBPXAmount * 100).toInt(),
          context: context,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(SetTransferringPayment(flag: value));
              return;
            }
            store.dispatch(
              startTokenPaymentToRestaurant(
                context: context,
              ),
            );
          },
        );
      }
    } catch (e, s) {
      store.dispatch(SetPaymentButtonFlag(false));
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

ThunkAction<AppState> startTokenPaymentToRestaurant({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      //Set loading to true
      store
        ..dispatch(SetTransferringPayment(flag: true))
        ..dispatch(SetPaymentButtonFlag(false));
      unawaited(
        showDialog<void>(
          context: context,
          builder: (context) => const ProcessingPayment(),
        ),
      );

      final BigInt currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt currentPPLAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt selectedGBPXAmount =
          BigInt.from(store.state.cartState.selectedGBPxAmount);

      final BigInt selectedPPLAmount =
          BigInt.from(store.state.cartState.selectedPPLAmount);

      final bool isGBPXSelected = selectedGBPXAmount.compareTo(BigInt.zero) > 0;
      final bool isPPLSelected = selectedPPLAmount.compareTo(BigInt.zero) > 0;

      Map<String, dynamic> gbpxResponse = {};
      Map<String, dynamic> pplResponse = {};

      if (isGBPXSelected) {
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

      if (isPPLSelected) {
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

      if (isGBPXSelected && gbpxResponse.isEmpty) {
        throw Exception('Error transferring GBPX token: $gbpxResponse');
      }
      if (isPPLSelected && pplResponse.isEmpty) {
        throw Exception('Error transferring PPL token: $pplResponse');
      }
      log
        ..info('gbpxResponse: $gbpxResponse')
        ..info('pplResponse: $pplResponse');
      store.dispatch(startPaymentConfirmationCheck());
    } catch (e, s) {
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.payment,
          properties: {
            'status': 'failure',
          },
        ),
      );
      store.dispatch(SetError(flag: true));
      log.error('ERROR - startTokenPaymentToRestaurant $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - startTokenPaymentToRestaurant $e',
      );
    }
  };
}

ThunkAction<AppState> startPaymentConfirmationCheck() {
  return (Store<AppState> store) async {
    int counter = 0;
    Timer.periodic(
      const Duration(seconds: 4),
      (timer) async {
        try {
          final Future<Map<dynamic, dynamic>> checkOrderResponse =
              peeplEatsService.checkOrderStatus(store.state.cartState.orderID);

          await checkOrderResponse.then(
            (completedValue) {
              counter++;
              log.info(
                'PaymentStatus: ${completedValue["paymentStatus"]}, '
                'counter: $counter',
              );
              if (completedValue['paymentStatus'] == 'paid') {
                store
                  ..dispatch(SetTransferringPayment(flag: false))
                  ..dispatch(SetConfirmed(flag: true));
                timer.cancel();
                unawaited(
                  Analytics.track(
                    eventName: AnalyticsEvents.payment,
                    properties: {
                      'status': 'success',
                    },
                  ),
                );
              }
            },
          );

          if (counter > 15) {
            timer.cancel();
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.payment,
                properties: {
                  'status': 'failure',
                },
              ),
            );
            throw Exception('Payment checks exceeded time limit: '
                'orderID: ${store.state.cartState.orderID}');
          }
        } catch (e, s) {
          timer.cancel();
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.payment,
              properties: {
                'status': 'failure',
              },
            ),
          );
          store.dispatch(SetError(flag: true));
          log.error('ERROR - startPaymentConfirmationCheck $e');
          await Sentry.captureException(
            e,
            stackTrace: s,
            hint: 'ERROR - startPaymentConfirmationCheck $e',
          );
        }
      },
    );
  };
}

ThunkAction<AppState> setRestaurantDetails({
  required RestaurantItem restaurantItem,
  required bool clearCart,
}) {
  return (Store<AppState> store) async {
    try {
      if (clearCart) {
        store.dispatch(ClearCart());
      }
      store.dispatch(
        setMenuSearchQuery(searchQuery: ''),
      );
      store.dispatch(
        SetRestaurantDetails(
          restaurantItem.restaurantID,
          restaurantItem.name,
          restaurantItem.address,
          restaurantItem.walletAddress,
          restaurantItem.minimumOrderAmount,
          restaurantItem.platformFee,
          restaurantItem.deliveryRestrictionDetails,
        ),
      );
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

ThunkAction<AppState> updateInstructions({
  required String instructions,
  required void Function() successCallback,
  required void Function() errorCallback,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetDeliveryInstructions(instructions));
      successCallback();
    } catch (e, s) {
      log.error('ERROR - updateInstructions $e');
      errorCallback();
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - updateInstructions $e',
      );
    }
  };
}

ThunkAction<AppState> removeInstructions() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetDeliveryInstructions(''));
    } catch (e, s) {
      log.error('ERROR - removeInstructions $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - removeInstructions $e',
      );
    }
  };
}

ThunkAction<AppState> setDeliveryAddress({
  required int id,
}) {
  return (Store<AppState> store) async {
    try {
      final address = store.state.userState.listOfDeliveryAddresses
          .where((element) => element.internalID == id)
          .first;
      store.dispatch(UpdateSelectedDeliveryAddress(address));
    } catch (e, s) {
      log.error('ERROR - setDeliveryAddress $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - setDeliveryAddress $e',
      );
    }
  };
}
