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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegan_liverpool/app.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/redux_state_viewer.dart';
import 'package:vegan_liverpool/loadAppState.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/reducers/app_reducer.dart';
import 'package:vegan_liverpool/utils/log/log.dart';
import 'package:vegan_liverpool/utils/storage.dart';
import 'package:vegan_liverpool/utils/stripe.dart';
import 'package:vegan_liverpool/common/di/env.dart';

// The Dev version of your app. It will build a DevToolsStore instead of a
// normal Store. In addition, it will provide a DevDrawer for the app, which
// will contain the ReduxDevTools themselves.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const env = Env.activeEnv;

  await dotenv.load(fileName: Env.envFile);

  StripeService().init();

  await configureDependencies(environment: env);

  final prefs = await SharedPreferences.getInstance();

  bool firstLogin = true;
  if (prefs.containsKey('hasLoggedIn')) {
    firstLogin = false;
  } else {
    firstLogin = true;
    await prefs.setInt('hasLoggedIn', 1);
  }

  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: SecureStorage(const FlutterSecureStorage()),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: kDebugMode,
  );

  final List<Middleware<AppState>> wms = [
    thunkMiddleware,
    persistor.createMiddleware(),
  ];

  if (kDebugMode) {
    wms.add(LoggingMiddleware<AppState>.printer());
  }

  final DevToolsStore<AppState> store = DevToolsStore<AppState>(
    appReducer,
    initialState: await loadState(persistor, firstLogin),
    middleware: wms,
  );

  getIt.registerSingleton<DevToolsStore<AppState>>(store);

  // await reauthenticateServices(store, initialState);

  await runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options
          ..debug = kDebugMode
          ..dsn = dotenv.env['SENTRY_DSN']
          ..environment = 'dev';
      },
    );

    //Pass the store to the Main App which injects it into the entire tree.
    runApp(
      ReduxDevToolsContainer(
        store: store,
        child: MyApp(
          store,
        ),
      ),
    );
    if (Platform.isIOS) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }
  }, (e, s) async {
    if (kReleaseMode) {
      await Sentry.captureException(e, stackTrace: s);
    } else {
      log
        ..error('FlutterError exception: ${e.toString()}')
        ..error('FlutterError stackTrace: ${s.toString()}');
    }
  });
}

// void registerDevStoreForDI(DevToolsStore store) {
//   getIt.registerSingleton<DevToolsStore>(store);
// }
