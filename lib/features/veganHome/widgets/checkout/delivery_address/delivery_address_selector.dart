import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/editAddressView.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/saved_address_list.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';

class DeliveryAddressSelector extends StatelessWidget {
  const DeliveryAddressSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 100,
      child: InkWell(
        highlightColor: themeShade200,
        splashColor: themeShade200,
        onTap: () => showModalBottomSheet<Widget>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (_) => const DeliveryAddressModalSheet(),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: themeShade300,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
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
              child: StoreConnector<AppState, DeliveryAddressViewModel>(
                converter: DeliveryAddressViewModel.fromStore,
                builder: (context, viewmodel) {
                  return Row(
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
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
            onTap: () => showModalBottomSheet<Widget>(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (_) => const AddressView(),
            ),
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
