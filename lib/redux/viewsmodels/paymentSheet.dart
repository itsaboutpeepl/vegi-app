import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/live_payment.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class PeeplPaySheetViewModel extends Equatable {
  const PeeplPaySheetViewModel({
    required this.startPaymentProcess,
    required this.selectedGBPxAmount,
    required this.selectedPPLAmount,
    required this.updateSelectedValues,
    required this.transferringTokens,
    required this.errorCompletingPayment,
    required this.confirmedPayment,
    required this.restaurantName,
    required this.cartTotal,
    required this.orderCreationProcessStatus,
    required this.stripePaymentStatus,
    required this.processingPayment,
  });

  factory PeeplPaySheetViewModel.fromStore(Store<AppState> store) {
    return PeeplPaySheetViewModel(
      cartTotal: store.state.cartState.cartTotal,
      selectedGBPxAmount: store.state.cartState.selectedGBPxAmount,
      selectedPPLAmount: store.state.cartState.selectedPPLAmount,
      transferringTokens: store.state.cartState.transferringTokens,
      errorCompletingPayment: store.state.cartState.errorCompletingPayment,
      confirmedPayment: store.state.cartState.confirmedPayment,
      restaurantName: store.state.cartState.restaurantName,
      updateSelectedValues: (gbpxAmount, pplAmount) {
        store.dispatch(
          UpdateSelectedAmounts(
            gbpxAmount: gbpxAmount,
            pplAmount: pplAmount,
          ),
        );
      },
      orderCreationProcessStatus:
          store.state.cartState.orderCreationProcessStatus,
      stripePaymentStatus: store.state.cartState.stripePaymentStatus,
      startPaymentProcess: () {
        store.dispatch(startPeeplPayProcess());
      },
      processingPayment: store.state.cartState.paymentInProcess,
    );
  }
  final double selectedGBPxAmount;
  final double selectedPPLAmount;
  final Money cartTotal;
  final bool transferringTokens;
  final bool errorCompletingPayment;
  final bool confirmedPayment;
  final String restaurantName;
  final void Function(double gbpxAmount, double pplAmount) updateSelectedValues;
  final void Function() startPaymentProcess;
  final OrderCreationProcessStatus orderCreationProcessStatus;
  final StripePaymentStatus stripePaymentStatus;
  final LivePayment? processingPayment;

  @override
  List<Object> get props => [
        selectedGBPxAmount,
        selectedPPLAmount,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
        orderCreationProcessStatus,
        stripePaymentStatus,
        processingPayment?.amount ?? 0,
        processingPayment?.status ?? PaymentProcessingStatus.none,
      ];
}
