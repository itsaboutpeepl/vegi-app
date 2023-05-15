import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart'
    as cart_actions;

class AddDiscountCodeViewModel extends Equatable {
  const AddDiscountCodeViewModel({
    required this.voucherPotValue,
    required this.validateFixedVoucherCode,
    required this.subscribeToWaitingListEmails,
  });

  factory AddDiscountCodeViewModel.fromStore(Store<AppState> store) {
    return AddDiscountCodeViewModel(
      voucherPotValue: store.state.cartState.voucherPotValue,
      subscribeToWaitingListEmails: ({
        required bool receiveNotifications,
        required void Function(String) onError,
      }) {
        cart_actions.subscribeToWaitingListEmails(
          email: store.state.userState.email,
          receiveUpdates: receiveNotifications,
          onError: onError,
        );
      },
      validateFixedVoucherCode: ({
        required String code,
        required void Function(String) onError,
      }) {
        final vendor = store.state.homePageState.featuredRestaurants
            .firstWhereExists((element) => element.name == 'Purple Carrot');
        if (vendor == null) {
          return onError(
              'Purple Carrot does not found in memory. Please load vendors first...');
        }
        cart_actions.validateFixedVoucherCode(
          code: code,
          vendor: int.parse(vendor.restaurantID),
          onError: onError,
        );
      },
    );
  }

  final Money voucherPotValue;
  final void Function({
    required String code,
    required void Function(String) onError,
  }) validateFixedVoucherCode;
  final void Function({
    required bool receiveNotifications,
    required void Function(String) onError,
  }) subscribeToWaitingListEmails;

  @override
  List<Object?> get props => [
        voucherPotValue,
      ];
}
