import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/switchDeliveryCollectionModal.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';

class VeganSliverAppBar extends StatefulWidget {
  const VeganSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _VeganSliverAppBarState createState() => _VeganSliverAppBarState();
}

class _VeganSliverAppBarState extends State<VeganSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          floating: false,
          pinned: false,
          snap: false,
          centerTitle: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.1,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colorToWhiteGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  SwitchDeliveryCollectionModal(),
                            ),
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              color: greyShade50,
                              child: Row(
                                children: [
                                  Text(
                                    viewmodel.isDelivery
                                        ? "Delivery (${viewmodel.selectedPostalCode})"
                                        : "Collection",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      color: themeShade600)
                                ],
                              ),
                            ),
                          ),
                        ),
                        // GestureDetector(
                        //   //TODO: Remove in favour of a modal bottom view
                        //   onTap: () {
                        //     viewmodel.setIsDelivery(!viewmodel.isDelivery);
                        //   },
                        //   child: Text(
                        //     viewmodel.isDelivery
                        //         ? "Switch to Collection"
                        //         : "Switch to Delivery",
                        //     style: TextStyle(
                        //       color: Colors.grey,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Spacer(),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: viewmodel.avatarUrl.isNotEmpty
                                  ? CachedNetworkImage(
                                width: 40,
                                height: 40,
                                imageUrl: viewmodel.avatarUrl,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/anom.png'),
                                  radius: 30,
                                ),
                                imageBuilder: (context, imageProvider) => Image(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/anom.png'),
                                      radius: 30,
                                    ),
                            ),
                            viewmodel.listOfScheduledOrders.length > 0
                                ? Positioned(
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: themeAccent500,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 10,
                                      height: 10,
                                    ),
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
          ),
        );
      },
    );
  }
}
