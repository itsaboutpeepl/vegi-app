import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';

class PastOrdersViewmodel extends Equatable {
  const PastOrdersViewmodel({
    required this.listOfScheduledOrders,
    required this.listOfOngoingOrders,
    required this.hasOngoingOrder,
    required this.globalSearchIsVisible,
    required this.isVendor,
  });

  factory PastOrdersViewmodel.fromStore(Store<AppState> store) {
    return PastOrdersViewmodel(
      listOfScheduledOrders: store.state.pastOrderState.listOfScheduledOrders,
      listOfOngoingOrders: store.state.pastOrderState.listOfOngoingOrders,
      hasOngoingOrder:
          store.state.pastOrderState.listOfOngoingOrders.isNotEmpty,
      globalSearchIsVisible: store.state.homePageState.showGlobalSearchBarField,
      isVendor: store.state.userState.isVendor,
    );
  }

  final List<OrderDetails> listOfScheduledOrders;
  final List<OrderDetails> listOfOngoingOrders;
  final bool hasOngoingOrder;
  final bool globalSearchIsVisible;
  final bool isVendor;

  @override
  List<Object> get props => [
        listOfScheduledOrders,
        listOfOngoingOrders,
        hasOngoingOrder,
        globalSearchIsVisible,
        isVendor,
      ];
}
