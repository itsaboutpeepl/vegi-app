import 'package:redux_persist/redux_persist.dart';
import 'package:vegan_liverpool/models/app_state.dart';

Future<AppState> loadState(Persistor<AppState> persistor) async {
  try {
    final initialState = await persistor.load();
    if (initialState == null) throw Exception('InitialState is null');
    return initialState;
  } catch (e, s) {
    print('Load AppState failed ${e.toString()} ${s.toString()}');
    return AppState.initial();
  }
}
