import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class DeliveryAddressesVM extends Equatable {
  final bool isDelivery;
  final List<DeliveryAddresses> listOfDeliveryAddresses;
  final DeliveryAddresses? selectedDeliveryAddress;
  final Function(DeliveryAddresses? selectedAddress) updateSelectedDeliveryAddress;
  final Function(DeliveryAddresses newAddress) addDeliveryAddress;
  final Function(DeliveryAddresses addressToBeDeleted) deleteDeliveryAddress;
  final Function(FulfilmentMethod fulfilmentMethod) updateFulfilmentMethod;

  DeliveryAddressesVM({
    required this.isDelivery,
    required this.listOfDeliveryAddresses,
    required this.selectedDeliveryAddress,
    required this.addDeliveryAddress,
    required this.updateSelectedDeliveryAddress,
    required this.deleteDeliveryAddress,
    required this.updateFulfilmentMethod,
  });

  static DeliveryAddressesVM fromStore(Store<AppState> store) {
    return DeliveryAddressesVM(
      isDelivery: store.state.cartState.isDelivery,
      listOfDeliveryAddresses: store.state.userState.listOfDeliveryAddresses,
      selectedDeliveryAddress: store.state.cartState.selectedDeliveryAddress,
      addDeliveryAddress: (newAddress) {
        store.dispatch(addNewDeliveryAddress(newAddress));
      },
      updateSelectedDeliveryAddress: (selectedAddress) {
        store.dispatch(UpdateSelectedDeliveryAddress(selectedAddress));
      },
      deleteDeliveryAddress: (addressToBeDeleted) {
        store.dispatch(deleteExistingDeliveryAddress(addressToBeDeleted));
      },
      updateFulfilmentMethod: (fulfilmentMethod) {
        store.dispatch(SetFulfilmentMethod(fulfilmentMethod));
      },
    );
  }

  @override
  List<Object?> get props => [
        isDelivery,
        listOfDeliveryAddresses,
        selectedDeliveryAddress,
      ];
}
