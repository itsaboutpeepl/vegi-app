import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
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
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );

      await instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.dark,
          merchantDisplayName: 'vegi',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
      await instance.presentPaymentSheet();

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
    required String walletAddress,
    required int amount,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );

      await instance.presentApplePay(
        params: const ApplePayPresentParams(
          cartItems: [
            ApplePayCartSummaryItem.immediate(
              label: 'Product Test',
              amount: '25.0',
            ),
          ],
          country: 'GB',
          currency: 'GBP',
        ),
      );

      await Stripe.instance.confirmApplePayPayment(paymentIntentClientSecret);
      return true;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
