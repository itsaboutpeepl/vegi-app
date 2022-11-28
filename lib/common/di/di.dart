import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/common/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String? environment}) async =>
    $initGetIt(getIt, environment: environment);
