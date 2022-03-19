import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';

class SingleRestaurantItem extends StatefulWidget {
  const SingleRestaurantItem({
    Key? key,
    required this.restaurantItem,
  }) : super(key: key);

  final RestaurantItem restaurantItem;

  @override
  _SingleRestaurantItemState createState() => _SingleRestaurantItemState();
}

class _SingleRestaurantItemState extends State<SingleRestaurantItem> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RestaurantItemViewModel>(
      converter: RestaurantItemViewModel.fromStore,
      builder: (_, viewmodel) {
        return GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: CachedNetworkImageProvider(
                        widget.restaurantItem.imageURL),
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.restaurantItem.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 32,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: Row(
                            children: List.generate(
                              3,
                              (index) {
                                return index < widget.restaurantItem.costLevel
                                    ? Icon(
                                        Icons.attach_money,
                                        size: 20,
                                        color: Colors.grey[600],
                                      )
                                    : SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey[400]!),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     height: 32,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //       child: Center(
                  //         child: Row(
                  //           children: [
                  //             Icon(
                  //               Icons.timer_rounded,
                  //               size: 20,
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text(
                  //               widget.restaurantItem,
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  ),
                  widget.restaurantItem.rating != 0
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 32,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Center(
                                child: Row(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return index <
                                              widget.restaurantItem.rating
                                          ? Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.grey[600],
                                            )
                                          : Icon(
                                              Icons.star_outline,
                                              size: 20,
                                              color: Colors.grey[600],
                                            );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              )
            ],
          ),
          onTap: () {
            viewmodel.updateRestaurantDetails(
              widget.restaurantItem.restaurantID,
              widget.restaurantItem.name,
              widget.restaurantItem.address,
              widget.restaurantItem.walletAddress,
              () => showErrorSnack(
                  context: context,
                  title: "Existing Items in cart were removed"),
            );
            context.router.push(RestaurantMenuScreen(
                menuList: widget.restaurantItem.listOfMenuItems));
          },
        );
      },
    );
  }
}
