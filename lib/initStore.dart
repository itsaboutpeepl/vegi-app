import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/di/env.dart';
import 'package:vegan_liverpool/loadAppState.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/reducers/app_reducer.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/storage.dart';
import 'package:redux/redux.dart';

@module
abstract class RegisterModule {
  @singleton
  Future<Store<AppState>> store() async {
    final prefs = await SharedPreferences.getInstance();

    final hasLoggedIn = prefs.getInt('hasLoggedIn');

    final firstLogin = hasLoggedIn != 1;
    if (firstLogin) {
      await prefs.setInt('hasLoggedIn', 1);
    }

    final Persistor<AppState> persistor = Persistor<AppState>(
      storage: SecureStorage(const FlutterSecureStorage()),
      serializer: JsonSerializer<AppState>(AppState.fromJsonForPersistor),
      debug: DebugHelpers.isVerboseDebugMode,
    );

    final AppState initialState = await loadState(persistor, firstLogin);

    final List<Middleware<AppState>> wms = [
      thunkMiddleware,
      persistor.createMiddleware(),
    ];

    if (DebugHelpers.isVerboseDebugMode) {
      wms.add(LoggingMiddleware<AppState>.printer());
    }

    late final Store<AppState> store;

    if (Env.isDev) {
      final devStore = DevToolsStore<AppState>(
        appReducer,
        initialState: await loadState(persistor, firstLogin),
        middleware: wms,
      );

      store = devStore;

      getIt.registerSingleton<DevToolsStore<AppState>>(devStore);
      // getIt.registerSingleton<Store<AppState>>(store);
    } else {
      store = Store<AppState>(
        appReducer,
        initialState: initialState,
        middleware: wms,
      );
      // getIt.registerSingleton<Store<AppState>>(store);
    }
    // peeplEatsService.store = store;

    // await reauthenticateServices(store, initialState);

    return store;
  }
}
