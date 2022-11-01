import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class BillSummaryViewModel extends Equatable {
  const BillSummaryViewModel({
    required this.hasDiscount,
    required this.hasDeliveryCharge,
    required this.hasCollectionCharge,
    required this.hasTip,
    required this.itemTotal,
    required this.deliveryCharge,
    required this.serviceCharge,
    required this.grandTotal,
    required this.discountAmount,
    required this.tipAmount,
    required this.collectionCharge,
  });

  factory BillSummaryViewModel.fromStore(Store<AppState> store) {
    return BillSummaryViewModel(
      hasDeliveryCharge: store.state.cartState.deliveryCharge != 0 &&
          store.state.cartState.isDelivery,
      hasCollectionCharge: store.state.cartState.collectionCharge != 0 &&
          (!store.state.cartState.isDelivery),
      hasDiscount: store.state.cartState.discountCode.isNotEmpty,
      hasTip: store.state.cartState.selectedTipAmount != 0,
      deliveryCharge: store.state.cartState.deliveryCharge.formattedPrice,
      collectionCharge: store.state.cartState.collectionCharge.formattedPrice,
      grandTotal: store.state.cartState.cartTotal.formattedPrice,
      itemTotal: store.state.cartState.cartSubTotal.formattedPrice,
      serviceCharge: store.state.cartState.restaurantPlatformFee.formattedPrice,
      discountAmount: store.state.cartState.cartDiscountComputed.formattedPrice,
      tipAmount: store.state.cartState.selectedTipAmount.formattedPrice,
    );
  }

  final bool hasDiscount;
  final bool hasDeliveryCharge;
  final bool hasCollectionCharge;
  final String collectionCharge;
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
