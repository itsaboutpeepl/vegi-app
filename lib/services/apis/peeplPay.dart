import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/constants/urls.dart';

@lazySingleton
class PeeplPaySerivce {
  final Dio dio;

  PeeplPaySerivce(this.dio) {
    dio.options.baseUrl = UrlConstants.PEEPL_PAY_BACKEND;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<Map<dynamic, dynamic>> startPaymentIntentCheck(
      String paymentIntentID) async {
    Response response =
        await dio.get("api/v1/payment_intents/$paymentIntentID");

    Map<dynamic, dynamic> result = response.data;

    print("Payment Intent Result $result");

    return result;
  }
}
