import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/detailMenuViewFloatingBar.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/productOptionsView.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/menu_item_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/detailMenuItem.dart';

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
        }
      },
      builder: (_, viewmodel) {
        if (viewmodel.menuItem == null) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: CachedNetworkImage(
                          imageUrl: viewmodel.menuItem!.imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                top: Radius.circular(100)),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewmodel.menuItem!.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cFPrice(viewmodel.totalPrice),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
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
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const DetailMenuViewFloatingBar(),
          ],
        );
      },
    );
  }
}
