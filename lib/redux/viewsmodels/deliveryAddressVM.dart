import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class DeliveryAddressesVM extends Equatable {
  final List<DeliveryAddresses> listOfDeliveryAddresses;
  final Function(DeliveryAddresses newAddress) addDeliveryAddress;

  DeliveryAddressesVM({
    required this.listOfDeliveryAddresses,
    required this.addDeliveryAddress,
  });

  static DeliveryAddressesVM fromStore(Store<AppState> store) {
    return DeliveryAddressesVM(
        listOfDeliveryAddresses: store.state.userState.listOfDeliveryAddresses,
        addDeliveryAddress: (newAddress) {
          store.dispatch(addNewDeliveryAddress(newAddress));
        });
  }

  @override
  List<Object> get props => [
        listOfDeliveryAddresses,
      ];
}
