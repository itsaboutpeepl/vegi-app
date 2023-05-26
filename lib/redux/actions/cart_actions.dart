import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';

import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/paymentSheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/qRFromCartSheet.dart';
import 'package:vegan_liverpool/models/admin/uploadProductSuggestionImageResponse.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForCollection.dart';
import 'package:vegan_liverpool/models/cart/createOrderForDelivery.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/cart/discount.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/cart/productSuggestion.dart';
import 'package:vegan_liverpool/models/payments/live_payment.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/payment_methods.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionValue.dart';
import 'package:vegan_liverpool/models/restaurant/productOptionsCategory.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/models/restaurant/time_slot.dart';
import 'package:vegan_liverpool/models/waitingListFunnel/waitingListEntry.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';
import 'package:vegan_liverpool/redux/viewsmodels/signUpErrorDetails.dart';
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

class UpdateCartItem {
  UpdateCartItem({required this.cartItem});
  final CartItem cartItem;

  @override
  String toString() {
    return 'UpdateCartItem : $cartItem';
  }
}

class OrderCreationProcessStatusUpdate {
  OrderCreationProcessStatusUpdate({
    required this.status,
  });

  final OrderCreationProcessStatus status;

  @override
  String toString() {
    return 'OrderCreationProcessStatusUpdate : status:"${status.name}"';
  }
}

class StripePaymentStatusUpdate {
  StripePaymentStatusUpdate({
    required this.status,
  });

  final StripePaymentStatus status;

  @override
  String toString() {
    return 'StripePaymentStatusUpdate : status:"${status.name}"';
  }
}

class SetCartError {
  SetCartError({
    required this.error,
  });

  final ErrorDetails<CartErrCode> error;

  @override
  String toString() {
    return 'SetCartError : error:"$error"';
  }
}

class SetCartErrorResolved {
  SetCartErrorResolved();

  @override
  String toString() {
    return 'SetCartErrorResolved';
  }
}

class SetCartIsLoading {
  SetCartIsLoading({
    required this.isLoading,
  });

  final bool isLoading;

  @override
  String toString() {
    return 'SetCartIsLoading : isLoading:"$isLoading"';
  }
}

class SetProcessingPayment {
  SetProcessingPayment({
    required this.payment,
  });

  final LivePayment payment;

