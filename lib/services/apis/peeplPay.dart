import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PeeplPaySerivce {
  final Dio dio;

  PeeplPaySerivce(this.dio) {
    dio.options.baseUrl = dotenv.env['PEEPL_PAY_BACKEND']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  Future<Map<String, dynamic>> startPaymentIntentCheck(
      String paymentIntentID) async {
    final Response<dynamic> response =
        await dio.get('api/v1/payment_intents/$paymentIntentID');

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    print('Payment Intent Result $result');

    return result;
  }
}
