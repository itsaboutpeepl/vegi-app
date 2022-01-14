// import 'package:equatable/equatable.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/models/plugins/plugins.dart';
// import 'package:redux/redux.dart';
// import 'package:vegan_liverpool/models/community/community.dart';
// import 'package:vegan_liverpool/redux/actions/user_actions.dart';
// import 'package:vegan_liverpool/utils/addresses.dart' as util;

import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/cash_wallet_state.dart';
import 'package:vegan_liverpool/models/community/community.dart';
import 'package:vegan_liverpool/models/plugins/plugins.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import '../../models/app_state.dart';
import 'package:equatable/equatable.dart';

class DrawerViewModel {
  final Function() logout;
  // final String walletAddress;
  // final String? avatarUrl;
  // final bool? isBackup;

  final Function() firstName;
  final pplBalance;
  final gbpxBalance;
  final avatarUrl;

  DrawerViewModel({
    // this.avatarUrl,
    required this.firstName,
    required this.logout,
    required this.pplBalance,
    required this.gbpxBalance,
    required this.avatarUrl,
    // this.isBackup,
    // required this.walletAddress,
  });

  static DrawerViewModel fromStore(Store<AppState> store) {
    CashWalletState cashWalletState = store.state.cashWalletState;

    return DrawerViewModel(
      // isBackup: store.state.userState.backup,
      // walletAddress: store.state.userState.walletAddress,
      // avatarUrl: store.state.userState.avatarUrl,
      logout: () {
        store.dispatch(logoutCall());
      },
      avatarUrl: store.state.userState.avatarUrl,
      firstName: () {
        String fullName = store.state.userState.displayName;
        return fullName.split(' ')[0];
      },
      pplBalance: cashWalletState.tokens[PeeplToken.address]!.getBalance(),
      gbpxBalance: cashWalletState.tokens[GBPxToken.address]!.getBalance(),
    );
  }

  // @override
  // List get props => [
  //       walletAddress,
  //     ];
}

// class DrawerViewModel extends Equatable {
//   final Function() logout;
//   final String walletAddress;
//   final String avatarUrl;
//   final bool isBackup;
//   final Plugins plugins;
//   final Function() firstName;
//   final bool isFuseDollarCommunity;

//   DrawerViewModel({
//     this.logout,
//     this.plugins,
//     this.isBackup,
//     this.walletAddress,
//     this.avatarUrl,
//     this.firstName,
//     this.isFuseDollarCommunity,
//   });

//   static DrawerViewModel fromStore(Store<AppState> store) {
//     String communityAddress = store.state.cashWalletState.communityAddress;
//     Community community =
//         store.state.cashWalletState.communities[communityAddress]!;
//     return DrawerViewModel(
//       isBackup: store.state.userState.backup,
//       walletAddress: store.state.userState.walletAddress,
//       plugins: community.plugins ?? Plugins(),
//       avatarUrl: store.state.userState.avatarUrl,
//       isFuseDollarCommunity: util.isFuseDollarCommunity(communityAddress),
//       logout: () {
//         store.dispatch(logoutCall());
//       },
//       firstName: () {
//         String fullName = store.state.userState.displayName ?? '';
//         return fullName.split(' ')[0];
//       },
//     );
//   }

//   @override
//   List get props => [
//         walletAddress,
//         plugins,
//         isFuseDollarCommunity,
//       ];
// }
