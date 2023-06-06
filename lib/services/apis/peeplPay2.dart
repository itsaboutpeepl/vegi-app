import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

@lazySingleton
class PeeplPayService {
  PeeplPayService();
  Dio get dio => peeplEatsService.dio;

  Future<Map<String, dynamic>> checkOrderValidity(
    String paymentIntentID,
  ) async {
    final Response<dynamic> response = await peeplEatsService.dioGet(
      'api/v1/payment_intents/$paymentIntentID',
      // sendWithAuthCreds: true,
    );

    final Map<String, dynamic> result = response.data as Map<String, dynamic>;

    log.info(
      'Check Order Validity: Payment Intent Result $result',
      stackTrace: StackTrace.current,
    );

    return result;
  }
}
