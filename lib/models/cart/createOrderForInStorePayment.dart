import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/utils/constants.dart';

part 'createOrderForInStorePayment.freezed.dart';
part 'createOrderForInStorePayment.g.dart';

@Freezed()
class CreateOrderForInStorePayment extends CreateOrderForFulfilment
    with _$CreateOrderForInStorePayment {
  @JsonSerializable()
  factory CreateOrderForInStorePayment({
    required List<CartItem> items,
    required num total,
    required Currency currency,
    required int tipAmount,
    required bool marketingOptIn,
    required List<String> discountCodes,
    required String vendor,
    required String walletAddress,
    required String publicId,
  }) = _CreateOrderForInStorePayment;

  @JsonEnum()
  final FulfilmentMethodType fulfilmentTypeString =
      FulfilmentMethodType.inStore;

  factory CreateOrderForInStorePayment.fromStore(Store<AppState> store) {
    return CreateOrderForInStorePayment(
      items: store.state.cartState.cartItems,
      total: store.state.cartState.cartTotal.inGBPxValue,
      currency: store.state.cartState.cartCurrency,
      tipAmount: store.state.cartState.selectedTipAmount.inGBPxValue.round(),
      marketingOptIn: false,
      discountCodes: store.state.cartState.discountCode.isEmpty
          ? store.state.cartState.appliedVouchers
              .map((voucher) => voucher.code)
              .toList()
          : [
        store.state.cartState
            .discountCode, // TODO: Apply discount vouchers here somehow?
        ...store.state.cartState.appliedVouchers
            .map((voucher) => voucher.code)
            .toList(),
      ],
      vendor: store.state.cartState.restaurantID,
      walletAddress: store.state.userState.walletAddress,
      publicId: '',
    );
  }

  CreateOrderForInStorePayment._();

  factory CreateOrderForInStorePayment.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderForInStorePaymentFromJson(json);
}
