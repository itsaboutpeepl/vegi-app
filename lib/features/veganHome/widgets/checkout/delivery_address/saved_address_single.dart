import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/editAddressView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';

class SingleSavedAddressItem extends StatelessWidget {
  const SingleSavedAddressItem({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressViewModel>(
      converter: DeliveryAddressViewModel.fromStore,
      builder: (context, viewmodel) {
        final address = viewmodel.savedAddresses[index];
        return ListTile(
          leading: Icon(address.label.icon),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          title: Text(address.label.name.capitalize()),
          onTap: () {
            viewmodel.setDeliveryAddress(id: address.internalID);
            context.router.pop();
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
              } else {
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
        );
      },
    );
  }
}
