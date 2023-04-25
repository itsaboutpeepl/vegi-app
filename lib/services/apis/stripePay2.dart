import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/models/payments/stripe_payment_intent.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class StripePayService {
  // StripePayService(this.dio) {
  //   dio.options.baseUrl = Secrets.VEGI_EATS_BACKEND;
  //   dio.options.headers = Map.from({'Content-Type': 'application/json'});
  // }
  // final Dio dio;
  StripePayService();
  Dio get dio => peeplEatsService.dio;

  Future<Map<dynamic, dynamic>> startPaymentIntentCheck(
    String paymentIntentID,
  ) async {
    try {
      final Response<dynamic> response = await peeplEatsService.dioGet(
        '/api/v1/payments/check-stripe-payment-intent/$paymentIntentID',
        sendWithAuthCreds: true,
      );

      final Map<String, dynamic> result = response.data as Map<String, dynamic>;

      log.info('Payment Intent Result $result');

      return result;
    } catch (e, s) {
      log.info('Error: startPaymentIntentCheck ${e.toString()}');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'Error: startPaymentIntentCheck ${e.toString()}',
      );
      return {};
    }
  }

  Future<StripePaymentIntent?> createStripePaymentIntent({
    required int amount,
    String? stripeCustomerId,
    String currency = 'gbp',
    String? walletAddress,
  }) async {
    try {
      final Response<dynamic> response = await peeplEatsService.dioPost(
        '/api/v1/payments/create-stripe-payment-intent',
        data: {
          'amount': amount,
          'currency': currency,
          'customerId': stripeCustomerId ?? '',
          'businessName': 'vegi',
          'walletAddress': walletAddress,
        },
        sendWithAuthCreds: true,
      );

      return StripePaymentIntent.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e, s) {
      log.info('Error createStripePaymentIntent $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'Error createStripePaymentIntent $e',
      );
      return null;
    }
  }

  Future<void> makePayment({
    required int paymentType,
    required int amount,
    required String currency,
  }) async {
    throw UnimplementedError();
  }
}
