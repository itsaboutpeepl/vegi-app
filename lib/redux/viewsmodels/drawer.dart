// import 'package:equatable/equatable.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/models/plugins/plugins.dart';
// import 'package:redux/redux.dart';
// import 'package:vegan_liverpool/models/community/community.dart';
// import 'package:vegan_liverpool/redux/actions/user_actions.dart';
// import 'package:vegan_liverpool/utils/addresses.dart' as util;

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class DrawerViewModel extends Equatable {
  final void Function() logout;
  final String Function() firstName;
  final String pplBalance;
  final String gbpxBalance;
  final String avatarUrl;

  DrawerViewModel({
    required this.firstName,
    required this.logout,
    required this.pplBalance,
    required this.gbpxBalance,
    required this.avatarUrl,
  });

  static DrawerViewModel fromStore(Store<AppState> store) {
    final CashWalletState cashWalletState = store.state.cashWalletState;

    return DrawerViewModel(
      logout: () {
        store.dispatch(LogoutRequestSuccess());
      },
      avatarUrl: store.state.userState.avatarUrl,
      firstName: () {
        return store.state.userState.displayName.split(' ')[0];
      },
      pplBalance: cashWalletState.tokens.containsKey(pplToken.address)
          ? cashWalletState.tokens[pplToken.address]!.getBalance()
          : '0',
      gbpxBalance: cashWalletState.tokens.containsKey(gbpxToken.address)
          ? cashWalletState.tokens[gbpxToken.address]!.getBalance()
          : '0',
    );
  }

  @override
  List get props => [
        avatarUrl,
        pplBalance,
        gbpxBalance,
      ];
}
