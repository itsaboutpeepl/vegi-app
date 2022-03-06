import 'package:equatable/equatable.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class PaymentSheetViewModel extends Equatable {
  final int cartTotal;
  final String pplBalance;
  final String gbpXBalance;
  final String paymentIntentID;
  final double selectedGBPxAmount;
  final double selectedPPLAmount;
  final bool transferringTokens;
  final bool errorCompletingPayment;
  final bool confirmedPayment;
  final Function(double GBPxAmount, double PPLAmount) updateSelectedValues;
  final Function() sendToken;
  final Function() toggleTransferringPayment;
  final Function() toggleError;
  final Function() toggleConfirmed;

  PaymentSheetViewModel({
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
    required this.toggleTransferringPayment,
    required this.toggleError,
    required this.toggleConfirmed,
  });

  static PaymentSheetViewModel fromStore(Store<AppState> store) {
    return PaymentSheetViewModel(
      cartTotal: store.state.cartState.cartTotal,
      pplBalance: store.state.cashWalletState.tokens[PeeplToken.address]!
          .getBalance(true),
      gbpXBalance: store.state.cashWalletState.tokens[GBPxToken.address]!
          .getBalance(true),
      paymentIntentID: store.state.cartState.paymentIntentID,
      selectedGBPxAmount: store.state.cartState.selectedGBPxAmount,
      selectedPPLAmount: store.state.cartState.selectedPPLAmount,
      transferringTokens: store.state.cartState.transferringTokens,
      errorCompletingPayment: store.state.cartState.errorCompletingPayment,
      confirmedPayment: store.state.cartState.confirmedPayment,
      updateSelectedValues: (GBPxAmount, PPLAmount) {
        store.dispatch(UpdateSelectedAmounts(GBPxAmount, PPLAmount));
      },
      sendToken: () {
        store.dispatch(sendTokenPayment());
      },
      toggleTransferringPayment: () {
        store.dispatch(ToggleTransferPayment());
      },
      toggleError: () {
        store.dispatch(ToggleError());
      },
      toggleConfirmed: () {
        store.dispatch(ToggleConfirmed());
      },
    );
  }

  @override
  List<Object> get props => [
        cartTotal,
      ];
}
