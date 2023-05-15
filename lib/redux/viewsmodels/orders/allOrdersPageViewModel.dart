import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/order.dart';
import 'package:vegan_liverpool/models/restaurant/orderDetails.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class AllOrdersPageViewModel extends Equatable {
  const AllOrdersPageViewModel({
    required this.lastRefreshTime,
    required this.pastOrders,
    required this.allUnpaidOrders,
    required this.ongoingOrders,
    required this.scheduledOrders,
    // required this.failedPayments,
    required this.refreshOrders,
  });

  factory AllOrdersPageViewModel.fromStore(Store<AppState> store) {
    return AllOrdersPageViewModel(
      lastRefreshTime: store.state.pastOrderState.lastRefreshTime,
      ongoingOrders: store.state.pastOrderState.listOfOngoingOrders,
      scheduledOrders: store.state.pastOrderState.listOfScheduledOrders,
      pastOrders: store.state.pastOrderState.allPastOrders,
      allUnpaidOrders: store.state.pastOrderState.allUnpaidOrders,

      // fetchTransactionsForWallet: () {
      //   store.dispatch(
      //     UpdateTransactionHistory(

      //     ),
      //   );
      // },
      refreshOrders: (
        void Function() successHandler,
        void Function(String, FetchOrdersVegiResponseEnum) errorHandler,
      ) {
        store.dispatch(
          fetchAllOrdersForWallet(
            store.state.userState.walletAddress,
            successHandler,
            errorHandler,
          ),
        );
      },
    );
  }

  final DateTime lastRefreshTime;
  final List<Order> pastOrders;
  final List<Order> allUnpaidOrders;
  final List<Order> ongoingOrders;
  final List<Order> scheduledOrders;

  List<Order> get allOrders => scheduledOrders
    ..addAll(ongoingOrders)
    ..addAll(allUnpaidOrders)
    ..addAll(pastOrders);

  final void Function(
    void Function() successHandler,
    void Function(String, FetchOrdersVegiResponseEnum) errorHandler,
  ) refreshOrders;

  Order get latestPastOrder => pastOrders
      .sortInline(
        (a, b) => a.fulfilmentSlotFrom.compareTo(b.fulfilmentSlotFrom),
      )
      .reversed
      .first;

  @override
  List<Object?> get props => [
        lastRefreshTime,
        allOrders.map((e) => e.id).join(';'),
      ];
}
