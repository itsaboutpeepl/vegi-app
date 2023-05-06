import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
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
    final bool hasSelectedSlot = store.state.cartState.selectedTimeSlot != null;

    return BillSummaryViewModel(
      hasDeliveryCharge: hasSelectedSlot && store.state.cartState.isDelivery,
      hasCollectionCharge:
          hasSelectedSlot && (!store.state.cartState.isDelivery),
      hasDiscount: store.state.cartState.discountCode.isNotEmpty,
      hasTip: store.state.cartState.selectedTipAmount != 0,
      deliveryCharge: hasSelectedSlot
          ? store.state.cartState.selectedTimeSlot!.priceModifier
              .formattedGBPxPrice
          : 0.formattedGBPxPrice,
      collectionCharge: hasSelectedSlot
          ? store.state.cartState.selectedTimeSlot!.priceModifier
              .formattedGBPxPrice
          : 0.formattedGBPxPrice,
      grandTotal: store.state.cartState.cartTotal.formattedGBPxPrice,
      itemTotal: store.state.cartState.cartSubTotal.formattedGBPxPrice,
      serviceCharge:
          store.state.cartState.restaurantPlatformFee.formattedGBPxPrice,
      discountAmount:
          store.state.cartState.cartDiscountComputed.formattedGBPxPrice,
      tipAmount: store.state.cartState.selectedTipAmount.formattedGBPxPrice,
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
  List<Object?> get props => [
        grandTotal,
        hasDeliveryCharge,
        hasCollectionCharge,
      ];
}
