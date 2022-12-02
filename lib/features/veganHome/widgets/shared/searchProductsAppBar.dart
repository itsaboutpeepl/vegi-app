import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SearchProductsAppBar extends StatefulWidget {
  const SearchProductsAppBar({Key? key}) : super(key: key);

  @override
  State<SearchProductsAppBar> createState() => _SearchProductsAppBarState();
}

class _SearchProductsAppBarState extends State<SearchProductsAppBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 30,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.01,
      flexibleSpace: FlexibleSpaceBar(
        title: GestureDetector(
          onTap: () {
            // do nothing
          },
          child: Card(
            color: themeShade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: themeShade900,
                width: 2,
              ),
            ),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: StoreConnector<AppState, RestaurantItemViewModel>(
                  converter: RestaurantItemViewModel.fromStore,
                  distinct: true,
                  onInitialBuild: (viewmodel) {
                    viewmodel.filterRestaurantMenu(query: '');
                  },
                  builder: (_, viewmodel) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.teal.shade900,
                                  size: 28,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: TypeAheadField<String>(
                                  hideOnEmpty: true,
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
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
                                        borderSide:
                                            BorderSide(color: Colors.grey),
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
                                    viewmodel.filterRestaurantMenu(
                                        query: suggestion);
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
                                                      menuSearchQuery
                                                          .toLowerCase(),
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
                                                            element
                                                                .menuItemID ==
                                                            already
                                                                .menuItemID) ==
                                                    -1 &&
                                                (element.listOfProductOptions
                                                    .any(
                                                  (productOptionCategory) =>
                                                      productOptionCategory.name
                                                          .toLowerCase()
                                                          .contains(menuSearchQuery
                                                              .toLowerCase()) ||
                                                      productOptionCategory
                                                          .listOfOptions
                                                          .any(
                                                        (productOption) =>
                                                            productOption.name
                                                                .toLowerCase()
                                                                .contains(
                                                                    menuSearchQuery
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
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _searchTextController.clear();
                            viewmodel.filterRestaurantMenu(
                              query: '',
                            );
                            viewmodel.showMenuSearchBarField(
                              makeVisible: false,
                            );
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
