import 'dart:ui';

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/balance.dart';
import 'package:vegan_liverpool/redux/viewsmodels/drawer.dart';
import 'package:vegan_liverpool/redux/viewsmodels/header.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DrawerViewModel>(
      distinct: true,
      converter: DrawerViewModel.fromStore,
      builder: (_, viewModel) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      width: 50,
                      height: 50,
                      imageUrl: viewModel.avatarUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundImage: AssetImage('assets/images/anom.png'),
                        radius: 30,
                      ),
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hi ${viewModel.firstName()}!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              viewModel.gbpxBalance,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'GBPx',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Text(
                              viewModel.pplBalance,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'PPL',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                ),
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text('TopUp'),
                onTap: () {
                  context.router.push(TopupScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(' Settings'),
                onTap: () => context.router.push(ProfileScreen()),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  viewModel.logout();
                  context.router.replace(OnBoardScreen());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
