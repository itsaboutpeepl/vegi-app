import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/address_view.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class SingleSavedAddressItem extends StatelessWidget {
  const SingleSavedAddressItem({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressViewModel>(
      converter: DeliveryAddressViewModel.fromStore,
      builder: (context, viewmodel) {
        final DeliveryAddresses address = viewmodel.savedAddresses[index];
        final isValidPostCodeForDelivery =
            address.deliversTo(viewmodel.fulfilmentPostalDistricts);
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isValidPostCodeForDelivery)
                const Text(
                  'Delivers to',
                  style: TextStyle(color: themeShade400),
                )
              else
                const Text(
                  'Does not deliver to',
                  style: TextStyle(color: Colors.red),
                ),
              Opacity(
                opacity: isValidPostCodeForDelivery ? 1.0 : 0.5,
                child: ListTile(
                  leading: Icon(address.label.icon),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  title: Text(address.label.name.capitalize()),
                  onTap: () {
                    if (!isValidPostCodeForDelivery) return;
                    viewmodel.setDeliveryAddress(id: address.internalID);
                    context.router.pop();
                    Analytics.track(
                      eventName: AnalyticsEvents.selectAddress,
                    );
                  },
                  subtitle: Text(address.longAddress),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) {
                      if (value == 'Edit') {
                        showModalBottomSheet<Widget>(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (_) => AddressView(
                            existingAddress: address,
                          ),
                        );
                        Analytics.track(
                          eventName: AnalyticsEvents.editAddress,
                        );
                      } else {
                        Analytics.track(
                          eventName: AnalyticsEvents.deleteAddress,
                        );
                        viewmodel.removeAddress(id: address.internalID);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Edit', 'Delete'}.map(
                        (String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
