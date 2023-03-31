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

part 'createOrderForCollection.freezed.dart';
part 'createOrderForCollection.g.dart';

@Freezed()
class CreateOrderForCollection extends CreateOrderForFulfilment
    with _$CreateOrderForCollection {
  @JsonSerializable()
  factory CreateOrderForCollection({
    required List<CartItem> items,
    required int total,
    required int tipAmount,
    required bool marketingOptIn,
    required String discountCode,
    required String vendor,
    required String walletAddress,
    required DeliveryAddresses address,
    required int fulfilmentMethod,
    required String fulfilmentSlotFrom,
    required String fulfilmentSlotTo,
    required bool isDelivery,
  }) = _CreateOrderForCollection;

  @JsonEnum()
  final FulfilmentMethodType fulfilmentTypeString = FulfilmentMethodType.collection;

  factory CreateOrderForCollection.fromStore(Store<AppState> store) {
    return CreateOrderForCollection(
      isDelivery: false,
      items: store.state.cartState.cartItems,
      total: store.state.cartState.cartTotal,
      tipAmount: store.state.cartState.selectedTipAmount,
      marketingOptIn: false,
      discountCode: store.state.cartState.discountCode,
      vendor: store.state.cartState.restaurantID,
      walletAddress: store.state.userState.walletAddress,
      address: DeliveryAddresses(
        label: DeliveryAddressLabel.work,
        internalID:
            Random((DateTime.now().millisecondsSinceEpoch)).nextInt(10000),
        addressLine1: 'Collection Order',
        addressLine2:
            store.state.cartState.restaurantAddress!.shortAddressLessPostCode,
        postalCode: store.state.cartState.restaurantAddress!.postalCode,
        townCity: store.state.cartState.restaurantAddress!.townCity.isEmpty
            ? 'Liverpool'
            : store.state.cartState.restaurantAddress!.townCity,
        instructions: store.state.cartState.deliveryInstructions,
        name: store.state.userState.displayName,
        email: store.state.userState.email == ''
            ? EMAIL_NOT_PROVIDED
            : store.state.userState.email,
        phoneNumber: store.state.userState.phoneNumber,
        latitude: 0,
        longitude: 0,
      ),
      fulfilmentMethod:
          store.state.cartState.selectedTimeSlot!.fulfilmentMethodId,
      fulfilmentSlotFrom:
          store.state.cartState.selectedTimeSlot!.startTime.formattedForAPI,
      fulfilmentSlotTo:
          store.state.cartState.selectedTimeSlot!.endTime.formattedForAPI,
    );
  }

  CreateOrderForCollection._();

  factory CreateOrderForCollection.fromJson(Map<String, dynamic> json) =>
      _$$_CreateOrderForCollectionFromJson(json);
}
