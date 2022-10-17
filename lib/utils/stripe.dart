import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

//TODO: Move class
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
    Stripe.publishableKey =
        dotenv.env['STRIPE_API_KEY']!; //TODO: Add kDebugMode check
  }

  Future<void> handleStripe({
    required String walletAddress,
    required String amountText,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
              amount: amountText,
              currency: 'gbp',
              walletAddress: walletAddress);

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
            amountText: amountText,
            shouldPushToHome: shouldPushToHome,
          );
        },
        barrierDismissible: false,
      );
    } on Exception catch (e, s) {
      if (e is StripeException) {
        if (e.error.code != FailureCode.Canceled) {
          log.error(e.error.localizedMessage);
          await Sentry.captureException(
            e,
            stackTrace: s,
            hint: 'ERROR - Stripe Exception: ${e.error.localizedMessage}',
          );
          await showDialog<void>(
            context: context,
            builder: (context) => TopUpFailed(
              isFailed: true,
            ),
          );
        } else {
          await showDialog<void>(
            context: context,
            builder: (context) => TopUpFailed(),
          );
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
          builder: (context) => TopUpFailed(
            isFailed: true,
          ),
        );
      }
    }
  }
}