  @override
  String toString() {
    return 'SetProcessingPayment : payment:"$payment"';
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

class ReplaceCart {
  ReplaceCart({
    required this.newCart,
  });

  final CreateOrderForFulfilment newCart;

  @override
  String toString() {
    return 'ReplaceCart : ${newCart}';
  }
}

class UpdateComputedCartValues {
  UpdateComputedCartValues(
    this.cartSubTotal,
    this.cartTax,
    this.cartTotal,
    this.cartDiscountComputed,
  );
  final Money cartSubTotal;
  final Money cartTax;
  final Money cartTotal;
  final Money cartDiscountComputed;

  @override
  String toString() {
    return 'UpdateComputedCartValues : CartSubTotal: $cartSubTotal, '
        'cartTax: $cartTax, cartTotal: $cartTotal, '
        'cartDiscountComputed: $cartDiscountComputed';
  }
}

class AddValidVoucherCodeToCart {
  AddValidVoucherCodeToCart({
    // required this.vendorId,
    // required this.value,
    // required this.code,
    // required this.expiryDate,
    required this.voucher,
  });
  // final int vendorId;
  // final num value;
  // final String code;
  // final DateTime expiryDate;
  final Discount voucher;

  @override
  String toString() {
    return 'AddValidVoucherCodeToCart : value: ${voucher.value}, '
        'discountCode: ${voucher.code}, vendorId: ${voucher.vendor}';
  }
}

class RemoveVoucherCodeFromCart {
  RemoveVoucherCodeFromCart({
    required this.voucher,
  });

  final Discount voucher;

  @override
  String toString() {
    return 'RemoveVoucherCodeFromCart : value: ${voucher.value}, '
        'discountCode: ${voucher.code}, vendorId: ${voucher.vendor}';
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

class SetSubscribedToWaitingListUpdates {
  SetSubscribedToWaitingListUpdates({
    required this.updatedEntry,
  });

  final WaitingListEntry updatedEntry;

  @override
  String toString() {
    return 'SetSubscribedToWaitingListUpdates : updatedEntry:"${updatedEntry.email}, emailUpdates: ${updatedEntry.emailUpdates}"';
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
  final Money tipAmount;

  @override
  String toString() {
    return 'UpdateTipAmount : tipAmount: $tipAmount';
  }
}

class CreateOrder {
  CreateOrder({
    required this.order,
    required this.paymentIntentId,
  });
  final Order order;
  final String paymentIntentId;

  @override
  String toString() {
    return 'CreateOrder : orderID: ${order.id}, paymentIntentID: $paymentIntentId';
  }
}

class CancelOrder {
  CancelOrder({
    required this.orderId,
  });
  final int orderId;

  @override
  String toString() {
    return 'CancelOrder : orderID: ${orderId}';
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
  SetConfirmed({required this.flag, required this.orderId});
  bool flag;
  int orderId;
  @override
  String toString() {
    return 'SetConfirmed : flag: $flag, orderId: $orderId';
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
  final Money platformFee;
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

class SetFulfilmentMethod {
  SetFulfilmentMethod({required this.fulfilmentMethodType});
  final FulfilmentMethodType fulfilmentMethodType;

  @override
  String toString() {
    return 'SetFulfilmentMethod : ${fulfilmentMethodType.name}';
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

ThunkAction<AppState> updateCartTip(Money newTip) {
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

ThunkAction<AppState> registerEmailWaitingListHandler({
  required String email,
}) {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(
          SetIsLoadingHttpRequest(
            isLoading: true,
          ),
        )
        ..dispatch(
          SetCartIsLoading(
            isLoading: true,
          ),
        );

      final newEntry = await peeplEatsService.registerEmailToWaitingList(
        email,
        store,
      );
      unawaited(
        Analytics.track(
          eventName: AnalyticsEvents.emailWLRegistration,
          properties: {
            AnalyticsProps.status: AnalyticsProps.success,
          },
        ),
      );
      if (newEntry != null) {
        store
          ..dispatch(
            EmailWLRegistrationSuccess(
              entry: newEntry,
            ),
          )
          ..dispatch(
            SetSubscribedToWaitingListUpdates(
              updatedEntry: newEntry,
            ),
          )
          ..dispatch(SetIsLoadingHttpRequest(isLoading: false))
          ..dispatch(SetCartIsLoading(isLoading: false));
      } else {
        store
          ..dispatch(
            SetCartError(
              error: ErrorDetails<CartErrCode>(
                title: Messages.failedToRegisterEmailToWaitingList,
                message: '',
                code: CartErrCode.failedToRegisterEmailToWaitingList,
              ),
            ),
          )
          ..dispatch(SetIsLoadingHttpRequest(isLoading: false))
          ..dispatch(SetCartIsLoading(isLoading: false));
      }
    } catch (e, s) {
      log.error(
        'ERROR - Email WaitingList Registration Request',
        error: e,
        stackTrace: s,
      );
      await Analytics.track(
        eventName: AnalyticsEvents.emailWLRegistration,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in Email Registration: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in Email Registration',
      );
    }
    store.dispatch(
      fetchPositionInWaitingListQueue(errorHandler: (err) {
        store.dispatch(
          SetCartError(
            error: ErrorDetails<CartErrCode>(
              title: Messages.connectionError,
              message: Messages.failedToCheckPositionInWaitingList,
              code: CartErrCode.failedToCheckPositionInWaitingList,
            ),
          ),
        );
      }),
    );
  };
}

ThunkAction<AppState> subscribeToWaitingListEmails({
  required String email,
  required bool receiveUpdates,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetCartIsLoading(isLoading: true));
      final entry = await peeplEatsService.subscribeToWaitingListEmails(
        email: email,
        receiveUpdates: receiveUpdates,
      );
      if (entry == null) {
        store
          ..dispatch(
            SetCartError(
              error: ErrorDetails<CartErrCode>(
                title: Messages.failedToRegisterEmailToWaitingList,
                message: '',
                code: CartErrCode.failedToRegisterEmailForNotifications,
              ),
            ),
          )
          ..dispatch(SetCartIsLoading(isLoading: false));
      }
      store.dispatch(
        SetSubscribedToWaitingListUpdates(
          updatedEntry: entry!,
        ),
      );
    } catch (e, s) {
      store
        ..dispatch(
          SetCartError(
            error: ErrorDetails<CartErrCode>(
              title: Messages.failedToRegisterEmailToWaitingList,
              message: '',
              code: CartErrCode.failedToRegisterEmailForNotifications,
            ),
          ),
        )
        ..dispatch(SetCartIsLoading(isLoading: false));
      log.error('ERROR - subsribeToWaitingListEmails $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - subsribeToWaitingListEmails $e',
      );
    }
  };
}

ThunkAction<AppState> validateFixedVoucherCode({
  required String code,
  required int vendor,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetCartIsLoading(isLoading: true));
      final discount = await peeplEatsService.validateFixedDiscountCode(
        code: code,
        walletAddress: store.state.userState.walletAddress,
        vendor: vendor,
      );
      if (discount == null) {
        store
          ..dispatch(
            SetCartError(
              error: ErrorDetails<CartErrCode>(
                title: Messages.addVoucherCodeInvalidCode,
                message: '',
                code: CartErrCode.invalidDiscountCode,
              ),
            ),
          )
          ..dispatch(SetCartIsLoading(isLoading: false));
        return;
      }
      store
        ..dispatch(
          AddValidVoucherCodeToCart(
            // code: code,
            // vendorId: vendor,
            // value: discount.value,
            // expiryDate: discount.expiryDateTime,
            voucher: discount,
          ),
        )
        ..dispatch(SetCartIsLoading(isLoading: false));
    } catch (e, s) {
      store
        ..dispatch(
          SetCartError(
            error: ErrorDetails<CartErrCode>(
              title: Messages.addVoucherCodeInvalidCode,
              message: '',
              code: CartErrCode.failedToRegisterDiscountCode,
            ),
          ),
        )
        ..dispatch(SetCartIsLoading(isLoading: false));
      log.error(
        'ERROR - validateFixedVoucherCode $e',
        stackTrace: s,
      );
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - validateFixedVoucherCode $e',
      );
    }
  };
}

ThunkAction<AppState> spendVoucherPot({
  required Money amount,
}) {
  return (Store<AppState> store) async {
    throw Exception('spendVoucherPot not implemented');
    try {
      //todo: add this to the pay thunk_action instead with all vouchers automatically applied
      //todo: Check value of voucher pot,
      //todo: call peeplEats redeem voucher (enforce use it all by using a voucher?)
      //todo: if succeeds, remove the voucher from the voucherPot -> AddValidVoucherCodeToCart()
      //todo: remove total voucher value on checkout screen so visible to user and charge the user remaining amount
      //todo:
    } catch (e, s) {
      log.error('ERROR - spendVoucherPot $e', stackTrace: s);
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - spendVoucherPot $e',
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

ThunkAction<AppState> removeCartAppliedVoucher({
  required Discount voucher,
}) {
  return (Store<AppState> store) async {
    try {
      store
        ..dispatch(
          RemoveVoucherCodeFromCart(
            voucher: voucher,
          ),
        )
        ..dispatch(computeCartTotals());
    } catch (e, s) {
      log.error(
        'ERROR - removeCartDiscount $e',
        stackTrace: s,
      );
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

ThunkAction<AppState> selectProductOptionForCartItem({
  required CartItem item,
  required ProductOptionsCategory productOptionCategory,
  required ProductOptionValue selectedProductOption,
}) {
  return (Store<AppState> store) async {
    try {
      item.selectedProductOptions
          .addAll({productOptionCategory.categoryID: selectedProductOption});

      store.dispatch(UpdateCartItem(cartItem: item));
    } catch (e, s) {
      log.error('ERROR - selectProductOptionForCartItem $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - selectProductOptionForCartItem $e',
      );
    }
  };
}

ThunkAction<AppState> loadBasketToCart(
  CreateOrderForFulfilment basket,
  void Function() successHandler,
  void Function(String) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(ReplaceCart(newCart: basket));
      successHandler();
    } catch (e, s) {
      log.error('ERROR - loadBasketToCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - loadBasketToCart $e',
      );
      errorHandler(
        'ERROR - loadBasketToCart $e',
      );
    }
  };
}

ThunkAction<AppState> loadBasketUriToCart(
  String basketUri,
  void Function() successHandler,
  void Function(String) errorHandler,
) {
  return (Store<AppState> store) async {
    try {
      final basket = await peeplEatsService.getOrderFromUri(
        vegiRelUri: basketUri,
      );
      if (basket == null) {
        return errorHandler(
            'Unable to fetch order for relative uri: $basketUri');
      }
      store.dispatch(
        ReplaceCart(
          newCart: basket,
        ),
      );

      successHandler();
    } catch (e, s) {
      log.error('ERROR - loadBasketUriToCart $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - loadBasketUriToCart $e',
      );
      errorHandler(
        'ERROR - loadBasketUriToCart $e',
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

      final menuItem = store.state.homePageState.featuredRestaurants
          .firstWhere((v) => v.restaurantID == selectedRestaurantId)
          .listOfMenuItems
          .firstWhere((item) => item.productBarCode == itemQRCode);

      // final menuItem = await peeplEatsService.getRestaurantMenuItemByQrCode(
      //   barCode: itemQRCode,
      //   restaurantID: selectedRestaurantId,
      // );

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

      // Map<int, ProductOptions> selectProductOptionsCategories = {};
      // final pocs = menuItem.listOfProductOptionCategories;
      // for (final prodOptCat in pocs) {
      //   for (final pov in prodOptCat.listOfOptions) {
      //     if (pov.productBarcode == itemQRCode) {
      //       //! This is a hack to set the remaining product options to default
      //       //! first product option value when barcode maps to one
      //       //! selected product option value...
      //       selectProductOptionsCategories =
      //           Map<int, ProductOptions>.fromEntries(
      //         pocs
      //             .where(
      //               (element) => element.name != prodOptCat.name,
      //             )
      //             .map(
      //               (element) => MapEntry(
      //                 element.categoryID,
      //                 // element.copyWith(
      //                 //   listOfOptions: [element.listOfOptions[0]],
      //                 // ),
      //                 element.listOfOptions[0],
      //               ),
      //             )
      //             .toList()
      //           ..add(
      //             MapEntry(
      //               prodOptCat.categoryID,
      //               // prodOptCat.copyWith(listOfOptions: [pov]),
      //               pov,
      //             ),
      //           ),
      //       );
      //     }
      //   }
      // }

      final cartItem = CartItem(
        internalID: Random(
          DateTime.now().millisecondsSinceEpoch,
        ).nextInt(100000),
        menuItem: menuItem,
        totalItemPrice: (await calculateMenuItemPrice(
          menuItem: menuItem,
          quantity: 1,
          productOptions:
              menuItem.listOfProductOptionCategories[0].listOfOptions,
        ))
            .totalPrice,
        // lib/redux/actions/menu_item_actions.dart:119
        //
        itemQuantity: 1,
        //this quantity always needs to be 1 to work
        //with the api. the actual quantity of the
        //object is calculated using the viewmodel
        //quantity field. Then the object is just
        //duplicated and added to the cart items.
        selectedProductOptions: {},
      );

      // final restaurant =
      //     store.state.homePageState.featuredRestaurants.firstWhere(
      //   (element) => element.restaurantID == selectedRestaurantId,
      // );

      // final items = <CartItem>[];
      // for (final menuItem in restaurant.listOfMenuItems) {
      //   for (final productOptionCategory in menuItem.listOfProductOptionCategories) {
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
    final updateCartItems = await computeTotalsFromCart(
      cartItems: store.state.cartState.cartItems,
      fulfilmentCharge: await store.state.cartState.fulfilmentChargeGBP,
      platformFee: await store.state.cartState.platformFeeGBP,
      cartTip: await store.state.cartState.cartTipGBP,
      cartCurrency: store.state.cartState.cartCurrency,
      cartDiscountPercent: store.state.cartState.cartDiscountPercent,
      vendorId: int.parse(store.state.cartState.restaurantID),
    );
    if (updateCartItems != null) {
      store.dispatch(
        updateCartItems,
      );
    }
  };
}

ThunkAction<AppState> startOrderCreationProcess({
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      final cartState = store.state.cartState;
      OrderCreationProcessStatus _sentryUpdatePipe(
        OrderCreationProcessStatus status,
      ) {
        final message =
            'OrderCreationProcessStatus changed to "${status.name}"';
        Sentry.captureMessage(
          message,
        );
        return status;
      }

      if (cartState.selectedTimeSlot == null) {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: _sentryUpdatePipe(
              OrderCreationProcessStatus.needToSelectATimeSlot,
            ),
          ),
        );
        return;
      }
      if (cartState.selectedDeliveryAddress == null && cartState.isDelivery) {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: _sentryUpdatePipe(
              OrderCreationProcessStatus.needToSelectADeliveryAddress,
            ),
          ),
        );
        return;
      }
      if (cartState.restaurantMinimumOrder >
          cartState.cartSubTotal.inGBPxValue) {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: _sentryUpdatePipe(
              OrderCreationProcessStatus.orderIsBelowVendorMinimumOrder,
            ),
          ),
        );
      } else {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: OrderCreationProcessStatus.none,
          ),
        );
        if (cartState.isDelivery) {
          store.dispatch(
            prepareOrderObjectForDelivery(
              showBottomPaymentSheet: showBottomPaymentSheet,
            ),
          );
        } else if (cartState.isCollection) {
          store.dispatch(
            prepareOrderObjectForCollection(
              showBottomPaymentSheet: showBottomPaymentSheet,
            ),
          );
        } else if (cartState.isInStore) {
          store.dispatch(
            prepareOrderObjectForInStorePayment(
              showBottomPaymentSheet: showBottomPaymentSheet,
            ),
          );
        } else {
          throw Exception(
            'Unknown fulfilment method type passed to startOrderCreationProcess',
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
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      final orderObject = CreateOrderForDelivery.fromStore(store);

      store.dispatch(
        sendOrderObject(
          orderObject: orderObject,
          showBottomPaymentSheet: showBottomPaymentSheet,
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
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      final orderObject = CreateOrderForCollection.fromStore(store);

      store.dispatch(
        sendOrderObject(
          orderObject: orderObject,
          showBottomPaymentSheet: showBottomPaymentSheet,
        ),
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

ThunkAction<AppState> prepareOrderObjectForInStorePayment({
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      final orderObject = CreateOrderForCollection.fromStore(store);

      store.dispatch(
        sendOrderObject(
          orderObject: orderObject,
          showBottomPaymentSheet: showBottomPaymentSheet,
        ),
      );
    } catch (e, s) {
      log.error('ERROR - prepareOrderObjectForInStorePayment $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - prepareOrderObjectForInStorePayment $e',
      );
    }
  };
}

ThunkAction<AppState> sendOrderObject<T extends CreateOrderForFulfilment>({
  required T orderObject,
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(SetPaymentButtonFlag(true));
      //TODO: apply appliedVouchers to order, might need to be done in prepareOrderForXXX step...
      final result = await peeplEatsService.createOrder(orderObject);
      OrderCreationProcessStatus _sentryUpdatePipe(
        OrderCreationProcessStatus status,
      ) {
        final message =
            'OrderCreationProcessStatus changed to "${status.name}"';
        Sentry.captureMessage(
          message,
        );
        return status;
      }

      if (result == null) {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: _sentryUpdatePipe(
              OrderCreationProcessStatus.sendOrderCallTimedOut,
            ),
          ),
        );
      } else if (result.orderCreationStatus == OrderCreationStatus.failed) {
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: _sentryUpdatePipe(
              OrderCreationProcessStatus.sendOrderCallServerError,
            ),
          ),
        );
      } else {
        log.verbose('Order Result $result');
        final Map<String, dynamic> checkResult =
            await peeplPayService.checkOrderValidity(result.paymentIntentID);

        final Map<String, dynamic> paymentIntent =
            checkResult['paymentIntent'] as Map<String, dynamic>;

        if (paymentIntent['amount'] != store.state.cartState.cartTotal) {
          store.dispatch(
            OrderCreationProcessStatusUpdate(
              status: _sentryUpdatePipe(
                OrderCreationProcessStatus
                    .paymentIntentAmountDoesntMatchCartTotal,
              ),
            ),
          );
        } else {
          store
            ..dispatch(
              CreateOrder(
                paymentIntentId: result.paymentIntentID,
                order: result.order,
              ),
            )
            ..dispatch(
              startPaymentProcess(
                showBottomPaymentSheet: showBottomPaymentSheet,
              ),
            );
          // todo: this needs to be replaced with the result.order.firebaseRegistrationToken subscription
          // do a cmd f12 of all locations where the below subscribeToTopic function is called from
          unawaited(
            firebaseMessaging.subscribeToTopic('order-${result.orderId}'),
          );
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.orderGen,
              properties: {
                'status': 'success',
                'orderId': result.orderId.toString(),
                'orderTotal': store.state.cartState.cartTotal,
                'paymentIntentID': result.paymentIntentID,
                'orderCreationStatus': result.orderCreationStatus.name,
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
      log.error(e);
      if (e.response != null) {
        await Sentry.captureException(
          e,
          hint: 'DioError - sendOrderObject - '
              'Internal Server Error',
        );
        store.dispatch(
          OrderCreationProcessStatusUpdate(
            status: OrderCreationProcessStatus.sendOrderCallServerError,
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
      store
        ..dispatch(SetPaymentButtonFlag(false))
        ..dispatch(
          OrderCreationProcessStatusUpdate(
            status: OrderCreationProcessStatus.sendOrderCallClientError,
          ),
        );
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

ThunkAction<AppState> cancelOrder({
  required int orderId,
  required int accountId,
  required String senderWalletAddress,
}) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(CancelOrder(orderId: orderId));
      final cancelledOrderSuccess = await peeplEatsService.cancelOrder(
        orderId: orderId,
        accountId: accountId,
        senderWalletAddress: senderWalletAddress,
      );
    } catch (e, s) {
      log.error(
        'ERROR - cancelOrder $e',
        stackTrace: s,
      );
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - cancelOrder $e',
      );
    }
  };
}

ThunkAction<AppState> startPaymentProcess({
  required Future<void> Function(PaymentMethod?) showBottomPaymentSheet,
}) {
  return (Store<AppState> store) async {
    try {
      if (store.state.cartState.selectedPaymentMethod == PaymentMethod.stripe) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payStripe,
          ),
        );
        final paymentIntentID = store.state.cartState.paymentIntentID;
        if (store.state.userState.vegiAccountId == null) {
          final e = 'vegi AccountId not set on state... Cannot start payment';
          log.error(e, stackTrace: StackTrace.current);
          await Sentry.captureException(
            Exception(e),
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - startPeeplPayProcess $e',
          );
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
          return;
        } else if (store.state.cartState.orderCreationProcessStatus !=
            OrderCreationProcessStatus.none) {
          final e =
              'orderCreationProcess in state: ${store.state.cartState.orderCreationProcessStatus.name}... Cannot start payment';
          log.error(e, stackTrace: StackTrace.current);
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
          return;
        }
        final orderId = int.parse(store.state.cartState.orderID);
        await stripeService
            .handleStripe(
          recipientWalletAddress: store.state.cartState.restaurantWalletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: orderId,
          accountId: store.state.userState.vegiAccountId!,
          store: store,
          amount: store.state.cartState.cartTotal,
          shouldPushToHome: true,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(
                SetConfirmed(
                  flag: value,
                  orderId: orderId,
                ),
              );
              return;
            }
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.payStripe,
                properties: {
                  'status': 'success',
                },
              ),
            );
            store.dispatch(subscribeToOrderUpdates());
          },
        );
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.stripeToFuse) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payStripe,
          ),
        );
        if (store.state.userState.vegiAccountId == null) {
          const e = 'Vegi AccountId not set on state... Cannot start payment';
          log.error(e);
          await Sentry.captureException(
            Exception(e),
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - startPeeplPayProcess $e',
          );
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
          return;
        }
        await stripeService
            .handleStripe(
          recipientWalletAddress: store.state.cartState.restaurantWalletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: int.parse(store.state.cartState.orderID),
          accountId: store.state.userState.vegiAccountId!,
          amount: store.state.cartState.cartTotal,
          store: store,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store
                ..dispatch(SetPaymentButtonFlag(false))
                ..dispatch(
                  cancelOrder(
                    orderId: int.parse(store.state.cartState.orderID),
                    accountId: store.state.userState.vegiAccountId!,
                    senderWalletAddress: store.state.userState.walletAddress,
                  ),
                )
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
                  gbpxAmount:
                      store.state.cartState.cartTotal.inGBPxValue.toDouble(),
                  pplAmount: 0,
                ),
              )
              ..dispatch(
                startTokenPaymentToRestaurant(),
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
        await showBottomPaymentSheet(
          store.state.cartState.selectedPaymentMethod,
        );
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.applePay) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payStripe,
          ),
        );
        if (store.state.userState.vegiAccountId == null) {
          final e = 'Vegi AccountId not set on state... Cannot start payment';
          log.error(e);
          await Sentry.captureException(
            Exception(e),
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - startPeeplPayProcess $e',
          );
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
        } else if (store.state.cartState.orderCreationProcessStatus !=
            OrderCreationProcessStatus.none) {
          final e =
              'orderCreationProcess in state: ${store.state.cartState.orderCreationProcessStatus.name}... Cannot start payment';
          log.error(e, stackTrace: StackTrace.current);
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
          return;
        }
        await stripeService
            .handleApplePay(
          recipientWalletAddress: store.state.cartState.restaurantWalletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: num.parse(store.state.cartState.orderID),
          accountId: store.state.userState.vegiAccountId!,
          store: store,
          amount: store.state.cartState.cartTotal,
          shouldPushToHome: false,
          productName: 'Vegi',
        )
            .then(
          (value) {
            if (!value) {
              store
                ..dispatch(SetPaymentButtonFlag(false))
                ..dispatch(
                  cancelOrder(
                    orderId: int.parse(store.state.cartState.orderID),
                    accountId: store.state.userState.vegiAccountId!,
                    senderWalletAddress: store.state.userState.walletAddress,
                  ),
                )
                ..dispatch(SetTransferringPayment(flag: value))
                ..dispatch(
                  OrderCreationProcessStatusUpdate(
                    status: value
                        ? OrderCreationProcessStatus.success
                        : OrderCreationProcessStatus.orderCancelled,
                  ),
                )
                ..dispatch(
                  SetConfirmed(
                    flag: value,
                    orderId: int.parse(store.state.cartState.orderID),
                  ),
                );
              return;
            }
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.payStripe,
                properties: {
                  'status': 'success',
                },
              ),
            );
            store.dispatch(subscribeToOrderUpdates());
          },
        ).catchError((dynamic error) {
          throw Exception('Apple Pay Failed - $error');
        });
      } else if (store.state.cartState.selectedPaymentMethod ==
          PaymentMethod.applePayToFuse) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.mint,
          ),
        );
        if (store.state.userState.vegiAccountId == null) {
          final e = 'Vegi AccountId not set on state... Cannot start payment';
          log.error(e);
          await Sentry.captureException(
            Exception(e),
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - startPeeplPayProcess $e',
          );
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
        } else if (store.state.cartState.orderCreationProcessStatus !=
            OrderCreationProcessStatus.none) {
          final e =
              'orderCreationProcess in state: ${store.state.cartState.orderCreationProcessStatus.name}... Cannot start payment';
          log.error(e, stackTrace: StackTrace.current);
          store
            ..dispatch(SetPaymentButtonFlag(false))
            ..dispatch(
              cancelOrder(
                orderId: int.parse(store.state.cartState.orderID),
                accountId: store.state.userState.vegiAccountId!,
                senderWalletAddress: store.state.userState.walletAddress,
              ),
            );
          return;
        }
        await stripeService
            .handleApplePay(
          recipientWalletAddress: store.state.cartState.restaurantWalletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: num.parse(store.state.cartState.orderID),
          accountId: store.state.userState.vegiAccountId!,
          amount: store.state.cartState.cartTotal,
          store: store,
          shouldPushToHome: false,
          productName: 'Vegi',
        )
            .then(
          (value) {
            if (!value) {
              store
                ..dispatch(SetTransferringPayment(flag: value))
                ..dispatch(
                  cancelOrder(
                    orderId: int.parse(store.state.cartState.orderID),
                    accountId: store.state.userState.vegiAccountId!,
                    senderWalletAddress: store.state.userState.walletAddress,
                  ),
                );
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
                  gbpxAmount:
                      store.state.cartState.cartTotal.inGBPxValue.toDouble(),
                  pplAmount: 0,
                ),
              )
              ..dispatch(
                startTokenPaymentToRestaurant(),
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
        await showBottomPaymentSheet(
          store.state.cartState.selectedPaymentMethod,
        );
      }
    } catch (e, s) {
      store
        ..dispatch(SetPaymentButtonFlag(false))
        ..dispatch(
          cancelOrder(
            orderId: int.parse(store.state.cartState.orderID),
            accountId: store.state.userState.vegiAccountId!,
            senderWalletAddress: store.state.userState.walletAddress,
          ),
        );
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

ThunkAction<AppState> startPeeplPayProcess() {
  return (Store<AppState> store) async {
    try {
      if (store.state.userState.vegiAccountId == null) {
        final e = 'vegi AccountId not set on state... Cannot start payment';
        log.error(e);
        await Sentry.captureException(
          Exception(e),
          stackTrace: StackTrace.current, // from catch (e, s)
          hint: 'ERROR - startPeeplPayProcess $e',
        );
      }

      final double currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.getAmount();

      final double selectedGBPXAmount =
          store.state.cartState.selectedGBPxAmount;

      final hasSufficientGbpxBalance =
          selectedGBPXAmount.compareTo(currentGBPXAmount) < 0;

      if (hasSufficientGbpxBalance) {
        store.dispatch(startTokenPaymentToRestaurant());
      } else {
        // ! This is a topup call
        await stripeService
            .handleStripe(
          recipientWalletAddress: store.state.userState.walletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: int.parse(store.state.cartState.orderID),
          accountId: store.state.userState.vegiAccountId!,
          amount: Money(
            currency: Currency.GBP,
            value: selectedGBPXAmount, // this is actually a GBP value.
          ),
          store: store,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(SetTransferringPayment(flag: value));
              return;
            }
            store.dispatch(
              startTokenPaymentToRestaurant(),
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

ThunkAction<AppState> startTokenPaymentToRestaurant() {
  return (Store<AppState> store) async {
    try {
      //Set loading to true
      store
        ..dispatch(SetTransferringPayment(flag: true))
        ..dispatch(SetPaymentButtonFlag(false));

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
          // Sending a gasless transaction
          final exceptionOrSmartWalletEventStream =
              await fuseWalletSDK.transferToken(
            store.state.userState.fuseWalletCredentialsNotNull,
            gbpxToken.address,
            store.state.cartState.restaurantWalletAddress,
            store.state.cartState.selectedGBPxAmount.toString(),
          );

          // gbpxResponse = await chargeApi.tokenTransfer(
          //   getIt<Web3>(),
          //   store.state.userState.walletAddress,
          //   gbpxToken.address,
          //   store.state.cartState.restaurantWalletAddress,
          //   tokensAmount: store.state.cartState.selectedGBPxAmount.toString(),
          //   externalId: store.state.cartState.paymentIntentID,
          // ) as Map<String, dynamic>;
          if (exceptionOrSmartWalletEventStream.hasError) {
            print(exceptionOrSmartWalletEventStream.error.toString());
          } else {
            gbpxResponse = {};
            //todo: refactor this part to include success, failure and error handlers visible from the build context called from
            exceptionOrSmartWalletEventStream.data!.listen(
              (SmartWalletEvent event) {
                switch (event.name) {
                  case 'transactionStarted':
                    log.info('transactionStarted ${event.data.toString()}');
                    break;
                  case 'transactionHash':
                    log.info('transactionHash ${event.data.toString()}');
                    break;
                  case 'transactionSucceeded':
                    log.info('transactionSucceeded ${event.data.toString()}');
                    gbpxResponse = event.data;
                    break;
                  case 'transactionFailed':
                    log.warn('transactionFailed ${event.data.toString()}');
                    break;
                }
              },
              onError: (error) {
                log.error('Error occurred: ${error.toString()}');
              },
            );
          }
        }
      }

      if (isPPLSelected) {
        if (currentPPLAmount.compareTo(selectedPPLAmount) > 0) {
          // Sending a gasless transaction
          final exceptionOrSmartWalletEventStream =
              await fuseWalletSDK.transferToken(
            store.state.userState.fuseWalletCredentialsNotNull,
            pplToken.address,
            store.state.cartState.restaurantWalletAddress,
            store.state.cartState.selectedPPLAmount.toString(),
          );

          // pplResponse = await chargeApi.tokenTransfer(
          //   getIt<Web3>(),
          //   store.state.userState.walletAddress,
          //   pplToken.address,
          //   store.state.cartState.restaurantWalletAddress,
          //   tokensAmount: store.state.cartState.selectedPPLAmount.toString(),
          //   externalId: store.state.cartState.paymentIntentID,
          // ) as Map<String, dynamic>;
          if (exceptionOrSmartWalletEventStream.hasError) {
            print(exceptionOrSmartWalletEventStream.error.toString());
          } else {
            gbpxResponse = {};
            //todo: refactor this part to include success, failure and error handlers visible from the build context called from
            exceptionOrSmartWalletEventStream.data!.listen(
              (SmartWalletEvent event) {
                switch (event.name) {
                  case 'transactionStarted':
                    log.info('transactionStarted ${event.data.toString()}');
                    break;
                  case 'transactionHash':
                    log.info('transactionHash ${event.data.toString()}');
                    break;
                  case 'transactionSucceeded':
                    log.info('transactionSucceeded ${event.data.toString()}');
                    gbpxResponse = event.data;
                    break;
                  case 'transactionFailed':
                    log.warn('transactionFailed ${event.data.toString()}');
                    break;
                }
              },
              onError: (error) {
                log.error('Error occurred: ${error.toString()}');
              },
            );
          }
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
          final checkOrderResponse =
              peeplEatsService.checkOrderStatus(store.state.cartState.orderID);

          await checkOrderResponse.then(
            (completedValue) {
              counter++;
              log.verbose(
                'PaymentStatus: ${completedValue.paymentStatus}, '
                'counter: $counter',
              );
              if (completedValue.paymentStatus == OrderPaidStatus.paid) {
                store
                  ..dispatch(SetTransferringPayment(flag: false))
                  ..dispatch(SetConfirmed(
                    flag: true,
                    orderId: int.parse(store.state.cartState.orderID),
                  ));
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

ThunkAction<AppState> subscribeToOrderUpdates() {
  return (Store<AppState> store) async {
    await firebaseMessaging
        .subscribeToTopic('order-${store.state.cartState.orderID}');
    store
      ..dispatch(SetTransferringPayment(flag: false))
      ..dispatch(SetConfirmed(
        flag: true,
        orderId: int.parse(store.state.cartState.orderID),
      ));

    // Below to notify the user with a message once the payment is confirmed using firebasemessaging.
    // int counter = 0;
    // Timer.periodic(
    //   const Duration(seconds: 4),
    //   (timer) async {
    //     try {
    //       final Future<Map<dynamic, dynamic>> checkOrderResponse =
    //           peeplEatsService.checkOrderStatus(store.state.cartState.orderID);

    //       await checkOrderResponse.then(
    //         (completedValue) {
    //           counter++;
    //           log.info(
    //             'PaymentStatus: ${completedValue["paymentStatus"]}, '
    //             'counter: $counter',
    //           );
    //           if (completedValue['paymentStatus'] == 'paid') {
    //             store
    //               ..dispatch(SetTransferringPayment(flag: false))
    //               ..dispatch(SetConfirmed(flag: true));
    //             timer.cancel();
    //             unawaited(
    //               Analytics.track(
    //                 eventName: AnalyticsEvents.payment,
    //                 properties: {
    //                   'status': 'success',
    //                 },
    //               ),
    //             );
    //           }
    //         },
    //       );

    //       if (counter > 1) {
    //         // cancel after 1 attempt
    //         store
    //           ..dispatch(SetTransferringPayment(flag: false))
    //           ..dispatch(SetConfirmed(flag: true));
    //         timer.cancel();
    //         unawaited(
    //           Analytics.track(
    //             eventName: AnalyticsEvents.payment,
    //             properties: {
    //               'status': 'pending',
    //             },
    //           ),
    //         );
    //       }
    //     } catch (e, s) {
    //       timer.cancel();
    //       unawaited(
    //         Analytics.track(
    //           eventName: AnalyticsEvents.payment,
    //           properties: {
    //             'status': 'failure',
    //           },
    //         ),
    //       );
    //       store.dispatch(SetError(flag: true));
    //       log.error('ERROR - startPaymentConfirmationCheck $e');
    //       await Sentry.captureException(
    //         e,
    //         stackTrace: s,
    //         hint: 'ERROR - startPaymentConfirmationCheck $e',
    //       );
    //     }
    //   },
    // );
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
      store
        ..dispatch(
          setMenuSearchQuery(searchQuery: ''),
        )
        ..dispatch(
          SetRestaurantDetails(
            restaurantItem.restaurantID,
            restaurantItem.name,
            restaurantItem.address,
            restaurantItem.walletAddress,
            restaurantItem.minimumOrderAmount,
            Money(
              currency: Currency.GBPx,
              value: restaurantItem.platformFee,
            ),
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
