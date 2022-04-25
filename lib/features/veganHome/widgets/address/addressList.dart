import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/addressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/newAddressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/pickUpCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/deliveryAddressVM.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  late PageController _pageController = PageController(viewportFraction: 0.9, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressesVM>(
      distinct: true,
      onInit: (store) {
        if (store.state.userState.listOfDeliveryAddresses.isEmpty) {
          store.dispatch(UpdateSelectedDeliveryAddress(null));
        } else {
          store.dispatch(UpdateSelectedDeliveryAddress(store.state.userState.listOfDeliveryAddresses[0]));
        }
        store.dispatch(SetFulfilmentMethod(FulfilmentMethod.delivery));
      },
      builder: (context, viewmodel) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return index == 0
                  ? PickUpCard() //Index zero of the page builder
                  : index == viewmodel.listOfDeliveryAddresses.length + 1
                      ? NewAddressCard() //Last index of the page builder, length of list + 1 (which is the pickup card)
                      : AddressCard(address: viewmodel.listOfDeliveryAddresses[index - 1]);
            },
            itemCount: viewmodel.listOfDeliveryAddresses.length + 2,
            onPageChanged: (index) {
              if (index == 0) {
                viewmodel.updateFulfilmentMethod(FulfilmentMethod.collection);
              } else if (index == viewmodel.listOfDeliveryAddresses.length + 1) {
                viewmodel.updateSelectedDeliveryAddress(null);
                viewmodel.updateFulfilmentMethod(FulfilmentMethod.none);
              } else {
                viewmodel.updateFulfilmentMethod(FulfilmentMethod.delivery);
                viewmodel.updateSelectedDeliveryAddress(viewmodel.listOfDeliveryAddresses[index - 1]);
              }
            },
          ),
        );
      },
      converter: DeliveryAddressesVM.fromStore,
    );
  }
}
