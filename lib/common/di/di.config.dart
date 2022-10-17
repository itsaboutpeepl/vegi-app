// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:charge_wallet_sdk/charge_wallet_sdk.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:logger/logger.dart' as _i10;
import 'package:package_info/package_info.dart' as _i12;
import 'package:phone_number/phone_number.dart' as _i15;

import '../../services/apis/peeplEats.dart' as _i13;
import '../../services/apis/peeplPay.dart' as _i14;
import '../../services/apis/stripePay.dart' as _i17;
import '../../utils/connectionChecker.dart' as _i11;
import '../../utils/log/log_it.dart' as _i19;
import '../../utils/onboard/Istrategy.dart' as _i8;
import '../../utils/stripe.dart' as _i18;
import '../network/services.dart' as _i20;
import '../router/routes.dart' as _i16;
import 'dio.dart' as _i21;
import 'firebase.dart' as _i22;
import 'logger_di.dart' as _i25;
import 'network_info_di.dart' as _i24;
import 'onboard.dart' as _i23;
import 'package_info.dart' as _i26;
import 'phone.dart' as _i27; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final servicesModule = _$ServicesModule();
  final dioDi = _$DioDi();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final onBoardStrategy = _$OnBoardStrategy();
  final networkInfoDi = _$NetworkInfoDi();
  final loggerDi = _$LoggerDi();
  final packageInfoDi = _$PackageInfoDi();
  final phone = _$Phone();
  gh.lazySingleton<_i3.ChargeApi>(() => servicesModule.chargeApi);
  gh.factory<_i4.Dio>(() => dioDi.dio);
  await gh.factoryAsync<_i5.FirebaseApp>(
    () => firebaseInjectableModule.firebaseApp,
    preResolve: true,
  );
  gh.lazySingleton<_i6.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i7.FirebaseMessaging>(
      () => firebaseInjectableModule.firebaseMessaging);
  gh.lazySingleton<_i3.FuseExplorer>(() => servicesModule.fuseExplorerAPI);
  gh.lazySingleton<_i3.Graph>(() => servicesModule.graph);
  gh.lazySingleton<_i8.IOnBoardStrategy>(() => onBoardStrategy.onBoardStrategy);
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  gh.lazySingleton<_i10.Logger>(() => loggerDi.logger);
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i11.NetworkInfo(get<_i9.InternetConnectionChecker>()));
  await gh.factoryAsync<_i12.PackageInfo>(
    () => packageInfoDi.packageInfo,
    preResolve: true,
  );
  gh.lazySingleton<_i13.PeeplEatsService>(
      () => _i13.PeeplEatsService(get<_i4.Dio>()));
  gh.lazySingleton<_i14.PeeplPaySerivce>(
      () => _i14.PeeplPaySerivce(get<_i4.Dio>()));
  gh.lazySingleton<_i15.PhoneNumberUtil>(() => phone.phoneNumberUtil);
  gh.lazySingleton<_i16.RootRouter>(() => servicesModule.rootRouter);
  gh.lazySingleton<_i17.StripePayService>(
      () => _i17.StripePayService(get<_i4.Dio>()));
  gh.lazySingleton<_i18.StripeService>(() => _i18.StripeService());
  gh.lazySingleton<_i19.LogIt>(() => _i19.LogIt(get<_i10.Logger>()));
  return get;
}

class _$ServicesModule extends _i20.ServicesModule {}

class _$DioDi extends _i21.DioDi {}

class _$FirebaseInjectableModule extends _i22.FirebaseInjectableModule {}

class _$OnBoardStrategy extends _i23.OnBoardStrategy {}

class _$NetworkInfoDi extends _i24.NetworkInfoDi {}

class _$LoggerDi extends _i25.LoggerDi {}

class _$PackageInfoDi extends _i26.PackageInfoDi {}

class _$Phone extends _i27.Phone {}
