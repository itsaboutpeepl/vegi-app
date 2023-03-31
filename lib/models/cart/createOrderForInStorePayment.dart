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
    required int total,
    required int tipAmount,
    required bool marketingOptIn,
    required String discountCode,
    required String vendor,
    required String walletAddress,
  }) = _CreateOrderForInStorePayment;

  @JsonEnum()
  final FulfilmentMethodType fulfilmentTypeString = FulfilmentMethodType.inStore;

  factory CreateOrderForInStorePayment.fromStore(Store<AppState> store) {
    return CreateOrderForInStorePayment(
      items: store.state.cartState.cartItems,
      total: store.state.cartState.cartTotal,
      tipAmount: store.state.cartState.selectedTipAmount,
      marketingOptIn: false,
      discountCode: store.state.cartState.discountCode,
      vendor: store.state.cartState.restaurantID,
      walletAddress: store.state.userState.walletAddress,
    );
  }

  CreateOrderForInStorePayment._();

  factory CreateOrderForInStorePayment.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderForInStorePaymentFromJson(json);
}
