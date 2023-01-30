import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/address_view.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/delivery_address_selector_button.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/saved_address_list.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class DeliveryAddressSelector extends StatelessWidget {
  const DeliveryAddressSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      child: DeliveryAddressSelectorButton(),
    );
  }
}

class DeliveryAddressModalSheet extends StatelessWidget {
  const DeliveryAddressModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select a delivery address',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
            leading: const Icon(
              Icons.add,
              color: themeShade400,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            title: const Text(
              'Add a new address',
              style: TextStyle(color: themeShade400),
            ),
            onTap: () {
              Analytics.track(
                eventName: AnalyticsEvents.addAddress,
              );
              showModalBottomSheet<Widget>(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (_) => const AddressView(),
              );
            },
          ),
          const Divider(
            height: 0,
            thickness: 1.5,
            color: themeShade400,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Saved Addresses',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Expanded(
            child: SavedAddressesView(),
          )
        ],
      ),
    );
  }
}
