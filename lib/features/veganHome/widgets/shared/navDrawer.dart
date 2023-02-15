import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:vegan_liverpool/common/di/di.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/helpDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/logoutDialog.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/drawer.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/url.dart';

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
      builder: (_, viewmodel) {
        return Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: themeShade300,
                ),
                child: Column(
                  children: [
                    if (viewmodel.avatarUrl == '')
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/anom.png'),
                        radius: 25,
                      )
                    else
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl: viewmodel.avatarUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
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
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Hi ${viewmodel.firstName()}!',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: viewmodel.gbpxBalance,
                                children: [
                                  TextSpan(
                                    text: ' GBPx',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text.rich(
                              TextSpan(
                                text: viewmodel.pplBalance,
                                children: [
                                  TextSpan(
                                    text: ' PPL',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Scheduled Order'),
                onTap: () {
                  Analytics.track(eventName: AnalyticsEvents.viewSchOrders);
                  context.router.push(const ScheduledOrdersPage());
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.money),
              //   title: const Text('Top Up Wallet'),
              //   onTap: () {
              //     context.router.push(const TopUpScreen());
              //   },
              // ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.clockRotateLeft),
                title: const Text('My Orders'),
                onTap: () {
                  Analytics.track(eventName: AnalyticsEvents.viewAllOrders);
                  context.router.push(const AllOrdersPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Account'),
                onTap: () {
                  Analytics.track(eventName: AnalyticsEvents.viewAccount);
                  context.router.push(const ProfileScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text('FAQs'),
                onTap: () {
                  Analytics.track(eventName: AnalyticsEvents.viewFAQ);
                  context.router.push(const FAQScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.headset_mic),
                title: const Text('Contact Us'),
                onTap: () => showDialog<Widget>(
                  context: context,
                  builder: (context) => const HelpDialog(),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.help_sharp),
                title: const Text('About vegi'),
                onTap: () {
                  Analytics.track(eventName: AnalyticsEvents.viewAbout);
                  context.router.push(const AboutScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () => showDialog<Widget>(
                  context: context,
                  builder: (context) => const LogoutDialog(),
                ),
              ),
              if (kDebugMode)
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('DevTools'),
                  onTap: () => rootRouter.push(
                    ReduxStateViewer(
                      store: getIt<DevToolsStore<AppState>>(),
                    ),
                  ),
                ),

              if (kDebugMode)
                ListTile(
                  leading: const Icon(Icons.qr_code_scanner),
                  title: const Text('QR scan (DEV)'),
                  onTap: () => showDialog<Widget>(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => const SuggestProductDialog(),
                  ),
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => launchUrl(
                          'https://www.instagram.com/vegi_liverpool/',
                        ),
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            launchUrl('https://vm.tiktok.com/ZMNF3ekHX/'),
                        icon: Icon(
                          FontAwesomeIcons.tiktok,
                          color: Colors.grey[400],
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () => launchUrl('https://vegiapp.co.uk'),
                        icon: Icon(
                          Icons.launch,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
