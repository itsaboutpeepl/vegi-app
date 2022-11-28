import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/backupWalletAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/navDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/preparingOrderAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class VeganHomeScreen extends StatelessWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          drawer: NavDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (_, flag) =>
                [
                  const VeganSliverAppBar(),
                  const BackupWalletAppBar(),
                ] +
                viewmodel.listOfScheduledOrders
                    .map(
                      (e) => PreparingOrderAppBar(
                        orderDetails: e,
                      ),
                    )
                    .toList(),
            body: const FeaturedRestaurantList(),
          ),
        );
      },
    );
  }
}
