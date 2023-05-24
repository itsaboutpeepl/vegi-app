import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/errorDetails.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class AddDiscountCodeViewModel extends Equatable {
  const AddDiscountCodeViewModel({
    required this.voucherPotValue,
    required this.registerFixedVoucherCode,
    required this.voucherAlreadyApplied,
    required this.subscribeToEmailToNotifications,
    required this.cartErrorDetails,
    required this.cartIsLoading,
  });

  factory AddDiscountCodeViewModel.fromStore(Store<AppState> store) {
    return AddDiscountCodeViewModel(
      voucherPotValue: store.state.cartState.voucherPotValue,
      cartErrorDetails: store.state.cartState.errorDetails,
      cartIsLoading: store.state.cartState.isLoadingCartState,
      subscribeToEmailToNotifications: ({
        required bool receiveNotifications,
      }) {
        store.dispatch(
          subscribeToWaitingListEmails(
            email: store.state.userState.email,
            receiveUpdates: receiveNotifications,
          ),
        );
      },
      voucherAlreadyApplied: ({
        required String code,
      }) {
        return store.state.cartState.appliedVouchers
            .where(
              (element) =>
                  element.code == code &&
                  element.discountType == DiscountType.fixed,
            )
            .toList()
            .isNotEmpty;
      },
      registerFixedVoucherCode: ({
        required String code,
      }) {
        final vendor = store.state.homePageState.featuredRestaurants
            .firstWhereExists((element) => element.name == 'Purple Carrot');
        if (vendor == null) {
          return log.error(
              'Purple Carrot was not found in app memory. Please load vendors first...');
        }
        store.dispatch(
          validateFixedVoucherCode(
            code: code,
            vendor: int.parse(vendor.restaurantID),
          ),
        );
      },
    );
  }

  final Money voucherPotValue;
  final ErrorDetails<CartErrCode>? cartErrorDetails;
  final bool cartIsLoading;
  final void Function({
    required String code,
  }) registerFixedVoucherCode;
  final bool Function({
    required String code,
  }) voucherAlreadyApplied;
  final void Function({
    required bool receiveNotifications,
  }) subscribeToEmailToNotifications;

  @override
  List<Object?> get props => [
        voucherPotValue,
        cartErrorDetails,
        cartIsLoading,
      ];
}
