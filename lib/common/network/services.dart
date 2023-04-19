import 'package:dio/dio.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/services/apis/peeplEats.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/utils/constants.dart';

@module
abstract class ServicesModule {
  @lazySingleton
  RootRouter get rootRouter => RootRouter(
        authGuard: AuthGuard(),
      );

  @lazySingleton
  FuseWalletSDK get fuseWalletSDK =>
      FuseWalletSDK(Secrets.FUSE_WALLET_SDK_PUBLIC_KEY);
}
