import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class DeliveryAddressesVM extends Equatable {
  final List<DeliveryAddresses> listOfDeliveryAddresses;
  final int selectedDeliveryAddressIndex;
  final Function(int indexOfAddress) updateDeliveryAddressIndex;
  final Function(DeliveryAddresses newAddress) addDeliveryAddress;

  DeliveryAddressesVM({
    required this.listOfDeliveryAddresses,
    required this.selectedDeliveryAddressIndex,
    required this.addDeliveryAddress,
    required this.updateDeliveryAddressIndex,
  });

  static DeliveryAddressesVM fromStore(Store<AppState> store) {
    return DeliveryAddressesVM(
      listOfDeliveryAddresses: store.state.userState.listOfDeliveryAddresses,
      selectedDeliveryAddressIndex:
          store.state.cartState.selectedDeliveryAddressIndex,
      addDeliveryAddress: (newAddress) {
        //TODO: Fix
        //store.dispatch(addNewDeliveryAddress(newAddress));
      },
      updateDeliveryAddressIndex: (indexOfAddress) {
        store.dispatch(UpdateDeliveryAddressIndex(indexOfAddress));
      },
    );
  }

  @override
  List<Object> get props => [
        listOfDeliveryAddresses,
        selectedDeliveryAddressIndex,
      ];
}
