import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class VeganSliverAppBar extends StatefulWidget {
  const VeganSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _VeganSliverAppBarState createState() => _VeganSliverAppBarState();
}

class _VeganSliverAppBarState extends State<VeganSliverAppBar> {
  String _dropdownValue = "L1";
  bool _isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
        converter: UserCartViewModel.fromStore,
        distinct: true,
        builder: (_, viewModel) {
          return SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            floating: false,
            pinned: false,
            snap: false,
            centerTitle: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.09,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: colorToWhiteGradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3, 0.5, 0.7, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                                _isDelivery
                                    ? "Delivering To "
                                    : "Collecting From ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 1.5),
                                child: DropdownButton<String>(
                                  alignment: Alignment.centerLeft,
                                  isDense: true,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontFamily: "Europa",
                                  ),
                                  value: _dropdownValue,
                                  borderRadius: BorderRadius.circular(10),
                                  underline: SizedBox.shrink(),
                                  items: <String>["L1", "L2", "L3"]
                                      .map(
                                        (value) => DropdownMenuItem<String>(
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          value: value,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _dropdownValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDelivery = !_isDelivery;
                              });
                            },
                            child: Text(
                              _isDelivery
                                  ? "Switch to Collection"
                                  : "Switch to Delivery",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 3,
                        child: GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CachedNetworkImage(
                            width: 40,
                            height: 40,
                            imageUrl: viewModel.avatarUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/anom.png'),
                              radius: 30,
                            ),
                            imageBuilder: (context, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      // Spacer(),
                      // Icon(
                      //   Icons.delivery_dining,
                      //   color: Colors.grey[600],
                      //   size: 30,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10.0),
                      //   child: Icon(
                      //     Icons.location_on,
                      //     color: Colors.grey[600],
                      //     size: 30,
                      //   ),
                      // )
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 12.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text.rich(
                      //         TextSpan(
                      //           text: "GBPx  ",
                      //           style: TextStyle(
                      //             color: Colors.grey,
                      //             fontWeight: FontWeight.w400,
                      //             fontSize: 16,
                      //           ),
                      //           children: [
                      //             TextSpan(
                      //               text: "72.18",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w900,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Text.rich(
                      //         TextSpan(
                      //           text: "PPL  ",
                      //           style: TextStyle(
                      //             color: Colors.grey,
                      //             fontWeight: FontWeight.w400,
                      //             fontSize: 16,
                      //           ),
                      //           children: [
                      //             TextSpan(
                      //               text: "52.21",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w900,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
          );
        });
  }
}
