import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class SingleFeaturedMenuItem extends StatelessWidget {
  const SingleFeaturedMenuItem({Key? key, required this.menuItem})
      : super(key: key);

  final RestaurantMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        final size = MediaQuery.of(context).size;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      strokeAlign: StrokeAlign.outside,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      memCacheWidth: size.width.toInt(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * 0.2,
                      imageUrl: menuItem.imageURL,
                      errorWidget: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              menuItem.name.capitalizeWords(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (menuItem.price != 0)
                        Text(
                          menuItem.formattedPrice,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  parseHtmlString(menuItem.description),
                  maxLines: 3,
                ),
              ],
            ),
            onTap: () {
              viewmodel.setMenuItem(menuItem);
              showBarModalBottomSheet<Widget>(
                context: context,
                builder: (context) => const DetailMenuItemView(),
              );
            },
          ),
        );
      },
    );
  }
}
