import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class TopUpViewModel extends Equatable {
  const TopUpViewModel({
    required this.recipientWalletAddress,
    required this.senderWalletAddress,
    required this.orderId,
    required this.accountId,
    required this.topUpAmount,
    required this.handleApplePay,
  });

  factory TopUpViewModel.fromStore(Store<AppState> store) {
    return TopUpViewModel(
      recipientWalletAddress: store.state.userState.walletAddress,
      senderWalletAddress: store.state.userState.walletAddress,
      orderId: num.parse(store.state.cartState.orderID),
      accountId: store.state.userState.vegiAccountId,
      topUpAmount: store.state.cartState.cartTotal.value == 0
          ? 25 // Default of £25 when no cart state (i.e. just topping up for future.)
          : store.state.cartState.cartTotal.inGBPValue,
      handleApplePay: (int amountPence) async {
        if (store.state.userState.vegiAccountId == null) {
          final e =
              'vegi AccountId not set on state... Cannot start payment';
          log.error(e);
          await Sentry.captureException(
            Exception(e),
            stackTrace: StackTrace.current, // from catch (e, s)
            hint: 'ERROR - startPeeplPayProcess $e',
          );
        }
        await stripeService.handleApplePay(
          recipientWalletAddress: store.state.userState.walletAddress,
          senderWalletAddress: store.state.userState.walletAddress,
          orderId: num.parse(store.state.cartState.orderID),
          accountId: store.state.userState.vegiAccountId!,
          stripeCustomerId: store.state.userState.stripeCustomerId,
          paymentIntentClientSecret: store.state.cartState.paymentIntentClientSecret,
          amount: Money(currency: Currency.GBP, value: amountPence / 100),
          store: store, //move to viewmodel
          shouldPushToHome: true,
          productName: Labels.stripeVegiProductName,
        );
      }
    );
  }

  final String recipientWalletAddress;
  final String senderWalletAddress;
  final num orderId;
  final num? accountId;
  final num topUpAmount;
  final Future<void> Function(int amountPenceRounded) handleApplePay;

  @override
  List<Object> get props => [
        recipientWalletAddress,
      ];
}
