import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/restaurant/restaurantItem.dart';
import 'package:vegan_liverpool/redux/viewsmodels/restaurantItem.dart';

class ConfirmSwitchRestaurant extends StatefulWidget {
  const ConfirmSwitchRestaurant({Key? key, required this.restaurantItem})
      : super(key: key);
  final RestaurantItem restaurantItem;

  @override
  State<ConfirmSwitchRestaurant> createState() =>
      _ConfirmSwitchRestaurantState();
}

class _ConfirmSwitchRestaurantState extends State<ConfirmSwitchRestaurant>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool isPreloading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        content: Container(
            padding: const EdgeInsets.all(10),
            child: StoreConnector<AppState, RestaurantItemViewModel>(
              converter: RestaurantItemViewModel.fromStore,
              builder: (context, viewmodel) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'You have existing items'
                      ' in cart from ${viewmodel.restaurantName}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Do you want to remove these items?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        PrimaryButton(
                          onPressed: () {
                            viewmodel.updateRestaurantDetails(
                              restaurantItem: widget.restaurantItem,
                              clearCart: true,
                            );
                            context.router.pop();
                            context.router.push(
                              RestaurantMenuScreen(
                                menuList: widget.restaurantItem.listOfMenuItems,
                              ),
                            );
                          },
                          label: 'Yes',
                          width: width * 0.3,
                          height: 40,
                        ),
                        const Spacer(),
                        PrimaryButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          label: 'No',
                          width: width * 0.3,
                          height: 40,
                        ),
                      ],
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
