import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/user_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:redux/redux.dart';

class BackupViewModel extends Equatable {
  final UserState user;
  final Function() backupWallet;
  final Function() finishSaveSeedPhrase;

  BackupViewModel({
    required this.user,
    required this.backupWallet,
    required this.finishSaveSeedPhrase,
  });

  static BackupViewModel fromStore(Store<AppState> store) {
    return BackupViewModel(
      user: store.state.userState,
      backupWallet: () {
        store.dispatch(backupWalletCall());
      },
      finishSaveSeedPhrase: () {
        store.dispatch(SetShowSeedPhraseBanner(false));
        store.dispatch(SetHasSavedSeedPhrase(true));
      },
    );
  }

  @override
  List<Object> get props => [user];
}

class LockScreenViewModel extends Equatable {
  final String pincode;

  LockScreenViewModel({
    required this.pincode,
  });

  static LockScreenViewModel fromStore(Store<AppState> store) {
    return LockScreenViewModel(
      pincode: store.state.userState.pincode,
    );
  }

  @override
  List<Object> get props => [pincode];
}
