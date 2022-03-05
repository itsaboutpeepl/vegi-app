import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class CartQuantityButtons extends StatefulWidget {
  const CartQuantityButtons({Key? key, required this.orderItem})
      : super(key: key);

  final OrderItem orderItem;

  @override
  _CartQuantityButtonsState createState() => _CartQuantityButtonsState();
}

class _CartQuantityButtonsState extends State<CartQuantityButtons> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
      distinct: true,
      converter: UserCartViewModel.fromStore,
      builder: (_, viewmodel) {
        return Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    OrderItem newOrderItem = widget.orderItem.copyWith(
                      itemQuantity: widget.orderItem.itemQuantity - 1,
                      totalItemPrice: widget.orderItem.totalItemPrice -
                          widget.orderItem.menuItem.price,
                    );

                    viewmodel.updateOrderItem(newOrderItem);
                  },
                  icon: Icon(Icons.remove, size: 15),
                ),
              ),
            ),
            Container(
              height: 25,
              width: 35,
              child: Center(
                child: Text(
                  widget.orderItem.itemQuantity.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  vertical: BorderSide(color: Colors.grey),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(3, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    OrderItem newOrderItem = widget.orderItem.copyWith(
                      itemQuantity: widget.orderItem.itemQuantity + 1,
                      totalItemPrice: widget.orderItem.totalItemPrice +
                          widget.orderItem.menuItem.price,
                    );
                    viewmodel.updateOrderItem(newOrderItem);
                  },
                  icon: Icon(
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
