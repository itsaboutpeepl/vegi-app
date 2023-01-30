import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/delivery_address_selector.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class DeliveryAddressSelectorButton extends StatelessWidget {
  const DeliveryAddressSelectorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return StoreConnector<AppState, DeliveryAddressViewModel>(
      converter: DeliveryAddressViewModel.fromStore,
      builder: (context, viewmodel) {
        return InkWell(
          highlightColor: themeShade200,
          splashColor: themeShade200,
          onTap: () {
            if (viewmodel.isDelivery) {
              Analytics.track(
                eventName: AnalyticsEvents.changeAddress,
              );
              showModalBottomSheet<Widget>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (_) => const DeliveryAddressModalSheet(),
              );
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: themeShade300,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(0, -2),
                  blurRadius: 5,
                )
              ],
            ),
            child: SizedBox(
              width: width,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.place,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: viewmodel.isDelivery
                          ? [
                              Text(
                                viewmodel.selectedAddress == null
                                    ? 'Please select an address'
                                    : 'Delivery at '
                                        '${viewmodel.selectedAddress!.label.name.capitalize()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (viewmodel.selectedAddress != null)
                                Text(
                                  viewmodel.selectedAddress!.shortAddress,
                                ),
                            ]
                          : [
                              Text(
                                'Collecting from ${viewmodel.restaurantName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (viewmodel.restaurantAddress != null)
                                Text(
                                  viewmodel.restaurantAddress!.shortAddress,
                                ),
                            ],
                    ),
                    const Spacer(),
                    if (viewmodel.isDelivery)
                      const Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
