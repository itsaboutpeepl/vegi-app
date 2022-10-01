import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/address/outcodeCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/featuredRestaurantsVM.dart';

class DeliveryMapViewFloatingBar extends StatefulWidget {
  final String selectedOutCode;
  const DeliveryMapViewFloatingBar({Key? key, required this.selectedOutCode})
      : super(key: key);

  @override
  _DeliveryMapViewFloatingBarState createState() =>
      _DeliveryMapViewFloatingBarState();
}

class _DeliveryMapViewFloatingBarState
    extends State<DeliveryMapViewFloatingBar> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeaturedRestaurantsVM>(
      converter: FeaturedRestaurantsVM.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Positioned(
          bottom: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: themeShade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[800]!,
                      offset: Offset(0, -5),
                      blurRadius: 10,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: OutcodeCard(postalCode: widget.selectedOutCode)),
              ),
              // Positioned(
              //   top: -45,
              //   left: (MediaQuery.of(context).size.width * 0.5) - 45,
              //   child: FlippyCircle(
              //     rewardAmount: viewmodel.itemReward.toStringAsFixed(0),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
