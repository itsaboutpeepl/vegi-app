import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class ScanProductQRCodeViewModel extends Equatable {
  const ScanProductQRCodeViewModel({
    required this.scannedCartItems,
    required this.scanQRCode,
  });

  factory ScanProductQRCodeViewModel.fromStore(Store<AppState> store) {
    return ScanProductQRCodeViewModel(
      //todo: add function to find a product from selected vendor
      scannedCartItems: store.state.cartState.cartItems,
      scanQRCode: (qrCode, successHandler, errorHandler) {
        store
          .dispatch(scanRestaurantMenuItemQRCode(
            qrCode,
            successHandler,
            errorHandler,
          ),); // todo success Handler to show snack if item succeeds in adding to cart
      },
    );
  }

  final List<CartItem> scannedCartItems;
  final void Function(
    String qrCode,
    void Function() success,
    void Function(String, QRCodeScanErrCode) error,
  ) scanQRCode;

  @override
  List<Object?> get props => [scannedCartItems];
}
