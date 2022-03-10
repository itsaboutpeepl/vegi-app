import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/addressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/newAddressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/pickUpCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/deliveryAddressVM.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  late PageController _pageController =
      PageController(viewportFraction: 0.9, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressesVM>(
      distinct: true,
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
                      ? NewAddressCard() //Last index of the page builder, length of list + 1
                      : AddressCard(
                          address:
                              viewmodel.listOfDeliveryAddresses[index - 1]);
            },
            itemCount: viewmodel.listOfDeliveryAddresses.length + 2,
            onPageChanged: (index) {
              index == viewmodel.listOfDeliveryAddresses.length + 1
                  ? null //Index has 2 plus the length, Last index is the add card, so that shouldnt trigger the func.
                  : viewmodel.updateDeliveryAddressIndex(index);
            },
          ),
        );
      },
      converter: DeliveryAddressesVM.fromStore,
    );
  }
}
