import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/helpDialog.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class VeganSliverAppBar extends StatefulWidget {
  const VeganSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<VeganSliverAppBar> createState() => _VeganSliverAppBarState();
}

class _VeganSliverAppBarState extends State<VeganSliverAppBar> {
  Icon customIcon = const Icon(Icons.search);
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      onInitialBuild: (viewmodel) {
        viewmodel.showGlobalSearchBarField(
          makeVisible: false,
        );
      },
      builder: (_, viewmodel) {
        return SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.1,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colorToWhiteGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              viewmodel.isDelivery
                                  ? 'Delivering To '
                                  : 'Collection',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (viewmodel.isDelivery)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 1.5),
                                child: DropdownButton<String>(
                                  menuMaxHeight:
                                      MediaQuery.of(context).size.height * 0.3,
                                  alignment: Alignment.centerLeft,
                                  isDense: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: 'Europa',
                                  ),
                                  value: viewmodel.selectedSearchPostCode,
                                  borderRadius: BorderRadius.circular(10),
                                  underline: const SizedBox.shrink(),
                                  items: viewmodel.postalCodes
                                      .map(
                                        (value) => DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      viewmodel.updateSelectedSearchPostalCode(
                                          value!);
                                      viewmodel.changeOutCode(value);
                                      Analytics.track(
                                        eventName:
                                            AnalyticsEvents.changeOutcode,
                                        properties: {'screen': 'home'},
                                      );
                                    });
                                  },
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Analytics.track(
                              eventName: AnalyticsEvents.switchFulfilmentMethod,
                              properties: {'screen': 'home'},
                            );
                            viewmodel.setIsDelivery(!viewmodel.isDelivery);
                          },
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide()),
                            ),
                            child: Text(
                              viewmodel.isDelivery
                                  ? 'Switch to collection'
                                  : 'Switch to delivery',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    if (!viewmodel.globalSearchIsVisible)
                      IconButton(
                        onPressed: () {
                          _searchTextController.clear();
                          viewmodel.filterVendors(
                            query: '',
                            outCode: viewmodel.selectedSearchPostCode,
                          );
                          viewmodel.showGlobalSearchBarField(
                            makeVisible: true,
                          );
                        },
                        icon: const Icon(Icons.search),
                        padding: const EdgeInsets.all(4),
                      ),
                    IconButton(
                      onPressed: () => showDialog<Widget>(
                        context: context,
                        builder: (context) => const HelpDialog(),
                      ),
                      icon: const Icon(Icons.headset_mic),
                      padding: const EdgeInsets.all(4),
                      // icon: const Icon(Icons.contact_support),
                      // icon: const Icon(Icons.live_help),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 3,
                      child: GestureDetector(
                        onTap: () {
                          Analytics.track(
                            eventName: AnalyticsEvents.openDrawer,
                          );
                          Scaffold.of(context).openDrawer();
                        },
                        child: Stack(
                          children: [
                            if (viewmodel.avatarUrl == '')
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/anom.png'),
                                radius: 23,
                              )
                            else
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  width: 40,
                                  height: 40,
                                  imageUrl: viewmodel.avatarUrl,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/anom.png'),
                                    radius: 30,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Image(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            if (viewmodel.listOfScheduledOrders.isNotEmpty)
                              Positioned(
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: themeAccent500,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 10,
                                  height: 10,
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
