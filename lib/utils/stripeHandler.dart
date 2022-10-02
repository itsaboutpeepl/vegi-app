import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:vegan_liverpool/app_config.dart';
import 'package:vegan_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:vegan_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

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
            currency: AppConfig.stripe_topup_currency.toLowerCase(),
            walletAddress: walletAddress);
    // create some billingdetails
    // final billingDetails = BillingDetails( // Default the billing details from user details if we have.
    //   name: 'Flutter Stripe',
    //   email: 'email@stripe.com',
    //   phone: '+48888000888',
    //   address: Address(
    //     city: 'Houston',
    //     country: 'US',
    //     line1: '1459  Circle Drive',
    //     line2: '',
    //     state: 'Texas',
    //     postalCode: '77063',
    //   ),
    // );
    // ~ https://github.com/flutter-stripe/flutter_stripe/blob/6e26f1c756439622664169916e7a4f92ce684f10/example/lib/screens/payment_sheet/payment_sheet_screen.dart
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: AppConfig.use_apple_pay_stripe_integration
            ? PaymentSheetApplePay(
                merchantCountryCode: 'GB',
              )
            : null,
        googlePay: AppConfig.use_google_pay_stripe_integration
            ? PaymentSheetGooglePay(
                merchantCountryCode: 'GB',
                testEnv: true,
              )
            : null,
        style: ThemeMode.dark,
        // testEnv: true,
        // merchantCountryCode: 'GB',
        // currencyCode: AppConfig.stripe_topup_currency.toLowerCase(),
        merchantDisplayName: AppConfig.stripe_payments_network_display_name,
        paymentIntentClientSecret: paymentIntentClientSecret,
        // billingDetails: billingDetails
      ),
    );
    await Stripe.instance.presentPaymentSheet();
    //TODO: add timer for dialog

    showDialog(
      context: context,
      builder: (context) {
        return MintingDialog(
          amountText: amountText,
          shouldPushToHome: shouldPushToHome,
        );
      },
      barrierDismissible: false,
    );
  } on Exception catch (e) {
    if (e is StripeException) {
      log.error(e.error.localizedMessage);
      showDialog(
        context: context,
        builder: (context) => TopUpFailed(),
      );
    }
  }
}
