import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/userCart.dart';

class VeganSliverAppBar extends StatelessWidget {
  const VeganSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserCartViewModel>(
        converter: UserCartViewModel.fromStore,
        distinct: true,
        builder: (_, viewModel) {
          return SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            floating: false,
            pinned: false,
            snap: false,
            centerTitle: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.07,
            flexibleSpace: FlexibleSpaceBar(
              background: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 60,
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(40),
                        elevation: 3,
                        child: GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CachedNetworkImage(
                            width: 50,
                            height: 50,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: viewModel.gbpXBalance,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                              children: [
                                TextSpan(
                                  text: " GBPx",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: viewModel.pplBalance,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                              children: [
                                TextSpan(
                                  text: " PPL",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
          );
        });
  }
}
