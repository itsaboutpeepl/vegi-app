import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class BackupViewModel extends Equatable {
  const BackupViewModel({
    required this.backupWallet,
    required this.userMnemonic,
  });

  factory BackupViewModel.fromStore(Store<AppState> store) {
    return BackupViewModel(
      userMnemonic: store.state.userState.mnemonic,
      backupWallet: () {
        store.dispatch(
          BackupSuccess(),
        ); // Maybe add this to one of the init app calls  //TODO: we need to be able to have a GET end point on vegi backend to tell us whether a wallet address has its pk backed up but must be authorized backend method
      },
    );
  }

  final void Function() backupWallet;
  final List<String> userMnemonic;

  @override
  List<Object?> get props => [userMnemonic];
}

class LockScreenViewModel extends Equatable {
  const LockScreenViewModel({
    required this.pincode,
  });

  factory LockScreenViewModel.fromStore(Store<AppState> store) {
    return LockScreenViewModel(
      pincode: store.state.userState.pincode,
    );
  }

  final String pincode;

  @override
  List<Object?> get props => [pincode];
}
