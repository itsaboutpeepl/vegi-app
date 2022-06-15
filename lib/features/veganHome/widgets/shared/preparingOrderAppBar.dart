import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/pastOrders.dart';

class PreparingOrderAppBar extends StatelessWidget {
  const PreparingOrderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PastOrdersViewmodel>(
      converter: PastOrdersViewmodel.fromStore,
      builder: (_, viewmodel) {
        return viewmodel.hasOngoingOrder
            ? SliverAppBar(
                toolbarHeight: 30,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                floating: false,
                pinned: false,
                snap: false,
                centerTitle: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.01,
                flexibleSpace: FlexibleSpaceBar(
                  title: GestureDetector(
                    onTap: () => context.router.push(PreparingOrderPage(orderDetails: viewmodel.ongoingOrderDetails!)),
                    child: Card(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "${viewmodel.ongoingOrderDetails!.restaurantName} is preparing your order",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      color: themeShade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: themeShade900,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                ),
              )
            : SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
