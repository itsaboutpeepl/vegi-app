import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';

class SingleCartItem extends StatefulWidget {
  const SingleCartItem({Key? key, required this.orderItem}) : super(key: key);

  final CartItem orderItem;

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CachedNetworkImage(
                memCacheHeight: (MediaQuery.of(context).size.width * 0.2).toInt(),
                imageUrl: widget.orderItem.menuItem.imageURL,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            widget.orderItem.menuItem.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          widget.orderItem.formattedPrice,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // CartQuantityButtons(orderItem: widget.orderItem),
                      ],
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
                            children: [TextSpan(text: " - "), TextSpan(text: cFPrice(e.value.price))],
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
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
