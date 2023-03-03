import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/services.dart';

class GenerateQRFromCartViewModel extends Equatable {
  const GenerateQRFromCartViewModel({
    required this.basket,
    required this.isSimulator,
    required this.orderId,
    required this.customerWalletAddress,
    required this.vendorWalletAddress,
    required this.generatorWalletAddress,
  });

  factory GenerateQRFromCartViewModel.fromStore(Store<AppState> store) {
    return GenerateQRFromCartViewModel(
      isSimulator: store.state.userState.isUsingSimulator,
      basket: CreateOrderForFulfilment.fromStore(store),
      orderId: store.state.cartState.orderID,
      customerWalletAddress: store.state.userState.isVendor
          ? store.state.userState.accountAddress
          : null,
      vendorWalletAddress: store.state.userState.isVendor
          ? store.state.userState.accountAddress
          : store.state.cartState.restaurantWalletAddress,
      generatorWalletAddress: store.state.userState.accountAddress,
    );
  }

  final String? customerWalletAddress;
  final String vendorWalletAddress;
  final String generatorWalletAddress;
  final CreateOrderForFulfilment? basket;
  final String orderId;
  final bool isSimulator;

  Map<String, dynamic> get basketJson => (basket?.toUploadJson() ?? {})
    ..addAll({
      'uri': peeplEatsService.getOrderUri(orderId),
      'customerWalletAddress': customerWalletAddress ?? '',
      'vendorWalletAddress': vendorWalletAddress,
      'generatorWalletAddress': generatorWalletAddress,
    });

  String get encodedBasket => json.encode(basketJson);

  @override
  List<Object?> get props => [
        orderId,
        isSimulator,
        customerWalletAddress,
        vendorWalletAddress,
        generatorWalletAddress,
        encodedBasket,
      ];
}
