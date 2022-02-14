import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/addressCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/pickUpCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/deliveryAddressVM.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DeliveryAddressesVM>(
      distinct: true,
      builder: ((context, vm) {
        print("hello list  ${vm.listOfDeliveryAddresses}");
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            controller: widget.pageController,
            itemBuilder: (context, index) {
              return index == 0
                  ? PickUpCard()
                  : AddressCard(address: vm.listOfDeliveryAddresses[index - 1]);
            },
            itemCount: vm.listOfDeliveryAddresses.length + 1,
          ),
        );
      }),
      converter: DeliveryAddressesVM.fromStore,
    );
  }
}
