import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
            : restaurants.isEmpty
                ? EmptyStatePage(
                    emoji: noVendorsFoundCopyEmoji,
                    title: noVendorsFoundCopyTitle,
                    subtitle: noVendorsFoundCopyMessage(location),
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
                    itemBuilder: (context, index) => SingleRestaurantItem(
                      vendorItem: restaurants[index],
                    ),
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  );
      },
    );
  }
}
