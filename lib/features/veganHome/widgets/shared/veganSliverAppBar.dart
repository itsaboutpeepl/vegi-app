import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
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
  String _dropdownValue = 'L1';
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!viewmodel.globalSearchIsVisible) ...[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                viewmodel.isDelivery
                                    ? viewmodel.userLocationEnabled
                                        ? 'Delivery'
                                        : 'Delivering To '
                                    : 'Collection',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              if (viewmodel.isDelivery &&
                                  !viewmodel.userLocationEnabled)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.5),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.3,
                                    alignment: Alignment.centerLeft,
                                    isDense: true,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontFamily: 'Europa',
                                    ),
                                    value: _dropdownValue,
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
                                        _dropdownValue = value!;
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
                                eventName:
                                    AnalyticsEvents.switchFulfilmentMethod,
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
                    ] else
                      Expanded(
                        child: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.teal.shade900,
                            size: 28,
                          ),
                          title: TypeAheadField<String>(
                            keepSuggestionsOnLoading: true,
                            hideOnEmpty: true,
                            textFieldConfiguration: TextFieldConfiguration(
                              autocorrect: true,
                              controller: _searchTextController,
                              onSubmitted: (value) {
                                viewmodel.filterVendors(
                                  query: value,
                                  outCode: _dropdownValue,
                                );
                              },
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeShade300, width: 3),
                                ),
                                fillColor: Colors.transparent,
                                hintText: 'Search vegi...',
                              ),
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontStyle: FontStyle.italic),
                            ),
                            onSuggestionSelected: (String suggestion) {
                              _searchTextController.text = suggestion;
                              viewmodel.filterVendors(
                                query: suggestion,
                                outCode: _dropdownValue,
                              );
                            },
                            itemBuilder: (context, String suggestion) {
                              return ListTile(title: Text(suggestion));
                            },
                            noItemsFoundBuilder: (context) {
                              return const ListTile(
                                title: Text('No items found!'),
                              );
                            },
                            loadingBuilder: (_) =>
                                const CircularProgressIndicator(
                              color: themeShade600,
                            ),
                            debounceDuration: const Duration(
                              milliseconds: 300,
                            ),
                            suggestionsCallback: (globalSearchQuery) async {
                              if (globalSearchQuery.isNotEmpty) {
                                final result = <String>[];
                                try {
                                  final featuredRestaurants =
                                      viewmodel.featuredRestaurants;
                                  final matchingNamedRestaurants =
                                      featuredRestaurants.where(
                                    (element) {
                                      return element.name
                                              .toLowerCase()
                                              .contains(
                                                globalSearchQuery.toLowerCase(),
                                              ) ||
                                          element.category
                                              .toLowerCase()
                                              .contains(
                                                globalSearchQuery.toLowerCase(),
                                              );
                                    },
                                  ).toList();

                                  result.addAll(
                                    matchingNamedRestaurants.map(
                                      (e) => e.name,
                                    ),
                                  );

                                  // final List<RestaurantItem>
                                  //     filteredRestaurants =
                                  //     await peeplEatsService
                                  //         .getFilteredRestaurants(
                                  //   outCode: _dropdownValue,
                                  //   globalSearchQuery: globalSearchQuery,
                                  // );

                                  // result.addAll(
                                  //   filteredRestaurants.map(
                                  //     (e) => e.name,
                                  //   ),
                                  // );
                                  return result;
                                } catch (e, s) {
                                  log.error(
                                      'ERROR - query vendors items from search bar: $e');
                                  await Sentry.captureException(
                                    e,
                                    stackTrace: s,
                                    hint:
                                        'ERROR - query vendors items from search bar: $e',
                                  );
                                  return [];
                                }
                              } else {
                                return [];
                              }
                            },
                          ),
                        ),
                      ),
                    IconButton(
                      onPressed: () {
                        _searchTextController.clear();
                        viewmodel.filterVendors(
                          query: '',
                          outCode: _dropdownValue,
                        );
                        viewmodel.showGlobalSearchBarField(
                          makeVisible: !viewmodel.globalSearchIsVisible,
                        );
                      },
                      icon: viewmodel.globalSearchIsVisible
                          ? const Icon(Icons.cancel)
                          : const Icon(Icons.search),
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
                            ),
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
