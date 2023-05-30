import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';

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
      hasTip: store.state.cartState.selectedTipAmount != 0,
      deliveryCharge: hasSelectedSlot
          ? store.state.cartState.selectedTimeSlot!.priceModifier
              .formattedGBPxPrice
          : 0.formattedGBPxPrice,
      collectionCharge: hasSelectedSlot
          ? store.state.cartState.selectedTimeSlot!.priceModifier
              .formattedGBPxPrice
          : 0.formattedGBPxPrice,
      grandTotal: store.state.cartState.cartTotal,
      itemTotal: store.state.cartState.cartSubTotal,
      serviceCharge: store.state.cartState.restaurantPlatformFee,
      hasDiscount: store.state.cartState.discountCode.isNotEmpty ||
          store.state.cartState.voucherPotValue.value > 0,
      discountAmount: store.state.cartState.cartDiscountComputed,
      tipAmount: store.state.cartState.selectedTipAmount,
    );
  }

  final bool hasDiscount;
  final bool hasDeliveryCharge;
  final bool hasCollectionCharge;
  final String collectionCharge;
  final String deliveryCharge;
  final bool hasTip;
  final Money itemTotal;
  final Money serviceCharge;
  final Money grandTotal;
  final Money discountAmount;
  final Money tipAmount;

  @override
  List<Object?> get props => [
        grandTotal,
        hasDeliveryCharge,
        hasCollectionCharge,
      ];
}
