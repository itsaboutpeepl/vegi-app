import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'dart:math' as Math;
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
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

  final List<Order> listOfScheduledOrders;
  final List<Order> listOfOngoingOrders;
  final bool hasOngoingOrder;
  final bool globalSearchIsVisible;
  final bool isVendor;

  Order? get scheduledOrderToShow => listOfScheduledOrders.sortInline((a, b) {
        final timeComp =
            a.timeSlot.startTime.compareTo(b.timeSlot.startTime);
        if (timeComp == 0) {
          return a.orderID.compareTo(b.orderID);
        } else {
          return timeComp;
        }
      }).sublist(
        0,
        Math.min(
          1,
          listOfScheduledOrders.length,
        ),
      ).firstOrNull;

  @override
  List<Object?> get props => [
        listOfScheduledOrders,
        listOfOngoingOrders,
        hasOngoingOrder,
        globalSearchIsVisible,
        isVendor,
        scheduledOrderToShow?.paymentStatusLabel,
        scheduledOrderToShow?.orderID,
        scheduledOrderToShow?.GBPxAmountPaid,
      ];
}
