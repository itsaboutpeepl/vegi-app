import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart' as cartActions;
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class DeliveryAddressViewModel extends Equatable {
  const DeliveryAddressViewModel({
    required this.savedAddresses,
    required this.removeAddress,
    required this.addAddress,
    required this.setDeliveryAddress,
    required this.editAddress,
    required this.isDelivery,
    required this.useLiveLocation,
    required this.selectedAddress,
    required this.restaurantAddress,
    required this.restaurantName,
    required this.setDelivery,
    required this.fulfilmentPostalDistricts,
  });

  factory DeliveryAddressViewModel.fromStore(Store<AppState> store) {
    return DeliveryAddressViewModel(
      savedAddresses: store.state.userState.listOfDeliveryAddresses,
      isDelivery: store.state.cartState.isDelivery,
      useLiveLocation: store.state.userState.useLiveLocation,
      selectedAddress: store.state.cartState.selectedDeliveryAddress,
      restaurantAddress: store.state.cartState.restaurantAddress,
      restaurantName: store.state.cartState.restaurantName,
      fulfilmentPostalDistricts:
          store.state.cartState.fulfilmentPostalDistricts,
      removeAddress: ({
        required int id,
      }) {
        store.dispatch(removeDeliveryAddress(addressId: id));
      },
      addAddress: ({
        required DeliveryAddresses newAddress,
      }) {
        store.dispatch(addDeliveryAddress(newAddress: newAddress));
      },
      setDeliveryAddress: ({
        required int id,
      }) {
        store.dispatch(cartActions.setDeliveryAddress(id: id));
      },
      editAddress: ({
        required DeliveryAddresses newAddress,
        required int oldId,
      }) {
        store.dispatch(
          updateDeliveryAddress(oldId: oldId, newAddress: newAddress),
        );
      },
      setDelivery: ({required bool isDelivery}) {
        store
          ..dispatch(cartActions.SetIsDelivery(isDelivery: isDelivery))
          ..dispatch(cartActions.computeCartTotals());
      },
    );
  }

  final List<DeliveryAddresses> savedAddresses;
  final void Function({
    required int id,
  }) removeAddress;
  final void Function({
    required DeliveryAddresses newAddress,
  }) addAddress;
  final void Function({
    required int oldId,
    required DeliveryAddresses newAddress,
  }) editAddress;
  final void Function({
    required int id,
  }) setDeliveryAddress;
  final bool isDelivery;
  final bool useLiveLocation;
  final DeliveryAddresses? selectedAddress;
  final DeliveryAddresses? restaurantAddress;
  final String restaurantName;
  final void Function({required bool isDelivery}) setDelivery;
  final List<String> fulfilmentPostalDistricts;

  @override
  List<Object?> get props => [
        savedAddresses,
        isDelivery,
        fulfilmentPostalDistricts,
        useLiveLocation,
      ];
}
