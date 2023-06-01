import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/app.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/di/env.dart';
import 'package:vegan_liverpool/common/network/web3auth.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/redux_state_viewer.dart';
import 'package:vegan_liverpool/initFirebaseRemote.dart';
import 'package:vegan_liverpool/loadAppState.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/new_version.dart';
import 'package:vegan_liverpool/redux/reducers/app_reducer.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/storage.dart';
import 'package:vegan_liverpool/utils/stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const envStr = Env.activeEnv;

  if (DebugHelpers.inDebugMode) {
    print('Loading secrets from ${Env.envFile} for Env: ${Env.activeEnv}');
  }
  await dotenv.load(fileName: Env.envFile);

  StripeService().init();

  await initWeb3AuthService();

  await configureDependencies(environment: envStr);

  final store = await reduxStore;

  await initFirebaseRemote();

  await runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options
          ..debug = (!kReleaseMode && DebugHelpers.isVerboseDebugMode)
          ..dsn = dotenv.env['SENTRY_DSN']
          ..environment = Env.activeEnv;
      },
    );

    //Pass the store to the Main App which injects it into the entire tree.
    if (Env.isDev) {
      runApp(
        ReduxDevToolsContainer(
          store: store,
          child: MyApp(
            store,
          ),
        ),
      );
    } else {
      runApp(MyApp(store));
    }
    if (Platform.isIOS) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }
  }, (e, s) async {
    if (kReleaseMode) {
      await Sentry.captureException(e, stackTrace: s);
    } else {
      log.error('FlutterError exception: $e', stackTrace: s);
    }
  });
}
