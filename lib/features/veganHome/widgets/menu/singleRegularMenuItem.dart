import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuItemView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantMenuItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

class SingleRegularMenuItem extends StatelessWidget {
  const SingleRegularMenuItem({Key? key, required this.menuItem})
      : super(key: key);

  final RestaurantMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItem.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      if (menuItem.price != 0)
                        Text(
                          menuItem.formattedPrice,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        )
                      else
                        const Text(
                          'Price on selection',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        menuItem.description,
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      memCacheHeight: (size.height * 0.2).toInt(),
                      width: size.width * 0.3,
                      height: size.width * 0.2,
                      fit: BoxFit.cover,
                      imageUrl: menuItem.imageURL,
                      errorWidget: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () => {
              viewmodel.setMenuItem(menuItem),
              mbs.showBarModalBottomSheet<Widget>(
                context: context,
                builder: (context) => const DetailMenuItemView(),
              ),
            },
          ),
        );
      },
    );
  }
}
