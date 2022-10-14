import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/features/account/screens/account_screen.dart';
import 'package:vegan_liverpool/features/account/screens/profile.dart';
import 'package:vegan_liverpool/features/account/screens/protect_your_wallet.dart';
import 'package:vegan_liverpool/features/topup/screens/topup.dart';

const accountTab = AutoRoute(
  path: 'account',
  name: 'accountTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      page: AccountScreen,
      name: 'accountScreen',
      initial: true,
      guards: [AuthGuard],
    ),
    // AutoRoute(
    //   page: SwitchCommunityScreen,
    //   guards: [AuthGuard],
    // ),
    AutoRoute(
      page: ProtectYourWallet,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ProfileScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: 'topUp',
      page: TopupScreen,
      guards: [AuthGuard],
    ),
  ],
);
