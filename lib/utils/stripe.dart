import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/pay/dialogs/stripe_payment_confirmed_dialog.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
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
    Stripe.publishableKey = kDebugMode
        ? dotenv.env['STRIPE_API_KEY_TEST']!
        : dotenv.env['STRIPE_API_KEY_LIVE']!;
    if (Stripe.publishableKey.contains('live')) {
      throw Exception('Stripe Instance not ready for production usage.');
    }
    Stripe.merchantIdentifier = 'merchant.com.vegiapp';
  }

  Future<bool> handleStripe({
    required String walletAddress,
    required int amount,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        //TODO: if walletAddress, then user stripePayService.createStripePaymentIntentForTopupFromBank or something
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );
      if (paymentIntentClientSecret == null) {
        log.error('Unable to create payment intent from ${stripePayService}');
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }

      // ~ https://docs.page/flutter-stripe/flutter_stripe/sheet#5-test-the-integration
      final dynamicUrl = 'vegi://vegiApp.co.uk${rootRouter.currentUrl}';
      log.info(dynamicUrl);
      await instance.initPaymentSheet(
        // todo: Check that the returnUrl makes sense...
        paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.dark,
          merchantDisplayName: 'vegi',
          paymentIntentClientSecret: paymentIntentClientSecret.paymentIntent
              .clientSecret, //todo autoformat saved customer details from calling backend to retreive customer details for their saved stripeCustomerId from store
          customerEphemeralKeySecret: paymentIntentClientSecret.ephemeralKey,
          // billingDetails, delayedPaymentMethods etc...
          returnURL: dynamicUrl,
          // billingDetails: BillingDetails()
        ),
      );
      await instance.presentPaymentSheet();
      final mintingCrypto = walletAddress.isNotEmpty;
      if (mintingCrypto) {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return MintingDialog(
              amountText: amount.formattedPrice,
              shouldPushToHome: shouldPushToHome,
            );
          },
          barrierDismissible: false,
        );
      } else {
        // Stripe sends a payment_intent.succeeded event when the payment completes. (~ https://stripe.com/docs/api/events/types#event_types-payment_intent.succeeded)
        // Subscribe to these events from the vegi backend by passing the vegi backend here when creating the
        // * we have a stripe webhook setup now on vegi backend.

        await showDialog<void>(
          context: context,
          builder: (context) {
            return StripePaymentConfirmedDialog();
          },
          barrierDismissible: true,
        );
      }
      return true;
    } on Exception catch (e, s) {
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
            hint: 'ERROR - Stripe Exception: ${e.error.localizedMessage}',
          );
          await showDialog<void>(
            context: context,
            builder: (context) => const TopUpFailed(
              isFailed: true,
            ),
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
          hint: 'ERROR - Stripe Exception: $e',
        );
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }
    }
  }

  Future<bool> handleApplePay({
    required String productName,
    required String walletAddress,
    required int amount,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      // 1. fetch Intent Client Secret from backend
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );
      if (paymentIntentClientSecret == null) {
        log.error('Unable to create payment intent from ${stripePayService}');
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }

      // 2. Confirm apple pay payment
      await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: paymentIntentClientSecret.paymentIntent.clientSecret,
        confirmParams: PlatformPayConfirmParams.applePay(
          applePay: ApplePayParams(
            cartItems: [
              ApplePayCartSummaryItem.immediate(
                label: productName,
                amount: (amount / 100).toString(),
              )
            ],
            merchantCountryCode: 'gb',
            currencyCode: 'gbp',
          ),
        ),
      );
      await showDialog<void>(
        context: context,
        builder: (context) {
          return MintingDialog(
            amountText: amount.formattedPrice,
            shouldPushToHome: shouldPushToHome,
          );
        },
        barrierDismissible: false,
      );
      return true;
    } on Exception catch (e, s) {
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
          await showDialog<void>(
            context: context,
            builder: (context) => const TopUpFailed(
              isFailed: true,
            ),
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
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }
    }
  }
}
