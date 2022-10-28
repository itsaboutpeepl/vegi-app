import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class BillSummaryViewModel extends Equatable {
  const BillSummaryViewModel({
    required this.hasDiscount,
    required this.hasDeliveryCharge,
    required this.hasTip,
    required this.itemTotal,
    required this.deliveryCharge,
    required this.serviceCharge,
    required this.grandTotal,
    required this.discountAmount,
    required this.tipAmount,
  });

  factory BillSummaryViewModel.fromStore(Store<AppState> store) {
    return BillSummaryViewModel(
      hasDeliveryCharge: store.state.cartState.deliveryCharge != 0,
      hasDiscount: store.state.cartState.discountCode.isNotEmpty,
      hasTip: store.state.cartState.selectedTipAmount != 0,
      deliveryCharge: store.state.cartState.deliveryCharge.formattedPrice,
      grandTotal: store.state.cartState.cartTotal.formattedPrice,
      itemTotal: store.state.cartState.cartSubTotal.formattedPrice,
      serviceCharge: store.state.cartState.restaurantPlatformFee.formattedPrice,
      discountAmount: store.state.cartState.cartDiscountComputed.formattedPrice,
      tipAmount: store.state.cartState.selectedTipAmount.formattedPrice,
    );
  }

  final bool hasDiscount;
  final bool hasDeliveryCharge;
  final bool hasTip;
  final String itemTotal;
  final String deliveryCharge;
  final String serviceCharge;
  final String grandTotal;
  final String discountAmount;
  final String tipAmount;

  @override
  List<Object?> get props => [grandTotal];
}