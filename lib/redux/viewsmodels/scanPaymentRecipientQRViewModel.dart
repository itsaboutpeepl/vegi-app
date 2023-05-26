import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/home_page_actions.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanPaymentRecipientQRViewModel extends Equatable {
  const ScanPaymentRecipientQRViewModel({
    required this.scannedCartItems,
    required this.loadBasketToCartState,
    required this.loadBasketUriToCartState,
    required this.decodeQRCode,
  });

  factory ScanPaymentRecipientQRViewModel.fromStore(Store<AppState> store) {
    return ScanPaymentRecipientQRViewModel(
      //todo: add function to find a product from selected vendor
      scannedCartItems: store.state.cartState.cartItems,
      loadBasketToCartState: ({
        required CreateOrderForFulfilment basket,
        required void Function() success,
        required void Function(String, QRCodeScanErrCode) error,
      }) {
        store.dispatch(
          loadBasketToCart(
            basket,
            success,
            (errMessage) {
              return error(
                errMessage,
                QRCodeScanErrCode.unknown,
              );
            },
          ),
        );
      },
      decodeQRCode: ({
        required String qrCode,
        required void Function() success,
        required void Function(String) error,
      }) {
        try {
          final basketJson = json.decode(qrCode) as Map<String, dynamic>;
          if (basketJson.containsKey('uri') &&
              !basketJson.containsKey('items')) {
            return _loadBasketUriToCartState(
              store: store,
              uri: basketJson['uri'] as String,
              success: success,
              error: error,
            );
          }
          final basketMenuItems =
              List.from(basketJson['items'] as List<dynamic>)
                  .cast<Map<String, dynamic>>();
          final basketRestaurantId = basketJson['vendor'] as String;

          final itemsToUpdate =
              basketMenuItems.map((e) => e['id'].toString()).toList();

          store
            ..dispatch(
              fetchRestaurantById(
                restaurantID: basketRestaurantId,
              ),
            )
            ..dispatch(
              fetchRestaurantMenuItemProductDetailsForItems(
                menuItems: store.state.homePageState.featuredRestaurants
                    .firstWhere(
                      (element) => element.restaurantID == basketRestaurantId,
                    )
                    .listOfMenuItems
                    .where(
                      (element) => itemsToUpdate.contains(element.menuItemID),
                    )
                    .toList(),
                success: (updatedMenuItems) async {
                  final itemsToAdd = <CartItem>[];
                  for (final menuItemJson in basketMenuItems) {
                    final menuItemId = menuItemJson['id'] as int;
                    final menuItem = updatedMenuItems.firstWhere(
                      (element) => element.menuItemID == menuItemId.toString(),
                    );
                    final menuItemQuantity = menuItemJson['quantity'] as int;
                    final menuItemSelectedProductOptions =
                        (menuItemJson['options'] as Map<String, dynamic>)
                            .cast<String, int>();
                    final selectedProductOptions = Map.fromEntries(
                      menuItemSelectedProductOptions.entries.map((e) {
                        return MapEntry(
                          int.parse(e.key),
                          menuItem.listOfProductOptionCategories
                              .firstWhere(
                                (element) =>
                                    element.categoryID == int.parse(e.key),
                              )
                              .listOfOptions
                              .firstWhere(
                                (element) => element.optionID == e.value,
                              ),
                        );
                      }),
                    );
                    final item = CartItem(
                      internalID: Random(
                        DateTime.now().millisecondsSinceEpoch,
                      ).nextInt(100000),
                      menuItem: menuItem,
                      selectedProductOptions: selectedProductOptions,
                      totalItemPrice: (await menuItem
                          .totalPrice(
                            quantity: menuItemQuantity,
                            selectedProductOptions: selectedProductOptions,
                            fulfilmentMethod:
                                store.state.cartState.fulfilmentMethod,
                          ))
                          .totalPrice,
                      itemQuantity: menuItemQuantity,
                      //this quantity always needs to be 1 to work
                      //with the api. the actual quantity of the
                      //object is calculated using the viewmodel
                      //quantity field. Then the object is just
                      //duplicated and added to the cart items.
                    );
                    itemsToAdd.add(item);
                  }
                  store.dispatch(updateCartItems(itemsToAdd));
                  success();
                },
              ),
            );
          final generatorsWalletAddress =
              basketJson['generatorWalletAddress'] as String;
          //
        } on Exception catch (e, s) {
          log.error(e);
          Sentry.captureException(
            e,
            stackTrace: s, // from catch (e, s)
            hint: 'ERROR - decodeQRCode $e',
          );
          error('ERROR - decodeQRCode $e');
        }
      },
      loadBasketUriToCartState: ({
        required String uri,
        required void Function() success,
        required void Function(String) error,
      }) {
        return _loadBasketUriToCartState(
          store: store,
          uri: uri,
          success: success,
          error: error,
        );
      },
    );
  }

  final List<CartItem> scannedCartItems;
  final void Function({
    required CreateOrderForFulfilment basket,
    required void Function() success,
    required void Function(String, QRCodeScanErrCode) error,
  }) loadBasketToCartState;
  final void Function({
    required String uri,
    required void Function() success,
    required void Function(String) error,
  }) loadBasketUriToCartState;
  final void Function({
    required String qrCode,
    required void Function() success,
    required void Function(String) error,
  }) decodeQRCode;

  static void _loadBasketUriToCartState({
    required Store<AppState> store,
    required String uri,
    required void Function() success,
    required void Function(String) error,
  }) {
    store.dispatch(
      loadBasketUriToCart(
        uri,
        success,
        (errMessage) {
          return error(
            errMessage,
          );
        },
      ),
    );
  }

  @override
  List<Object?> get props => [scannedCartItems];
}
