import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/screens/checkout_screen_2.dart';
import 'package:vegan_liverpool/features/veganHome/screens/toteScreen.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/featuredRestaurantList.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/backupWalletAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/navDrawer.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/preparingOrderAppBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/veganSliverAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class VeganHomeScreen extends StatefulWidget {
  const VeganHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganHomeScreen> createState() => _VeganHomeScreenState();
}

class _VeganHomeScreenState extends State<VeganHomeScreen> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          drawer: NavDrawer(),
          // floatingActionButton: OpenContainer(
          //   transitionType: ContainerTransitionType.fadeThrough,
          //   transitionDuration: const Duration(milliseconds: 500),
          //   middleColor: themeShade100,
          //   closedElevation: 6,
          //   closedShape: const CircleBorder(),
          //   closedColor: themeShade400,
          //   openBuilder: (BuildContext context, VoidCallback _) {
          //     return const CheckoutScreenPt2();
          //   },
          //   closedBuilder: (BuildContext context, VoidCallback openContainer) {
          //     return Padding(
          //       padding: const EdgeInsets.all(15),
          //       child: Icon(
          //         Icons.shopping_basket,
          //         color: Colors.grey[800],
          //       ),
          //     );
          //   },
          // ),
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (_, flag) =>
                [
                  const VeganSliverAppBar(),
                  const BackupWalletAppBar(),
                ] +
                viewmodel.listOfOngoingOrders
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
