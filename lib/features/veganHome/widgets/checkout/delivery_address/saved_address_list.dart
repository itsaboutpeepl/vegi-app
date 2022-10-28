import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/delivery_address/saved_address_single.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/delivery_address_vm.dart';

class SavedAddressesView extends StatelessWidget {
  const SavedAddressesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressViewModel>(
      converter: DeliveryAddressViewModel.fromStore,
      builder: (context, viewmodel) {
        return ListView.separated(
          itemCount: viewmodel.savedAddresses.length,
          itemBuilder: (_, index) => SingleSavedAddressItem(
            index: index,
          ),
          separatorBuilder: (_, index) => const Divider(
            thickness: 1,
            color: themeShade300,
          ),
        );
      },
    );
  }
}
