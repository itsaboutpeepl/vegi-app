import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/payment_methods.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class PaymentMethodViewModel extends Equatable {
  const PaymentMethodViewModel({
    required this.selectedPaymentMethod,
    required this.pplBalance,
    required this.hasPplBalance,
    required this.setPaymentMethod,
    required this.cartTotal,
    required this.startPaymentProcess,
    required this.isLoading,
  });

  factory PaymentMethodViewModel.fromStore(Store<AppState> store) {
    final pplBalance =
        store.state.cashWalletState.tokens[pplToken.address]!.getAmount();

    return PaymentMethodViewModel(
      selectedPaymentMethod:
          store.state.cartState.selectedPaymentMethod ?? PaymentMethod.stripe,
      pplBalance: '£${getPoundValueFromPPL(pplBalance)}',
      isLoading: store.state.cartState.payButtonLoading,
      hasPplBalance: pplBalance > 0,
      cartTotal: store.state.cartState.cartTotal.formattedPrice,
      startPaymentProcess: ({required context}) =>
          store.dispatch(startOrderCreationProcess(context: context)),
      setPaymentMethod: ({required PaymentMethod paymentMethod}) {
        store.dispatch(SetPaymentMethod(paymentMethod));
      },
    );
  }

  final PaymentMethod selectedPaymentMethod;
  final String pplBalance;
  final bool hasPplBalance;
  final bool isLoading;
  final String cartTotal;
  final void Function({required PaymentMethod paymentMethod}) setPaymentMethod;
  final void Function({required BuildContext context}) startPaymentProcess;

  @override
  List<Object?> get props => [selectedPaymentMethod, pplBalance, isLoading];
}
