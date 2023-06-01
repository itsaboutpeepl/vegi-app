import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';

class BillInvoiceViewModel extends Equatable {
  const BillInvoiceViewModel({
    required this.grandTotal,
    required this.gbpxUsed,
    required this.pplUsed,
    required this.pplRewardsEarned,
    required this.didUsePPL,
    required this.pplRewardsEarnedValue,
  });

  factory BillInvoiceViewModel.fromStore(Store<AppState> store) {
    return BillInvoiceViewModel(
        didUsePPL: store.state.cartState.selectedPPLAmount > 0,
        grandTotal: store.state.cartState.cartTotal,
        gbpxUsed:
            (store.state.cartState.selectedGBPxAmount * 100).formattedGBPxPrice,
        pplUsed:
            (store.state.cartState.selectedPPLAmount * 100).formattedGBPxPrice,
        pplRewardsEarned: getPPLRewardsFromPence(
          store.state.cartState.selectedGBPxAmount * 100,
        ).toStringAsFixed(2),
        pplRewardsEarnedValue:
            '£${(getPPLRewardsFromPence(store.state.cartState.selectedGBPxAmount * 100) / 10).toStringAsFixed(2)}');
  }

  final String gbpxUsed;
  final String pplUsed;
  final String pplRewardsEarned;
  final Money grandTotal;
  final bool didUsePPL;
  final String pplRewardsEarnedValue;

  @override
  List<Object?> get props => [
    grandTotal,
  ];
}
