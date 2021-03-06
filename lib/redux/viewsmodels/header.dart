import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class HeaderViewModel {
  final Function() firstName;

  HeaderViewModel({
    required this.firstName,
  });

  static HeaderViewModel fromStore(Store<AppState> store) {
    return HeaderViewModel(
      firstName: () {
        String fullName = store.state.userState.displayName;
        return fullName.split(' ')[0];
      },
    );
  }
}
