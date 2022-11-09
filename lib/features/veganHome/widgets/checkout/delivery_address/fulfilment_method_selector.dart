import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class FulfilmentMethodSelector extends StatefulWidget {
  const FulfilmentMethodSelector({Key? key}) : super(key: key);

  @override
  State<FulfilmentMethodSelector> createState() =>
      _FulfilmentMethodSelectorState();
}

class _FulfilmentMethodSelectorState extends State<FulfilmentMethodSelector>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
        _tabController.addListener(
          () {
            if (_tabController.indexIsChanging) {
              store.dispatch(
                updateSelectedTimeSlot(
                  isDelivery: _tabController.index == 0,
                  selectedTimeSlot: _tabController.index == 0
                      ? store.state.cartState.nextDeliverySlot!
                      : store.state.cartState.nextCollectionSlot!,
                ),
              );
            }
          },
        );
      },
      converter: (store) {
        _tabController.index = store.state.cartState.isDelivery ? 0 : 1;
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
                tabs: [
                  Text(
                    'Delivery',
                    style: TextStyle(
                      fontWeight: _tabController.index == 0
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Collection',
                    style: TextStyle(
                      fontWeight: _tabController.index == 1
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
