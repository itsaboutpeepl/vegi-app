import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/di/env.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/pay/dialogs/stripe_payment_confirmed_dialog.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/live_payment.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_internal.dart';

import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class StripeCustomResponse {
  StripeCustomResponse({
    required this.ok,
    this.msg = '',
  });
  final bool ok;
  final String? msg;
}

@lazySingleton
class StripeService {
  final Stripe instance = Stripe.instance;

  void init() {
    Stripe.publishableKey = Env.isDev
        ? dotenv.env['STRIPE_API_KEY_TEST']!
        : dotenv.env['STRIPE_API_KEY_LIVE']!;
    // if (Stripe.publishableKey.contains('live')) {
    //   final e = Exception('Stripe Instance not ready for production usage.');
    //   Sentry.captureException(
    //     e,
    //     stackTrace: StackTrace.current,
    //     hint: 'ERROR - fetchProductOptions $e',
    //   );
    //   throw e;
    // }
    Stripe.merchantIdentifier = 'merchant.com.vegiapp';
  }

  Future<void> _handleStripeCardPaymentFlow({
    required Store<AppState> store,
    required StripePaymentIntentInternal paymentIntentClientSecret,
    required String ephemeralKey,
    required String publishableKey,
    required String? stripeCustomerId,
  }) async {
    // ~ https://docs.page/flutter-stripe/flutter_stripe/sheet#5-test-the-integration
    final dynamicUrl = 'vegi://vegiApp.co.uk${rootRouter.currentUrl}';
    log.info(dynamicUrl);

    // final bankAccountDetails = await instance.collectBankAccount(
    //   isPaymentIntent: true,
    //   clientSecret: paymentIntentClientSecret.paymentIntent.clientSecret,
    //   params: CollectBankAccountParams(
    //     paymentMethodType: PaymentMethodType.Card,
    //     billingDetails: BillingDetails(
    //       email: store.state.cartState.selectedDeliveryAddress?.email ?? store.state.userState.email,
    //       phone: store.state.cartState.selectedDeliveryAddress?.phoneNumber ??
    //           store.state.userState.phoneNumber,
    //       name: store.state.cartState.selectedDeliveryAddress?.name ??
    //           store.state.userState.displayName,
    //     ),
    //   ),
    // );

    final billingDetails = BillingDetails(
      name: store.state.cartState.order?.deliveryName,
      email: store.state.cartState.order?.deliveryEmail,
      phone: store.state.cartState.order?.deliveryPhoneNumber,
      address: Address(
        city: store.state.cartState.order?.deliveryAddressCity,
        country: store.state.cartState.order
            ?.deliveryAddressCountry, // ~ https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
        line1: store.state.cartState.order?.deliveryAddressLineOne,
        line2: store.state.cartState.order?.deliveryAddressLineTwo,
        state: store.state.cartState.order?.deliveryAddressCity,
        postalCode: store.state.cartState.order?.deliveryAddressPostCode,
      ),
    );

    await instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Enable custom flow
        customFlow: true,
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret.clientSecret,
        merchantDisplayName: Labels.stripeVegiProductName,
        // Customer keys
        customerEphemeralKeySecret: ephemeralKey,
        customerId: stripeCustomerId,
        // Extra options
        // primaryButtonLabel: 'Pay now',
        // applePay: PaymentSheetApplePay(
        //   merchantCountryCode: 'DE',
        // ),
        // googlePay: PaymentSheetGooglePay(
        //   merchantCountryCode: 'DE',
        //   testEnv: true,
        // ),
        // billingDetails, delayedPaymentMethods etc...
        returnURL: dynamicUrl,
        // billingDetails: BillingDetails(
        //   email: store.state.cartState.selectedDeliveryAddress?.email ??
        //       store.state.userState.email,
        //   phone: store.state.cartState.selectedDeliveryAddress?.phoneNumber ??
        //       store.state.userState.phoneNumber,
        //   name: store.state.cartState.selectedDeliveryAddress?.name ??
        //       store.state.userState.displayName,
        // ),
        style: ThemeMode.dark,
        allowsDelayedPaymentMethods: true,
        // appearance: PaymentSheetAppearance(
        //   colors: PaymentSheetAppearanceColors(
        //     background: Colors.lightBlue,
        //     primary: Colors.blue,
        //     componentBorder: Colors.red,
        //   ),
        //   shapes: PaymentSheetShape(
        //     borderWidth: 4,
        //     shadow: PaymentSheetShadowParams(color: Colors.red),
        //   ),
        //   primaryButton: PaymentSheetPrimaryButtonAppearance(
        //     shapes: PaymentSheetPrimaryButtonShape(blurRadius: 8),
        //     colors: PaymentSheetPrimaryButtonTheme(
        //       light: PaymentSheetPrimaryButtonThemeColors(
        //         background: Color.fromARGB(255, 231, 235, 30),
        //         text: Color.fromARGB(255, 235, 92, 30),
        //         border: Color.fromARGB(255, 235, 92, 30),
        //       ),
        //     ),
        //   ),
        // ),
        billingDetails: billingDetails,
      ),
    );
    await instance.presentPaymentSheet();

    // 4. Confirm the payment sheet.
    try {
      unawaited(
        instance.confirmPaymentSheetPayment().timeout(
              const Duration(
                seconds: 10,
              ),
            ),
      );
    } on Exception catch (e, s) {
      // TODO
      log.error('WTF: $e', stackTrace: s);
      rethrow;
    }
  }

  Future<bool> handleStripeTopupForMintingCryptoByCard({
    required String recipientWalletAddress,
    required String senderWalletAddress,
    required int orderId,
    required int accountId,
    required String? stripeCustomerId,
    required Money amount,
    required bool shouldPushToHome,
    required Store<AppState> store,
  }) async {
    try {
      final currency = amount.currency;
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        //TODO: if walletAddress, then user stripePayService.createStripePaymentIntentForTopupFromBank or something
        amount: amount.value,
        currency: amount.currency.name.toLowerCase(),
        recipientWalletAddress: recipientWalletAddress,
        senderWalletAddress: senderWalletAddress,
        orderId: orderId,
        accountId: accountId,
        stripeCustomerId: stripeCustomerId,
      );
      if (paymentIntentClientSecret == null) {
        log.error('Unable to create payment intent from ${stripePayService}');
        await Sentry.captureException(
          Exception('Unable to create payment intent from ${stripePayService}'),
          stackTrace: StackTrace.current, // from catch (err, s)
        );
        store.dispatch(
          StripePaymentStatusUpdate(
            status: StripePaymentStatus.paymentFailed,
          ),
        );
        return false;
      } else if (currency != Currency.GBP && currency != Currency.GBPx) {
        log.error('Unable to use stripe for currency: $currency');
        await Sentry.captureException(
          Exception('Unable to use stripe for currency: $currency'),
          stackTrace: StackTrace.current, // from catch (err, s)
        );
        store.dispatch(
          StripePaymentStatusUpdate(
            status: StripePaymentStatus.paymentFailed,
          ),
        );
        return false;
      }
      await _handleStripeCardPaymentFlow(
        store: store,
        paymentIntentClientSecret: paymentIntentClientSecret.paymentIntent,
        ephemeralKey: paymentIntentClientSecret.ephemeralKey,
        publishableKey: paymentIntentClientSecret.publishableKey,
        stripeCustomerId: stripeCustomerId,
      );
      store
        ..dispatch(
          SetProcessingPayment(
            payment: LivePayment(
              amount: amount.value,
              currency: currency,
              status: PaymentProcessingStatus.started,
              technology: PaymentTechnology.stripeOnRamp,
              type: PaymentType.topup,
            ),
          ),
        )
        ..dispatch(
          StripePaymentStatusUpdate(
            status: StripePaymentStatus.mintingStarted,
          ),
        );
      return true;
    } on StripeException catch (e, s) {
      if (e.error.code != FailureCode.Canceled) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.mint,
            properties: {
              'status': 'failure',
            },
          ),
        );
        log.error(
          'Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}] because of stripe error code StripeErrorCode.[${e.error.stripeErrorCode}]: ${e.error.localizedMessage};',
          stackTrace: s,
        );
        await Sentry.captureException(
          'Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}] because of stripe error code StripeErrorCode.[${e.error.stripeErrorCode}]: ${e.error.localizedMessage};',
          stackTrace: s,
          hint:
              'ERROR - Stripe Exception: Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}]: ${e.error.localizedMessage}; with error code StripeErrorCode.[${e.error.stripeErrorCode}]',
        );
        store
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          )
          ..dispatch(
            cancelOrder(
              orderId: orderId,
              accountId: accountId,
              senderWalletAddress: senderWalletAddress,
            ),
          )
          ..dispatch(
            OrderCreationProcessStatusUpdate(
              status: OrderCreationProcessStatus.orderPaymentFailed,
            ),
          );
        return false;
      } else {
        // payment cancelled handle
        store
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus
                  .paymentCancelled, // TODO: Hande this update and refactor apple pay stripe method to use this code too
            ),
          )
          ..dispatch(
            cancelOrder(
              orderId: orderId,
              accountId: accountId,
              senderWalletAddress: senderWalletAddress,
            ),
          )
          ..dispatch(
            OrderCreationProcessStatusUpdate(
              status: OrderCreationProcessStatus.orderCancelled,
            ),
          )
          ..dispatch(SetPaymentButtonFlag(false));
        return false;
      }
    } on Exception catch (e, s) {
      log.error(
        e,
        stackTrace: s,
      );
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - Stripe Exception: $e',
      );
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.paymentFailed,
        ),
      );
      return false;
    }
  }

  Future<bool> handleStripeCardPayment({
    required String recipientWalletAddress,
    required String senderWalletAddress,
    required int orderId,
    required int accountId,
    required String paymentIntentClientSecret,
    required String? stripeCustomerId,
    required Money amount,
    required bool shouldPushToHome,
    required Store<AppState> store,
  }) async {
    try {
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.none,
        ),
      );
      final currency = amount.currency;
      // ! we remove the createStripePaymentIntent here unless we are mintingCrypto which doesnt go via the vegi backend and therefore doesnt create its own paymentIntent and so needs to be created here
      // ~ https://stripe.com/docs/payments/payment-intents#creating-a-paymentintent
      final paymentIntent = await stripePayService.startPaymentIntentCheck(
        paymentIntentID: store.state.cartState.paymentIntentID,
        paymentIntentClientSecret: paymentIntentClientSecret,
      );

      if (paymentIntent == null) {
        log.error(
          'Failed to fetch paymentIntent from vegi server using paymentIntent client scret that was created on the order',
          stackTrace: StackTrace.current,
        );
        await Sentry.captureException(
          'Failed to fetch paymentIntent from vegi server using paymentIntent client scret that was created on the order',
          stackTrace: StackTrace.current, // from catch (err, s)
          hint: 'ERROR - stripe.dart.handleStripeCardPayment',
        );
        store
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          )
          ..dispatch(
            cancelOrder(
              orderId: orderId,
              accountId: accountId,
              senderWalletAddress: senderWalletAddress,
            ),
          )
          ..dispatch(
            OrderCreationProcessStatusUpdate(
              status: OrderCreationProcessStatus.orderPaymentFailed,
            ),
          );
        return false;
      }

      await _handleStripeCardPaymentFlow(
        store: store,
        paymentIntentClientSecret: paymentIntent,
        ephemeralKey: store.state.cartState.ephemeralKey,
        publishableKey: store.state.cartState.publishableKey,
        stripeCustomerId: stripeCustomerId,
      );

      store
        ..dispatch(
          SetProcessingPayment(
            payment: LivePayment(
              amount: amount.value,
              currency: currency,
              status: PaymentProcessingStatus.succeeded,
              technology: PaymentTechnology.card,
              type: PaymentType.cardPayment,
            ),
          ),
        )
        ..dispatch(SetPaymentButtonFlag(false))
        ..dispatch(SetTransferringPayment(flag: false))
        ..dispatch(
          SetIsLoadingHttpRequest(
            isLoading: false,
          ),
        )
        ..dispatch(
          StripePaymentStatusUpdate(
            status: StripePaymentStatus.paymentConfirmed,
          ),
        );
      return true;
    } on StripeException catch (e, s) {
      if (e.error.code != FailureCode.Canceled) {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.mint,
            properties: {
              'status': 'failure',
            },
          ),
        );
        log.error(
          'Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}] because of stripe error code StripeErrorCode.[${e.error.stripeErrorCode}]: ${e.error.localizedMessage};',
          stackTrace: s,
        );
        await Sentry.captureException(
          'Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}] because of stripe error code StripeErrorCode.[${e.error.stripeErrorCode}]: ${e.error.localizedMessage};',
          stackTrace: s,
          hint:
              'ERROR - Stripe Exception: Stripe Payment ${e.error.code} with StripeErrorType.[${e.error.type}]: ${e.error.localizedMessage}; with error code StripeErrorCode.[${e.error.stripeErrorCode}]',
        );
        store
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          )
          ..dispatch(
            cancelOrder(
              orderId: orderId,
              accountId: accountId,
              senderWalletAddress: senderWalletAddress,
            ),
          )
          ..dispatch(
            OrderCreationProcessStatusUpdate(
              status: OrderCreationProcessStatus.orderPaymentFailed,
            ),
          );
        return false;
      } else {
        // payment cancelled handle
        store
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus
                  .paymentCancelled, // TODO: Hande this update and refactor apple pay stripe method to use this code too
            ),
          )
          ..dispatch(
            cancelOrder(
              orderId: orderId,
              accountId: accountId,
              senderWalletAddress: senderWalletAddress,
            ),
          )
          ..dispatch(
            OrderCreationProcessStatusUpdate(
              status: OrderCreationProcessStatus.orderCancelled,
            ),
          )
          ..dispatch(SetPaymentButtonFlag(false));
        return false;
      }
    } on Exception catch (e, s) {
      log.error(
        e,
        stackTrace: s,
      );
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - Stripe Exception: $e',
      );
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.paymentFailed,
        ),
      );
      return false;
    }
  }

  Future<bool> handleApplePay({
    required String productName,
    required String recipientWalletAddress,
    required String senderWalletAddress,
    required num orderId,
    required num accountId,
    required String? stripeCustomerId,
    required String paymentIntentClientSecret,
    required Money amount,
    required Store<AppState> store,
    required bool shouldPushToHome,
  }) async {
    try {
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.none,
        ),
      );
      final currency = amount.currency;
      // 1. fetch Intent Client Secret from backend
      if (currency.isCrypto()) {
        final paymentIntentClientSecret =
            await stripePayService.createStripePaymentIntent(
          amount: amount.value,
          currency: amount.currency.name.toLowerCase(),
          recipientWalletAddress: recipientWalletAddress,
          senderWalletAddress: senderWalletAddress,
          orderId: orderId,
          accountId: accountId,
          stripeCustomerId: stripeCustomerId,
        );
        if (paymentIntentClientSecret == null) {
          log.error('Unable to create payment intent from ${stripePayService}');
          await Sentry.captureException(
            Exception(
                'Unable to create payment intent from ${stripePayService}'),
            stackTrace: StackTrace.current, // from catch (err, s)
          );
          store.dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          );
          return false;
        } else if (currency != Currency.GBP && currency != Currency.GBPx) {
          log.error(
              'Unable to use apple pay via stripe for currency: $currency');
          await Sentry.captureException(
            Exception(
                'Unable to use apple pay via stripe for currency: $currency'),
            stackTrace: StackTrace.current, // from catch (err, s)
          );
          store.dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          );
          return false;
        }
      } else {
        // only need secret below so nothing to do...
      }

      // final billingDetails = BillingDetails(
      //   name: store.state.cartState.order?.deliveryName,
      //   email: store.state.cartState.order?.deliveryEmail,
      //   phone: store.state.cartState.order?.deliveryPhoneNumber,
      //   address: Address(
      //     city: store.state.cartState.order?.deliveryAddressCity,
      //     country: 'UK',
      //     line1: store.state.cartState.order?.deliveryAddressLineOne,
      //     line2: store.state.cartState.order?.deliveryAddressLineTwo,
      //     state: store.state.cartState.order?.deliveryAddressCity,
      //     postalCode: store.state.cartState.order?.deliveryAddressPostCode,
      //   ),
      // );

      // 2. Confirm apple pay payment
      await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: paymentIntentClientSecret,
        confirmParams: PlatformPayConfirmParams.applePay(
          applePay: ApplePayParams(
            cartItems: [
              ApplePayCartSummaryItem.immediate(
                label: productName,
                amount: amount.inGBPValue.toStringAsFixed(2),
              )
            ],
            merchantCountryCode:
                amount.inGBP.currency.name.toLowerCase().substring(0, 2),
            currencyCode: amount.inGBP.currency.name.toLowerCase(),
          ),
        ),
      );

      if (currency.isCrypto()) {
        store
          ..dispatch(
            SetProcessingPayment(
              payment: LivePayment(
                amount: amount.value,
                currency: currency,
                status: PaymentProcessingStatus.started,
                technology: PaymentTechnology.stripeOnRamp,
                type: PaymentType.topup,
              ),
            ),
          )
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.mintingStarted,
            ),
          );
      } else {
        store
          ..dispatch(
            SetProcessingPayment(
              payment: LivePayment(
                amount: amount.value,
                currency: currency,
                status: PaymentProcessingStatus.succeeded,
                technology: PaymentTechnology.applePay,
                type: PaymentType.cardPayment,
              ),
            ),
          )
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            SetIsLoadingHttpRequest(
              isLoading: false,
            ),
          )
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentConfirmed,
            ),
          );
      }
      return true;
    } on Exception catch (e, s) {
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.paymentFailed,
        ),
      );
      if (e is StripeException) {
        if (e.error.code != FailureCode.Canceled) {
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.mint,
              properties: {
                'status': 'failure',
              },
            ),
          );
          log.error(e.error.localizedMessage);
          await Sentry.captureException(
            e,
            stackTrace: s,
          );
          return false;
        } else {
          return false;
        }
      } else {
        log.error(e);
        await Sentry.captureException(
          e,
          stackTrace: s,
        );
        return false;
      }
    }
  }

  Future<bool> handleGooglePay({
    required String productName,
    required String recipientWalletAddress,
    required String senderWalletAddress,
    required num orderId,
    required num accountId,
    required String? stripeCustomerId,
    required String paymentIntentClientSecret,
    required Money amount,
    required Store<AppState> store,
    required bool shouldPushToHome,
  }) async {
    try {
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.none,
        ),
      );
      final currency = amount.currency;
      if (currency.isCrypto()) {
        final paymentIntentClientSecret =
            await stripePayService.createStripePaymentIntent(
          amount: amount.value,
          currency: amount.currency.name.toLowerCase(),
          recipientWalletAddress: recipientWalletAddress,
          senderWalletAddress: senderWalletAddress,
          orderId: orderId,
          accountId: accountId,
          stripeCustomerId: stripeCustomerId,
        );
        if (paymentIntentClientSecret == null) {
          log.error('Unable to create payment intent from ${stripePayService}');
          await Sentry.captureException(
            Exception(
                'Unable to create payment intent from ${stripePayService}'),
            stackTrace: StackTrace.current, // from catch (err, s)
          );
          store.dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          );
          return false;
        } else if (currency != Currency.GBP && currency != Currency.GBPx) {
          log.error(
              'Unable to use google pay via stripe for currency: $currency');
          await Sentry.captureException(
            Exception(
                'Unable to use google pay via stripe for currency: $currency'),
            stackTrace: StackTrace.current, // from catch (err, s)
          );
          store.dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentFailed,
            ),
          );
          return false;
        }
      } else {
        // only need secret below so nothing to do...
      }
      // 2. Confirm apple pay payment
      await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: paymentIntentClientSecret,
        confirmParams: PlatformPayConfirmParams.googlePay(
          googlePay: GooglePayParams(
            testEnv: Env.isDev || Env.isTest,
            merchantCountryCode:
                amount.inGBP.currency.name.toLowerCase().substring(0, 2),
            currencyCode: amount.inGBP.currency.name.toLowerCase(),
          ),
        ),
      );

      final mintingCrypto = currency == Currency.GBPx ||
          currency == Currency.PPL ||
          currency == Currency.GBT;
      if (mintingCrypto) {
        store
          ..dispatch(
            SetProcessingPayment(
              payment: LivePayment(
                amount: amount.value,
                currency: currency,
                status: PaymentProcessingStatus.started,
                technology: PaymentTechnology.stripeOnRamp,
                type: PaymentType.topup,
              ),
            ),
          )
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.mintingStarted,
            ),
          );
      } else {
        store
          ..dispatch(
            SetProcessingPayment(
              payment: LivePayment(
                amount: amount.value,
                currency: currency,
                status: PaymentProcessingStatus.succeeded,
                technology: PaymentTechnology.googlePay,
                type: PaymentType.cardPayment,
              ),
            ),
          )
          ..dispatch(SetPaymentButtonFlag(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(
            SetIsLoadingHttpRequest(
              isLoading: false,
            ),
          )
          ..dispatch(
            StripePaymentStatusUpdate(
              status: StripePaymentStatus.paymentConfirmed,
            ),
          );
      }
      return true;
    } on Exception catch (e, s) {
      store.dispatch(
        StripePaymentStatusUpdate(
          status: StripePaymentStatus.paymentFailed,
        ),
      );
      if (e is StripeException) {
        if (e.error.code != FailureCode.Canceled) {
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.mint,
              properties: {
                'status': 'failure',
              },
            ),
          );
          log.error(e.error.localizedMessage);
          await Sentry.captureException(
            e,
            stackTrace: s,
          );
          return false;
        } else {
          return false;
        }
      } else {
        log.error(e);
        await Sentry.captureException(
          e,
          stackTrace: s,
        );
        return false;
      }
    }
  }
}
