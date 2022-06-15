import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/models/restaurant/cartItem.dart';

class SingleCartItem extends StatefulWidget {
  const SingleCartItem({Key? key, required this.orderItem}) : super(key: key);

  final CartItem orderItem;

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: CachedNetworkImage(
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
                    Text(
                      widget.orderItem.menuItem.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
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
                            fontSize: 18,
                          ),
                        ),
                        widget.orderItem.selectedProductOptions.entries.isNotEmpty
                            ? GestureDetector(
                                onTap: () => setState(() {
                                  _showOptions = !_showOptions;
                                }),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey[800],
                                  child: Icon(
                                    _showOptions ? Icons.remove : Icons.add,
                                    size: 19,
                                    color: themeShade300,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ] +
                  widget.orderItem.selectedProductOptions.entries
                      .map<Widget>(
                        (e) => _showOptions
                            ? Text.rich(
                                TextSpan(
                                  text: e.value.name,
                                  children: [TextSpan(text: " - "), TextSpan(text: cFPrice(e.value.price))],
                                ),
                                style: TextStyle(color: Colors.grey[700]),
                              )
                            : SizedBox.shrink(),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
