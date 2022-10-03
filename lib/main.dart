import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/app.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/router/auth_flow.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/reducers/app_reducer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/onboard/vegiOnboardStrategy.dart';
import 'package:vegan_liverpool/utils/storage.dart';
import 'package:vegan_liverpool/utils/stripe.dart';

import 'redux/actions/user_actions.dart';

Future<void> reauthenticateServices(
    Store<AppState> store, AppState initialState) async {
  PhoneAuthCredential? credential = initialState.userState.credentials;
  if (!userIsLoggedIn(store)) {
    return;
  }
  if (userNeedsFreshCreds(store) || credential == null) {
    return;
  }
  await vegiAuthChain(
    phoneNumber: initialState.userState.phoneNumber,
    credentials: credential,
    accountAddress: initialState.userState.walletAddress,
    firebaseIdentifier: initialState.userState.identifier,
    refreshCredentials: () => store.dispatch(SetCredentials(null)),
    onError: (errorMsg) => log.error(errorMsg),
  );
}

Future<AppState> loadState(persistor) async {
  try {
    final AppState initialState = await persistor.load();
    return initialState;
  } catch (e, s) {
    print('Load AppState failed ${e.toString()} ${s.toString()}');
    return AppState.initial();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Makes it so that you cannot use the app in landscape mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // const env = 'prod';
  // const env = 'qa';
  const env = 'dev';

  //choose a dev environment and load that file from .env folder
  final envFile = env == 'prod' ? '.env' : '.env_${env}';
  await dotenv.load(fileName: 'environment/${envFile}');

  // initialize stripe for payment
  new StripeService()..init();

  await configureDependencies(environment: Env.dev);

  //gets the entire app state from the user device storage.
  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: SecureStorage(FlutterSecureStorage()),
    serializer: JsonSerializer<AppState>((json) => AppState.fromJson(json)),
    debug: kDebugMode,
  );

  //initial state is taken from the device storage
  AppState initialState = await loadState(persistor);

  final List<Middleware<AppState>> wms = [
    thunkMiddleware,
    persistor.createMiddleware(),
  ];

  // If the app is built in Debug mode, you want to add a logger which prints
  if (kDebugMode) {
    wms.add(LoggingMiddleware.printer());
  }

  // Initialize the Redux Store with the initial state from the user device (if it exists)
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: wms,
  );

  await reauthenticateServices(store, initialState);

  //Sentry initialization for logging
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.debug = !kReleaseMode;
        options.dsn = dotenv.env['SENTRY_DSN'];
        options.environment = "prod";
      },
    );

    //Pass the store to the Main App which injects it into the entire tree.
    runApp(MyApp(store));
    if (Platform.isIOS) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }
  }, (exception, stackTrace) async {
    if (kReleaseMode) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    } else {
      log.error('FlutterError exception: ${exception.toString()}');
      log.error('FlutterError stackTrace: ${stackTrace.toString()}');
    }
  });
}
