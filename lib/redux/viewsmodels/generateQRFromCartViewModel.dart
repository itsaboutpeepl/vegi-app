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
    required this.generatorWalletAddress,
    // required this.customerWalletAddress,
    // required this.vendorWalletAddress,
  });

  factory GenerateQRFromCartViewModel.fromStore(Store<AppState> store) {
    return GenerateQRFromCartViewModel(
      isSimulator: store.state.userState.isUsingSimulator,
      basket: CreateOrderForFulfilment.fromStore(store),
      orderId: store.state.cartState.orderID,
      generatorWalletAddress: store.state.userState.accountAddress,
      // customerWalletAddress: store.state.userState.isVendor
      //     ? store.state.userState.accountAddress
      //     : null,
      // vendorWalletAddress: store.state.userState.isVendor
      //     ? store.state.userState.accountAddress
      //     : store.state.cartState.restaurantWalletAddress,
    );
  }

  // final String? customerWalletAddress;
  // final String vendorWalletAddress;
  final String generatorWalletAddress;
  final CreateOrderForFulfilment? basket;
  final String orderId;
  final bool isSimulator;

  Future<Map<String, dynamic>> basketJson() async =>
      (basket?.toUploadJson() ?? Future.value({})).then(
        (value) => value
          ..addAll({
            'uri': peeplEatsService.getOrderFullUri(orderId),
            'generatorWalletAddress': generatorWalletAddress,
            // 'customerWalletAddress': customerWalletAddress ?? '',
            // 'vendorWalletAddress': vendorWalletAddress,
          }),
      );

  Future<String> encodedBasket() async => json.encode(basketJson);

  @override
  List<Object?> get props => [
        orderId,
        isSimulator,
        generatorWalletAddress,
        // customerWalletAddress,
        // vendorWalletAddress,
        encodedBasket,
      ];
}
