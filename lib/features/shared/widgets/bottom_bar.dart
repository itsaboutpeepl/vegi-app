import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/motionTabBar.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';

class BottomBar extends StatelessWidget {
  late final TabsRouter tabsRouter;

  BottomBar(
    this.tabsRouter,
  );

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      distinct: true,
      converter: (store) {},
      onInit: (store) {
        // store.dispatch(fetchSwapList());
        store.dispatch(startFetchingCall());
        store.dispatch(startFetchTokensBalances());
        store.dispatch(updateTokensPrices());
      },
      builder: (_, vm) => MotionTabBar(
        tabIconColor: flexColorSchemeLight.primary!,
        textStyle: TextStyle(color: flexColorSchemeLight.primary),
        tabSelectedColor: flexColorSchemeLight.primary!,
        initialSelectedTab: I10n.of(context).home,
        onTabItemSelected: (int activeIndex) {
          if (activeIndex == tabsRouter.activeIndex) {
            context.router.popTop();
          } else {
            tabsRouter.setActiveIndex(activeIndex);
          }
        },
        labels: [
          I10n.of(context).home,
          "News",
          "Wallet",
          I10n.of(context).account,
        ],
        icons: [
          Icons.home,
          Icons.article,
          Icons.account_balance_wallet,
          Icons.person_outline,
        ],
      ),
    );
  }
}
