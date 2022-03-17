import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';

class PickUpCardViewModel extends Equatable {
  final String restaurantName;
  final DeliveryAddresses deliveryAddress;

  PickUpCardViewModel({
    required this.restaurantName,
    required this.deliveryAddress,
  });

  static PickUpCardViewModel fromStore(Store<AppState> store) {
    return PickUpCardViewModel(
      restaurantName: store.state.cartState.restaurantName,
      deliveryAddress: store.state.cartState.restaurantAddress,
    );
  }

  @override
  List<Object> get props => [
        restaurantName,
      ];
}
