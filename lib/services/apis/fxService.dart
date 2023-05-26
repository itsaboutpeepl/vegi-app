import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/location/postCodeDetail.dart';
import 'package:vegan_liverpool/services/apis/places.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

void ToNull() => null;

@lazySingleton
class FXService {
  FXService(this.dio) {
    dio.options.baseUrl = 'http://free.currencyconverterapi.com/api/v5/convert';
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }

  final Dio dio;

  Future<num> getFXRate({
    required Currency fromCurrency,
    required Currency toCurrency,
  }) async {
    const supportedCurrencies = [
      Currency.EUR,
      Currency.GBP,
      Currency.USD,
    ];
    if (supportedCurrencies.contains(fromCurrency) &&
        supportedCurrencies.contains(toCurrency)) {
      final response = await dio.get<dynamic>(
        '',
        queryParameters: {
          'apiKey': Secrets.CURRENCY_CONVERTER_API_KEY,
          'q': '${fromCurrency}_${toCurrency}',
          'compact': 'y',
        },
      );
      if(response.statusCode != 200){
        throw Exception(
          'Currency converter webservice failed to request live currency rates from currency:[${fromCurrency}] to currency:[${toCurrency}] with status: ${response.statusCode} and reason: ${response}',
        );
      }
      if(response == null || response.data == null){
        throw Exception(
          'Currency converter webservice failed to request live currency rates from currency:[${fromCurrency}] to currency:[${toCurrency}] with no status.',
        );
      }
      if (response.statusCode == 200 && response.data != null) {
        return response.data['rate'] as num;
      } else {
        log.error(
          response,
          stackTrace: StackTrace.current,
        );
        return 0.0;
      }
    } else {
      log.error(
        'Unsupported currencies requested from fxService of fromCurrency: $fromCurrency, toCurrency: $toCurrency.',
        stackTrace: StackTrace.current,
      );
      return 0.0;
    }
  }
}
