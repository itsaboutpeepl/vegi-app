import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class SingleFeaturedMenuItem extends StatefulWidget {
  const SingleFeaturedMenuItem({Key? key, required this.menuItem}) : super(key: key);

  final RestaurantMenuItem menuItem;

  @override
  _SingleFeaturedMenuItemState createState() => _SingleFeaturedMenuItemState();
}

class _SingleFeaturedMenuItemState extends State<SingleFeaturedMenuItem> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.menuItem.imageURL != ""
                      ? CachedNetworkImage(
                          memCacheWidth: (MediaQuery.of(context).size.width).toInt(),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.2,
                          imageUrl: widget.menuItem.imageURL,
                          errorWidget: (context, error, stackTrace) {
                            return SizedBox.shrink(); //TODO: Change to default image
                          },
                        )
                      : SizedBox.shrink(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.menuItem.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      widget.menuItem.price != 0
                          ? Text(
                              widget.menuItem.formattedPrice,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  parseHtmlString(widget.menuItem.description),
                  maxLines: 3,
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
