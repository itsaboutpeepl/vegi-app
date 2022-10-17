import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class StripePayService {
  StripePayService(this.dio) {
    dio.options.baseUrl = dotenv.env['STRIPE_PAY_URL']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }
  final Dio dio;

  Future<Map<dynamic, dynamic>> startPaymentIntentCheck(
    String paymentIntentID,
  ) async {
    final Response<dynamic> response =
        await dio.get('api/v1/payment_intents/$paymentIntentID');

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    print('Payment Intent Result $result');

    return result;
  }

  Future<String> createStripePaymentIntent({
    required String amount,
    required String currency,
    required String walletAddress,
  }) async {
    final int amountNew =
        (double.parse(amount) * 100).toInt(); // Pounds to pence
    try {
      final Response<dynamic> response = await dio.post(
        '/stripe/createPaymentIntent',
        data: {
          'amount': amountNew,
          'currency': currency,
          'walletAddress': walletAddress,
        },
      );

      return response.data['data']['paymentIntent']['clientSecret'] as String;
    } catch (e) {
      log.info('Error createStripePaymentIntent ${e.toString()}');
      return e.toString();
    }
  }
}
