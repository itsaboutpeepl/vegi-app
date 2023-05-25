import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/discount.dart';
import 'package:vegan_liverpool/models/payments/money.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class DiscountCardViewModel extends Equatable {
  const DiscountCardViewModel({
    required this.hasDiscount,
    required this.discountCode,
    required this.removeDiscount,
    required this.activeVouchers,
    required this.removeAppliedVoucher,
    required this.cartCurrency,
    required this.cartVendorId,
  });

  factory DiscountCardViewModel.fromStore(Store<AppState> store) {
    return DiscountCardViewModel(
      hasDiscount: store.state.cartState.discountCode.isNotEmpty,
      discountCode: store.state.cartState.discountCode,
      cartCurrency: store.state.cartState.cartCurrency,
      cartVendorId: int.parse(store.state.cartState.restaurantID),
      activeVouchers: store.state.cartState.appliedVouchers,
      removeDiscount: () => store.dispatch(removeCartDiscount()),
      removeAppliedVoucher: ({
        required Discount voucher,
      }) => store.dispatch(removeCartAppliedVoucher(
        voucher: voucher,
      ),),
    );
  }

  final bool hasDiscount;
  final String discountCode;
  final Currency cartCurrency;
  final int cartVendorId;
  final List<Discount> activeVouchers;
  final void Function() removeDiscount;
  final void Function({
    required Discount voucher,
  }) removeAppliedVoucher;

  @override
  List<Object?> get props => [
    discountCode,
    cartCurrency,
    cartVendorId,
  ];
}
