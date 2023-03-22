import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class FulfilmentMethodSelector extends StatefulWidget {
  const FulfilmentMethodSelector({Key? key}) : super(key: key);

  @override
  State<FulfilmentMethodSelector> createState() =>
      _FulfilmentMethodSelectorState();
}

class _FulfilmentMethodSelectorState extends State<FulfilmentMethodSelector>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late final List<String> _tabs;

  @override
  void initState() {
    // _tabs = [
    //   'Delivery',

    // ];
    // _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void>(
      onInit: (store) {
        _tabs = [
          FulfilmentMethodType.delivery.name.capitalize(),
          FulfilmentMethodType.collection.name.capitalize(),
          FulfilmentMethodType.inStore.name.capitalizeWordsFromLowerCamelCase(),
          // ...(store.state.userState.isVendor || store.state.cartState. ? ['In Store'] : []),
        ];
        _tabController = TabController(length: _tabs.length, vsync: this);
        _tabController.addListener(
          () {
            if (_tabController.indexIsChanging) {
              store.dispatch(
                SetFulfilmentMethod(
                  fulfilmentMethodType: _tabController.index == 0
                      ? FulfilmentMethodType.delivery
                      : _tabController.index == 1
                          ? FulfilmentMethodType.collection
                          : FulfilmentMethodType.inStore,
                ),
              );
              if (_tabController.index == 0) {
                store.dispatch(
                  updateSelectedTimeSlot(
                    selectedTimeSlot: store.state.cartState.nextDeliverySlot,
                  ),
                );
              } else {
                store.dispatch(
                  updateSelectedTimeSlot(
                    selectedTimeSlot: store.state.cartState.nextCollectionSlot,
                  ),
                );
              }
              Analytics.track(
                eventName: AnalyticsEvents.switchFulfilmentMethod,
                properties: {
                  'screen': 'checkout',
                },
              );
            }
          },
        );
      },
      converter: (store) {
        _tabController.index = store.state.cartState.fulfilmentMethod ==
                FulfilmentMethodType.delivery
            ? 0
            : store.state.cartState.fulfilmentMethod ==
                    FulfilmentMethodType.collection
                ? 1
                : 2;
      },
      builder: (context, viewmodel) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: themeShade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 40,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.zero,
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: themeShade400,
                ),
                tabs: _tabs
                    .mapIndexed(
                      (index, tabName) => Text(
                        tabName,
                        style: TextStyle(
                          fontWeight: _tabController.index == index
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
