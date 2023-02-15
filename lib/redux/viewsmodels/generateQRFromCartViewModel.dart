import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class GenerateQRFromCartViewModel extends Equatable {
  const GenerateQRFromCartViewModel({
    required this.encodedCartItems,
  });

  factory GenerateQRFromCartViewModel.fromStore(Store<AppState> store) {
    return GenerateQRFromCartViewModel(
        encodedCartItems: json.encode(
      store.state.cartState.cartItems.map((ci) => ci.toJson()).toList(),
    ));
  }

  final String encodedCartItems;

  @override
  List<Object?> get props => [encodedCartItems];
}
