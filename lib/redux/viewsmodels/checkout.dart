import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/restaurant/deliveryAddresses.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class CheckoutViewModel extends Equatable {
  final List<Map<String, String>> deliverySlots;
  final List<Map<String, String>> collectionSlots;
  final DeliveryAddresses? selectedDeliveryAddress;
  final int selectedUserTip;
  final Map<String, String> selectedTimeSlot;
  final String discountCode;
  final int discountPercent;
  final int cartTotal;
  final FulfilmentMethod fulfilmentMethod;
  final bool isDelivery;
  final String deliveryInstructions;
  final Function(String discountCode, VoidCallback) updateDiscount;
  final Function(Map<String, String> selectedTimeSlot) updateSelectedTimeSlot;
  final Function(int tipAmount) updateTipAmount;
  final Function(void Function(String errroMessage), VoidCallback) createOrder;
  final Function(DateTime newDate) updateSlotTimes;
  final Function(String deliveryInstructions) setDeliveryInstructions;

  CheckoutViewModel({
    required this.deliverySlots,
    required this.collectionSlots,
    required this.selectedUserTip,
    required this.selectedDeliveryAddress,
    required this.discountCode,
    required this.discountPercent,
    required this.updateDiscount,
    required this.cartTotal,
    required this.selectedTimeSlot,
    required this.updateSelectedTimeSlot,
    required this.updateTipAmount,
    required this.createOrder,
    required this.updateSlotTimes,
    required this.fulfilmentMethod,
    required this.isDelivery,
    required this.deliveryInstructions,
    required this.setDeliveryInstructions,
  });

  static CheckoutViewModel fromStore(Store<AppState> store) {
    return CheckoutViewModel(
      deliverySlots: store.state.cartState.deliverySlots,
      collectionSlots: store.state.cartState.collectionSlots,
      selectedUserTip: store.state.cartState.selectedTipAmount,
      selectedDeliveryAddress: store.state.cartState.selectedDeliveryAddress,
      discountCode: store.state.cartState.discountCode,
      discountPercent: store.state.cartState.cartDiscountPercent,
      cartTotal: store.state.cartState.cartTotal,
      selectedTimeSlot: store.state.cartState.selectedTimeSlot,
      fulfilmentMethod: store.state.cartState.fulfilmentMethod,
      isDelivery: store.state.cartState.isDelivery,
      deliveryInstructions: store.state.cartState.deliveryInstructions,
      updateDiscount: (discountCode, errorCallback) {
        store.dispatch(updateCartDiscount(discountCode, errorCallback));
      },
      updateSelectedTimeSlot: (Map<String, String> selectedTimeSlot) {
        store.dispatch(UpdateSelectedTimeSlot(selectedTimeSlot));
        store.state.cartState.selectedDeliveryAddress == null
            ? store.dispatch(SetDeliveryCharge(store.state.cartState.collectionCharge))
            : store.dispatch(SetDeliveryCharge(store.state.cartState.deliveryCharge));
        store.dispatch(computeCartTotals());
      },
      updateTipAmount: (int tipAmount) {
        store.dispatch(updateCartTip(tipAmount));
      },
      createOrder: (errorCallback, successCallback) {
        store.dispatch(prepareAndSendOrder(errorCallback, successCallback));
      },
      updateSlotTimes: (newDate) {
        store.dispatch(getFullfillmentMethods(newDate: newDate));
      },
      setDeliveryInstructions: (deliveryInstructions) {
        store.dispatch(SetDeliveryInstructions(deliveryInstructions));
      },
    );
  }

  @override
  List<Object?> get props => [
        selectedTimeSlot,
        selectedUserTip,
        discountCode,
        cartTotal,
        selectedDeliveryAddress,
        fulfilmentMethod,
        deliveryInstructions,
      ];
}
