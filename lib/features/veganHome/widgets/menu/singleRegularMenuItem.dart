import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class SingleRegularMenuItem extends StatefulWidget {
  const SingleRegularMenuItem({Key? key, required this.menuItem}) : super(key: key);

  final RestaurantMenuItem menuItem;

  @override
  _SingleRegularMenuItemState createState() => _SingleRegularMenuItemState();
}

class _SingleRegularMenuItemState extends State<SingleRegularMenuItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.menuItem.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      widget.menuItem.price != 0
                          ? Text(
                              widget.menuItem.formattedPrice,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            )
                          : Text(
                              "Price on selection",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            ),
                      Text(
                        widget.menuItem.description,
                        maxLines: 3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    memCacheHeight: (MediaQuery.of(context).size.height * 0.2).toInt(),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.cover,
                    imageUrl: widget.menuItem.imageURL,
                    errorWidget: (context, error, stackTrace) {
                      return SizedBox.shrink(); //TODO: ADD default Image
                    },
                  ),
                ),
              ],
            ),
            onTap: () => {
              viewmodel.setMenuItem(widget.menuItem),
              showBarModalBottomSheet(
                context: context,
                builder: (context) => DetailMenuItemView(),
              ),
            },
          ),
        );
      },
    );
  }
}
