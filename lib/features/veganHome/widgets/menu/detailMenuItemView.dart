import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuViewFloatingBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/productOptionsView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class DetailMenuItemView extends StatefulWidget {
  const DetailMenuItemView({Key? key}) : super(key: key);
  @override
  State<DetailMenuItemView> createState() => _DetailMenuItemViewState();
}

class _DetailMenuItemViewState extends State<DetailMenuItemView> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailMenuItem>(
      converter: DetailMenuItem.fromStore,
      distinct: true,
      onInit: (store) {
        if (store.state.menuItemState.menuItem != null) {
          store.dispatch(
            fetchProductOptions(
              store.state.menuItemState.menuItem!.menuItemID,
            ),
          );
          Analytics.track(
            eventName: AnalyticsEvents.viewItem,
            properties: {
              'itemName': store.state.menuItemState.menuItem!.name,
              'itemId': store.state.menuItemState.menuItem!.menuItemID,
            },
          );
        }
      },
      builder: (_, viewmodel) {
        if (viewmodel.menuItem == null) {
          return const SizedBox.shrink();
        }

        const detailFloatingBarHeight = 100.0;
        const imageMinHeight = 100.0;
        final imageHeight = Math.max(
          MediaQuery.of(context).size.height * 0.2,
          imageMinHeight,
        );
        const marginBetweenImageAndDetailsCard = 10.0;

        const cardCurvatureHeight = 30.0;
        const debugColors = false;
        return Stack(
          // * this stack is only to display the DetailFloatingBar at the bottom
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        height: imageHeight +
                            cardCurvatureHeight +
                            marginBetweenImageAndDetailsCard, // TODO: Needs to be more dynamic based on the image height...
                        decoration: BoxDecoration(
                          color: !debugColors ? null : const Color(0xff7c94b6),
                          border: Border.all(
                            width: !debugColors ? 0 : 8,
                          ),
                          borderRadius:
                              !debugColors ? null : BorderRadius.circular(12),
                        ),
                        child: FutureBuilder<Size>(
                          future: calculateImageDimensionFromUrl(
                              imageUrl: viewmodel.menuItem!.imageURL),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }
                            return CachedNetworkImage(
                              imageUrl: viewmodel.menuItem!.imageURL,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              height: imageHeight,
                              width: snapshot.data!.aspectRatio * imageHeight,
                            );
                          },
                        ),
                      ),
                      // Positioned(
                      //   top: 0,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey[800]!,
                      //           offset: const Offset(0, -5),
                      //           blurRadius: 10,
                      //         )
                      //       ],
                      //       borderRadius: const BorderRadius.vertical(
                      //         top: Radius.circular(100),
                      //       ),
                      //       color: Colors.white,
                      //     ),
                      //     width: MediaQuery.of(context).size.width,
                      //     height: cardCurvatureHeight,
                      //   ),
                      // ),
                      Positioned(
                        bottom: -1,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[800]!,
                                offset: const Offset(0, -5),
                                blurRadius: 10,
                              )
                            ],
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(100),
                            ),
                            color: !debugColors
                                ? Theme.of(context).canvasColor
                                : Colors.yellow,
                            // color: Theme.of(context).canvasColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: cardCurvatureHeight,
                        ),
                      ),
                    ],
                  ),
                  if (debugColors)
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color: Colors.redAccent[400],
                      child: Text('SizedBox'),
                    ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    margin: const EdgeInsets.only(
                      // * THis doesnt help as th
                      top: !debugColors ? 0 : 60,
                    ),
                    color: !debugColors
                        ? Theme.of(context).canvasColor
                        : Colors.transparent,
                    child: ColoredBox(
                      color: !debugColors ? Colors.white : Colors.lightGreen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            viewmodel.menuItem!.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            viewmodel.totalPrice.formattedGBPPrice,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            parseHtmlString(viewmodel.menuItem!.description),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          if (viewmodel.loadingProductOptions)
                            const SizedBox(
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          else
                            const ProductOptionsView(),
                          const SizedBox(
                            height: detailFloatingBarHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const DetailMenuViewFloatingBar(
              detailFloatingBarHeight: detailFloatingBarHeight,
            ),
          ],
        );
      },
    );
  }
}
