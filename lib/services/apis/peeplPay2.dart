import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_check.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent_internal.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class PeeplPayService {
  PeeplPayService();
  Dio get dio => peeplEatsService.dio;

  Future<StripePaymentIntentCheck?> checkOrderValidity(
    String paymentIntentID,
  ) async {
    final Response<dynamic> response = await peeplEatsService.dioGet(
      'api/v1/payment_intents/$paymentIntentID',
      // sendWithAuthCreds: true,
      // queryParameters: { // ! dont include
      //   'client_secret': paymentIntentClientSecret,
      // },
    );

    if (response.data == null) {
      log.error(
        'PaymentIntent check not found for paymentIntentId: "$paymentIntentID"',
        stackTrace: StackTrace.current,
      );
      await Sentry.captureException(
        'PaymentIntent check not found for paymentIntentId: "$paymentIntentID"',
        stackTrace: StackTrace.current, // from catch (err, s)
        hint: 'ERROR - peeplPay2.dart.checkOrderValidity',
      );
      return null;
    }

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    log.info(
      'Check Order Validity: Payment Intent Result $result',
      stackTrace: StackTrace.current,
    );

    if (result.isNotEmpty && result.containsKeyAndNotNull('paymentIntent')) {
      result['paymentIntent']['client_secret'] =
          (await reduxStore).state.cartState.paymentIntentClientSecret;
    }
    if (result.isNotEmpty && result.containsKeyAndNotNull('id')) {
      result['paymentIntent']['id'] = paymentIntentID;
    }

    return StripePaymentIntentCheck.fromJson(result);
  }
}
