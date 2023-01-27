import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/helpDialog.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class RestaurantMenuAppBar extends StatefulWidget {
  const RestaurantMenuAppBar({Key? key}) : super(key: key);

  @override
  State<RestaurantMenuAppBar> createState() => _RestaurantMenuAppBarState();
}

class _RestaurantMenuAppBarState extends State<RestaurantMenuAppBar> {
  Icon customIcon = const Icon(Icons.search);
  Widget customTitleBarField = const Text('');
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void dispose() {
    _searchTextController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RestaurantItemViewModel>(
      converter: RestaurantItemViewModel.fromStore,
      distinct: true,
      onInitialBuild: (viewmodel) {
        viewmodel.filterRestaurantMenu(query: '');
        viewmodel.showMenuSearchBarField(
          makeVisible: false,
        );
      },
      builder: (_, viewmodel) {
        return SliverAppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          pinned: true,
          titleSpacing: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: viewmodel.menuSearchIsVisible,
            titlePadding:
                const EdgeInsetsDirectional.only(bottom: 16, start: 56),
            title: !viewmodel.menuSearchIsVisible
                ? Text(viewmodel.restaurantName)
                : null,
            background: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colorToWhiteGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (viewmodel.menuSearchIsVisible)
                      Expanded(
                        child: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.teal.shade900,
                            size: 28,
                          ),
                          title: TypeAheadField<String>(
                            hideOnEmpty: true,
                            textFieldConfiguration: TextFieldConfiguration(
                              autocorrect: true,
                              controller: _searchTextController,
                              onSubmitted: (value) {
                                viewmodel.filterRestaurantMenu(
                                  query: value,
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
                              viewmodel.filterRestaurantMenu(query: suggestion);
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
                            suggestionsCallback: (menuSearchQuery) async {
                              if (menuSearchQuery.isNotEmpty) {
                                final result = <String>[];
                                try {
                                  final restaurantMenuItems =
                                      viewmodel.restaurantListOfMenuItems;
                                  final matchingNamedItems =
                                      restaurantMenuItems.where(
                                    (element) {
                                      return element.name
                                              .toLowerCase()
                                              .contains(menuSearchQuery
                                                  .toLowerCase()) ||
                                          element.categoryName
                                              .toLowerCase()
                                              .contains(
                                                menuSearchQuery.toLowerCase(),
                                              ); //TODO: Add the categoryGroup here too from stored state of all categroyGroups to productCategory ID MAP
                                    },
                                  );

                                  result.addAll(
                                    matchingNamedItems.map(
                                      (e) => e.name,
                                    ),
                                  );

                                  final matchingNamedOptionItems =
                                      restaurantMenuItems.where(
                                    (element) {
                                      return matchingNamedItems
                                                  .toList()
                                                  .indexWhere((already) =>
                                                      element.menuItemID ==
                                                      already.menuItemID) ==
                                              -1 &&
                                          (element.listOfProductOptions.any(
                                            (productOptionCategory) =>
                                                productOptionCategory.name
                                                    .toLowerCase()
                                                    .contains(menuSearchQuery
                                                        .toLowerCase()) ||
                                                productOptionCategory
                                                    .listOfOptions
                                                    .any(
                                                  (productOption) => productOption
                                                      .name
                                                      .toLowerCase()
                                                      .contains(menuSearchQuery
                                                          .toLowerCase()),
                                                ),
                                          ));
                                    },
                                  );

                                  result.addAll(
                                    matchingNamedOptionItems.map(
                                      (e) => e.name,
                                    ),
                                  );

                                  // final filteredCartItems =
                                  //     await peeplEatsService
                                  //         .getFilteredRestaurantMenu(
                                  //   restaurantID: store.state.cartState.restaurantID,
                                  //   searchQuery: searchQuery,
                                  // );

                                  return result;
                                } catch (e, s) {
                                  log.error(
                                      'ERROR - query menu items from search bar: $e');
                                  await Sentry.captureException(
                                    e,
                                    stackTrace: s,
                                    hint:
                                        'ERROR - query menu items from search bar: $e',
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
                        viewmodel.filterRestaurantMenu(
                          query: '',
                        );
                        viewmodel.showMenuSearchBarField(
                          makeVisible: !viewmodel.menuSearchIsVisible,
                        );
                      },
                      icon: viewmodel.menuSearchIsVisible
                          ? const Icon(Icons.cancel)
                          : const Icon(Icons.search),
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
