import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/common/di/di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit() //https://resocoder.com/2020/02/04/injectable-flutter-dart-equivalent-to-dagger-angular-dependency-injection/
Future<void> configureDependencies({String? environment}) async =>
    $initGetIt(getIt, environment: environment); // inits the firebaseApp

abstract class Env {
  static const dev = 'dev';
  static const test = 'test';
  static const prod = 'prod';
}