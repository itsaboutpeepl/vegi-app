import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class SearchVendorsAppBar extends StatefulWidget {
  const SearchVendorsAppBar({Key? key}) : super(key: key);

  @override
  State<SearchVendorsAppBar> createState() => _SearchVendorsAppBarState();
}

class _SearchVendorsAppBarState extends State<SearchVendorsAppBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 30,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: false,
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
                child: StoreConnector<AppState, FeaturedRestaurantsVM>(
                  converter: FeaturedRestaurantsVM.fromStore,
                  distinct: true,
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
                                  keepSuggestionsOnLoading: true,
                                  hideOnEmpty: true,
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    autocorrect: true,
                                    controller: _searchTextController,
                                    onSubmitted: (value) {
                                      viewmodel.filterVendors(
                                        query: value,
                                        outCode:
                                            viewmodel.selectedSearchPostCode,
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
                                          color: themeShade300,
                                          width: 3,
                                        ),
                                      ),
                                      fillColor: Colors.transparent,
                                      hintText: Messages.searchVegiPlaceholder,
                                    ),
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontStyle: FontStyle.italic),
                                  ),
                                  onSuggestionSelected: (String suggestion) {
                                    _searchTextController.text = suggestion;
                                    viewmodel.filterVendors(
                                      query: suggestion,
                                      outCode: viewmodel.selectedSearchPostCode,
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
                                  suggestionsCallback:
                                      (globalSearchQuery) async {
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
                                                      globalSearchQuery
                                                          .toLowerCase(),
                                                    ) ||
                                                element.category
                                                    .toLowerCase()
                                                    .contains(
                                                      globalSearchQuery
                                                          .toLowerCase(),
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
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _searchTextController.clear();
                            viewmodel.filterVendors(
                              query: '',
                              outCode: viewmodel.selectedSearchPostCode,
                            );
                            viewmodel.showGlobalSearchBarField(
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
