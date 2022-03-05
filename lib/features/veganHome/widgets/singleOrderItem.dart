import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/orderItem.dart';

class SingleOrderItem extends StatefulWidget {
  const SingleOrderItem({Key? key, required this.orderItem}) : super(key: key);

  final OrderItem orderItem;

  @override
  _SingleOrderItemState createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends State<SingleOrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CachedNetworkImage(
                imageUrl: widget.orderItem.menuItem.imageURLs[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text(
                      widget.orderItem.menuItem.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.orderItem.menuItem.formattedPrice,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    widget.orderItem.selectedProductOptions.entries.isNotEmpty
                        ? Text(
                            "Options",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : SizedBox.shrink(),
                  ] +
                  widget.orderItem.selectedProductOptions.entries
                      .map<Widget>(
                        (e) => Text.rich(
                          TextSpan(
                            text: e.value.name,
                            children: [
                              TextSpan(text: " - "),
                              TextSpan(text: cFPrice(e.value.price))
                            ],
                          ),
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget addOnPriceItemTile(String title, String trailing) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
      Text(
        trailing,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}
