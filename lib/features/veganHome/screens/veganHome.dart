import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/VendorHomeView.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/backupWalletAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/navDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/preparingOrderAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/searchVendorsAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class VeganHomeScreen extends StatelessWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      onInit: (store) async {
        store.dispatch(isUserWalletAddressAVendorAddress());
      },
      builder: (_, viewmodel) {
        return Scaffold(
          drawer: NavDrawer(),
          body: NestedScrollView(
            headerSliverBuilder: (_, flag) =>
                [
                  const VeganSliverAppBar(),
                  const BackupWalletAppBar(),
                  if (viewmodel.globalSearchIsVisible && !viewmodel.isVendor)
                    const SearchVendorsAppBar(),
                ] +
                (viewmodel.isVendor
                    ? []
                    : viewmodel.listOfScheduledOrders
                        .map(
                          (e) => PreparingOrderAppBar(
                            order: e,
                          ),
                        )
                        .toList()
                        .sortInline((a, b) {
                        final timeComp = a.order.timeSlot.startTime
                            .compareTo(b.order.timeSlot.startTime);
                        if (timeComp == 0) {
                          return a.order.orderID.compareTo(b.order.orderID);
                        } else {
                          return timeComp;
                        }
                      }).sublist(
                        0,
                        Math.min(
                          1,
                          viewmodel.listOfScheduledOrders.length,
                        ),
                      )),
            body: viewmodel.isVendor
                ? const VendorHomeView() // todo: Make this screen into 2 tiles... -> take payment and new customer
                : const FeaturedRestaurantList(),
          ),
        );
      },
    );
  }
}
