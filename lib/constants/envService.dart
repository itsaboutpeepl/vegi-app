import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  static bool isUsingProdServices = !kDebugMode &&
      dotenv.env['VEGI_EATS_BACKEND'] != null &&
      (dotenv.env['VEGI_EATS_BACKEND']!.toLowerCase().contains(
          'localhost',) /*||
          dotenv.env['VEGI_EATS_BACKEND']!.toLowerCase().contains('qa-vegi')*/
      );
}
