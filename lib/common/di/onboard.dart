import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/utils/onboard/Istrategy.dart';

@module
abstract class OnBoardStrategy {
  @lazySingleton
  IOnBoardStrategy get onBoardStrategy => OnBoardStrategyFactory.create(
        dotenv.env['ON_BOARDING_STRATEGY'] ?? 'sms',
      );
}
