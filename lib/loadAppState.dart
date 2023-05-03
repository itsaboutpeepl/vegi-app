import 'package:redux_persist/redux_persist.dart';
import 'package:vegan_liverpool/models/app_state.dart';

import 'utils/log/log.dart';

Future<AppState> loadState(
  Persistor<AppState> persistor,
  bool isFirstLogin,
) async {
  if (isFirstLogin ||
      const String.fromEnvironment(
            'reset_state',
            defaultValue: '',
          ) ==
          'true') {
    return AppState.initial();
  }
  try {
    final initialState = await persistor.load();
    if (initialState == null) throw Exception('InitialState is null');
    return initialState;
  } catch (e, s) {
    log.error('Load AppState failed ${e.toString()} ${s.toString()}');
    return AppState.initial();
  }
}
