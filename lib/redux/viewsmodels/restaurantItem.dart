import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class RestaurantItemViewModel extends Equatable {
  const RestaurantItemViewModel({
    required this.updateRestaurantDetails,
    required this.restaurantID,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.needsCartCheckPopup,
  });

  factory RestaurantItemViewModel.fromStore(Store<AppState> store) {
    return RestaurantItemViewModel(
      needsCartCheckPopup: store.state.cartState.cartItems.isNotEmpty,
      restaurantID: store.state.cartState.restaurantID,
      restaurantName: store.state.cartState.restaurantName,
      restaurantAddress: store.state.cartState.restaurantAddress,
      updateRestaurantDetails: ({required RestaurantItem restaurantItem}) =>
          store.dispatch(
        setRestaurantDetails(
          restaurantID: restaurantItem.restaurantID,
          restaurantName: restaurantItem.name,
          restaurantAddress: restaurantItem.address,
          walletAddress: restaurantItem.walletAddress,
          minimumOrder: restaurantItem.minimumOrderAmount,
          platformFee: restaurantItem.platformFee,
          fulfilmentPostalDistricts: restaurantItem.deliveryRestrictionDetails,
        ),
      ),
    );
  }

  final String restaurantID;
  final String restaurantName;
  final DeliveryAddresses? restaurantAddress;
  final bool needsCartCheckPopup;
  final void Function({required RestaurantItem restaurantItem})
      updateRestaurantDetails;

  @override
  List<Object> get props => [restaurantID];
}
