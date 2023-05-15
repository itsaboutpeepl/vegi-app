import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/restaurant/confirm_switch_restaurant_dialog.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class SingleRestaurantItem extends StatelessWidget {
  const SingleRestaurantItem({
    Key? key,
    required this.vendorItem,
  }) : super(key: key);

  final RestaurantItem vendorItem;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RestaurantItemViewModel>(
      converter: RestaurantItemViewModel.fromStore,
      builder: (_, viewmodel) {
        // final restaurantItem = viewmodel.selectedVendor ?? vendorItem;
        final restaurantItem = vendorItem;
        return Opacity(
          opacity: restaurantItem.status == 'active' ? 1.0 : 0.5,
          child: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      memCacheWidth: MediaQuery.of(context).size.width.toInt(),
                      imageUrl: restaurantItem.imageURL,
                      errorWidget: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  restaurantItem.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  restaurantItem.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    if (restaurantItem.minimumOrderAmount != 0)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 25,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              cFPriceNoDec(
                                restaurantItem.minimumOrderAmount,
                              ),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (restaurantItem.isVegan)
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          'assets/images/vegan-only-icon.png',
                          width: 25,
                        ),
                      )
                  ],
                )
              ],
            ),
            onTap: () {
              Analytics.track(
                eventName: AnalyticsEvents.viewRestaurant,
                properties: {'restaurantName': restaurantItem.name},
              );
              if (viewmodel.needsCartCheckPopup &&
                  viewmodel.restaurantID != restaurantItem.restaurantID) {
                showDialog<Widget>(
                  context: context,
                  builder: (_) => ConfirmSwitchRestaurant(
                    restaurantItem: restaurantItem,
                  ),
                );
              } else {
                viewmodel.updateRestaurantDetails(
                  restaurantItem: restaurantItem,
                  clearCart: false,
                );
                context.router.push(
                  const RestaurantMenuScreen(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
