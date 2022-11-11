import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/checkout_app_bar_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CheckoutAppBarViewModel>(
      converter: CheckoutAppBarViewModel.fromStore,
      builder: (_, viewmodel) {
        return SliverAppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          pinned: true,
          centerTitle: false,
          title: Text(viewmodel.restaurantName),
          titleSpacing: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  Analytics.track(
                    eventName: AnalyticsEvents.clearCart,
                  );
                  viewmodel.clearCart();
                  context.router.navigate(const VeganHomeScreenAlt());
                },
                icon: const ImageIcon(
                  AssetImage('assets/images/clear-shopping-tote.png'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
