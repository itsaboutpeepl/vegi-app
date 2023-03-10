import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class VendorHomeView extends StatelessWidget {
  const VendorHomeView({Key? key}) : super(key: key);

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
        return viewmodel.isLoadingHomePage
            ? const Center(
                child: CircularProgressIndicator(color: themeShade400),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        // updateRestaurantDetails(
                        //   restaurantItem: restaurantItem,
                        //   clearCart: false,
                        // );
                        // ! This should already set on cart state when we checked if the user was a vendor and set the vendor if it was.
                        final router = context.router;
                        context.router.push(
                          const RestaurantMenuScreen(),
                        );
                      },
                      child: Card(
                        shadowColor: themeAccent100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        color: themeShade1100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'New Customer',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        context.router.push(
                          //! TOFIX: THIS SCREEN NEEDS TO TAKE USER BASKET BUT ALLOW THEM TO PAY US
                          //! OR DOES USER JUST SEND AUTO...?
                          const ScanPaymentRecipientQR(),
                        );
                      },
                      child: Card(
                        shadowColor: themeAccent100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        color: themeShade1100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Take vegiPay',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
