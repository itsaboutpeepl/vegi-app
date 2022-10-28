import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/keys.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/checkout/cart_items/cart_item_single.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/cart_item_list_vm.dart';

class CartItemQuantitySelector extends StatelessWidget {
  const CartItemQuantitySelector({
    Key? key,
    required this.width,
    required this.index,
  }) : super(key: key);

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CartItemListViewModel>(
      converter: CartItemListViewModel.fromStore,
      builder: (context, viewmodel) {
        return Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: themeShade300,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(3),
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    AppKeys.listKey.currentState!.removeItem(
                      index,
                      (_, animation) => CartItemSingle(
                        index: index,
                        width: width,
                        animation: animation,
                      ),
                    );
                    Future.delayed(const Duration(milliseconds: 300), () {
                      viewmodel.removeCartItem(viewmodel.ids[index]);
                    });
                  },
                  icon: const Icon(Icons.remove, size: 15),
                ),
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: themeShade300,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(3),
                ),
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    AppKeys.listKey.currentState!.insertItem(
                      viewmodel.ids.length,
                    );
                    viewmodel.addCartItem(viewmodel.ids[index]);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
