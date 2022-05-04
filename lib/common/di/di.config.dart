// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;
import 'package:package_info/package_info.dart' as _i13;
import 'package:phone_number/phone_number.dart' as _i16;
import 'package:wallet_core/wallet_core.dart' as _i3;

import '../../services/apis/explorer.dart' as _i5;
import '../../services/apis/fuseswap.dart' as _i9;
import '../../services/apis/market.dart' as _i12;
import '../../services/apis/peeplEats.dart' as _i14;
import '../../services/apis/peeplPay.dart' as _i15;
import '../../services/apis/stripePay.dart' as _i18;
import '../../utils/log/log_it.dart' as _i19;
import '../../utils/onboard/Istrategy.dart' as _i10;
import '../network/services.dart' as _i20;
import '../router/routes.dart' as _i17;
import 'dio.dart' as _i21;
import 'firebase.dart' as _i22;
import 'logger_di.dart' as _i24;
import 'onboard.dart' as _i23;
import 'package_info.dart' as _i25;
import 'phone.dart' as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  final dioDi = _$DioDi();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final onBoardStrategy = _$OnBoardStrategy();
  final loggerDi = _$LoggerDi();
  final packageInfoDi = _$PackageInfoDi();
  final phone = _$Phone();
  gh.lazySingleton<_i3.API>(() => servicesModule.api);
  gh.factory<_i4.Dio>(() => dioDi.dio);
  gh.factoryParam<_i5.Explorer, String?, String?>(
      (base, apiKey) => _i5.Explorer(get<_i4.Dio>(), base, apiKey));
  await gh.factoryAsync<_i6.FirebaseApp>(
      () => firebaseInjectableModule.firebaseApp,
      preResolve: true);
  gh.lazySingleton<_i7.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i8.FirebaseMessaging>(
      () => firebaseInjectableModule.firebaseMessaging);
  gh.lazySingleton<_i9.FuseSwapService>(
      () => _i9.FuseSwapService(get<_i4.Dio>()));
  gh.lazySingleton<_i3.Graph>(() => servicesModule.graph);
  gh.lazySingleton<_i10.IOnBoardStrategy>(
      () => onBoardStrategy.onBoardStrategy);
  gh.lazySingleton<_i11.Logger>(() => loggerDi.logger);
  gh.lazySingleton<_i12.Market>(() => _i12.Market(get<_i4.Dio>()));
  await gh.factoryAsync<_i13.PackageInfo>(() => packageInfoDi.packageInfo,
      preResolve: true);
  gh.lazySingleton<_i14.PeeplEatsService>(
      () => _i14.PeeplEatsService(get<_i4.Dio>()));
  gh.lazySingleton<_i15.PeeplPaySerivce>(
      () => _i15.PeeplPaySerivce(get<_i4.Dio>()));
  gh.lazySingleton<_i16.PhoneNumberUtil>(() => phone.phoneNumberUtil);
  gh.singleton<_i17.RootRouter>(servicesModule.rootRouter);
  gh.lazySingleton<_i18.StripePayService>(
      () => _i18.StripePayService(get<_i4.Dio>()));
  gh.lazySingleton<_i3.WalletApi>(() => servicesModule.walletApi);
  gh.lazySingleton<_i19.LogIt>(() => _i19.LogIt(get<_i11.Logger>()));
  return get;
}

class _$ServicesModule extends _i20.ServicesModule {}

class _$DioDi extends _i21.DioDi {}

class _$FirebaseInjectableModule extends _i22.FirebaseInjectableModule {}

class _$OnBoardStrategy extends _i23.OnBoardStrategy {}

class _$LoggerDi extends _i24.LoggerDi {}

class _$PackageInfoDi extends _i25.PackageInfoDi {}

class _$Phone extends _i26.Phone {}
