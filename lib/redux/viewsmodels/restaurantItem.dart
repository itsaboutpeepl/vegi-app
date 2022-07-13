import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class RestaurantItemViewModel extends Equatable {
  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses? restaurantAddress;
  final Function(String, String, DeliveryAddresses, String, int, int, VoidCallback) updateRestaurantDetails;

  RestaurantItemViewModel({
    required this.updateRestaurantDetails,
    required this.restaurantID,
    required this.restaurantName,
    required this.restaurantAddress,
  });

  static RestaurantItemViewModel fromStore(Store<AppState> store) {
    return RestaurantItemViewModel(
      restaurantID: store.state.cartState.restaurantID,
      restaurantName: store.state.cartState.restaurantName,
      restaurantAddress: store.state.cartState.restaurantAddress,
      updateRestaurantDetails:
          (restaurantID, restaurantName, restaurantAddress, walletAddress, minimumOrder, platformFee, sendSnackBar) =>
              store.dispatch(
        setRestaurantDetails(
          restaurantID: restaurantID,
          restaurantName: restaurantName,
          restaurantAddress: restaurantAddress,
          walletAddress: walletAddress,
          minimumOrder: minimumOrder,
          platformFee: platformFee,
          sendSnackBar: sendSnackBar,
        ),
      ),
    );
  }

  @override
  List<Object> get props => [restaurantID];
}
