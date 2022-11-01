import 'package:flutter/material.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';

class OrderItemSingle extends StatelessWidget {
  const OrderItemSingle({Key? key, required this.orderItem}) : super(key: key);

  final CartItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderItem.menuItem.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  orderItem.formattedPrice,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ] +
          orderItem.selectedProductOptionsString
              .map<Widget>(
                Text.new,
              )
              .toList(),
    );
  }
}
