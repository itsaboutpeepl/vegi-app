import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class PaymentSheetViewModel extends Equatable {
  const PaymentSheetViewModel({
    required this.cartTotal,
    required this.pplBalance,
    required this.gbpXBalance,
    required this.paymentIntentID,
    required this.sendToken,
    required this.selectedGBPxAmount,
    required this.selectedPPLAmount,
    required this.updateSelectedValues,
    required this.transferringTokens,
    required this.errorCompletingPayment,
    required this.confirmedPayment,
    required this.restaurantName,
    required this.setTransferringPayment,
    required this.setError,
    required this.setConfirmed,
    required this.walletAddress,
  });

  factory PaymentSheetViewModel.fromStore(Store<AppState> store) {
    return PaymentSheetViewModel(
      cartTotal: store.state.cartState.cartTotal,
      pplBalance:
          store.state.cashWalletState.tokens[PeeplToken.address]!.getBalance(),
      gbpXBalance:
          store.state.cashWalletState.tokens[GBPxToken.address]!.getBalance(),
      paymentIntentID: store.state.cartState.paymentIntentID,
      selectedGBPxAmount: store.state.cartState.selectedGBPxAmount,
      selectedPPLAmount: store.state.cartState.selectedPPLAmount,
      transferringTokens: store.state.cartState.transferringTokens,
      errorCompletingPayment: store.state.cartState.errorCompletingPayment,
      confirmedPayment: store.state.cartState.confirmedPayment,
      restaurantName: store.state.cartState.restaurantName,
      walletAddress: store.state.userState.walletAddress,
      updateSelectedValues: (GBPxAmount, PPLAmount) {
        store.dispatch(UpdateSelectedAmounts(GBPxAmount, PPLAmount));
      },
      sendToken: (successCallback, errorCallback) {
        store.dispatch(sendTokenPayment(successCallback, errorCallback));
      },
      setTransferringPayment: (flag) {
        store.dispatch(SetTransferringPayment(flag: flag));
      },
      setError: (flag) {
        store.dispatch(SetError(flag: flag));
      },
      setConfirmed: (flag) {
        store.dispatch(SetConfirmed(flag: flag));
      },
    );
  }
  final int cartTotal;
  final String pplBalance;
  final String gbpXBalance;
  final String paymentIntentID;
  final double selectedGBPxAmount;
  final double selectedPPLAmount;
  final bool transferringTokens;
  final bool errorCompletingPayment;
  final bool confirmedPayment;
  final String restaurantName;
  final String walletAddress;
  final void Function(double GBPxAmount, double PPLAmount) updateSelectedValues;
  final void Function(VoidCallback successCallBack, VoidCallback errorCallback)
      sendToken;
  final void Function(bool) setTransferringPayment;
  final void Function(bool) setError;
  final void Function(bool) setConfirmed;

  @override
  List<Object> get props => [
        cartTotal,
        pplBalance,
        gbpXBalance,
        paymentIntentID,
        selectedGBPxAmount,
        selectedPPLAmount,
        transferringTokens,
        errorCompletingPayment,
        confirmedPayment,
      ];
}
