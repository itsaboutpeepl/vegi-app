import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/singleRestaurantItem.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class FeaturedRestaurantList extends StatelessWidget {
  const FeaturedRestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      onInit: (store) {
        store
          ..dispatch(startFetchTokensBalances())
          ..dispatch(startScheduleCheckCall())
          ..dispatch(fetchUserLocation())
          ..dispatch(startOngoingOrderCheck());
      },
      builder: (_, viewmodel) {
        final location = viewmodel.userLocationEnabled
            ? '${viewmodel.selectedSearchPostCode}'
            : 'your area (${viewmodel.selectedSearchPostCode})';
        final restaurants = viewmodel.filterRestaurantsQuery.isEmpty
            ? viewmodel.featuredRestaurants
            : viewmodel.filteredRestaurants;
        return viewmodel.isLoadingHomePage
            ? const Center(
                child: CircularProgressIndicator(color: themeShade400),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  RefreshIndicator(
                    child: restaurants.isEmpty
                        ? ListView(
                            children: [
                              EmptyStatePage(
                                emoji: noVendorsFoundCopyEmoji,
                                title: noVendorsFoundCopyTitle,
                                subtitle: noVendorsFoundCopyMessage(location),
                                refreshable: true,
                              ),
                            ],
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                              bottom: 50,
                            ),
                            itemCount: restaurants.length,
                            itemBuilder: (context, index) =>
                                SingleRestaurantItem(
                              vendorItem: restaurants[index],
                            ),
                            separatorBuilder: (_, __) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                            ),
                          ),
                    onRefresh: viewmodel.refreshFeaturedRestaurants,
                  ),
                  if (viewmodel.userIsVegiAdmin)
                    VegiPayBottomButton(
                      userInVendorMode: viewmodel.userInVendorMode,
                    ),
                ],
              );
      },
    );
  }
}

class VegiPayBottomButton extends StatelessWidget {
  const VegiPayBottomButton({
    Key? key,
    required this.userInVendorMode,
  }) : super(key: key);

  final bool userInVendorMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(
        bottom: 20,
        right: 20.0,
        left: 20.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: 60,
        child: GestureDetector(
          onTap: () => context.router.push(const ScanPaymentRecipientQR()),
          child: Card(
            color: themeShade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: themeShade900,
                width: 2,
              ),
            ),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  Labels.vegiPay(
                    vendorMode: userInVendorMode,
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
