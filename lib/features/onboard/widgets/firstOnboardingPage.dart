import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/peaman.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/shape1.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/splash.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class FirstOnboardingPage extends StatefulWidget {
  const FirstOnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstOnboardingPage> createState() => _FirstOnboardingPageState();
}

class _FirstOnboardingPageState extends State<FirstOnboardingPage> {
  double? _left;
  double? _top;
  double _width = 200;
  double? _opacity;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    // Future.delayed(const Duration(seconds: 1), () {
    //   setState(() {
    //     _left = MediaQuery.of(context).size.width * 0.6;
    //     _top = MediaQuery.of(context).size.height * 0.1;
    //     _width = 150;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SplashViewModel>(
      converter: SplashViewModel.fromStore,
      // onInit: (store) => store.state.userState.isLoggedOut
      //     ? null
      //     : store.dispatch(
      //         initFuseWallet(),
      //       ),
      distinct: true,
      // onWillChange: (previousViewModel, newViewModel) async {
      //   final checked = checkAuth(
      //     oldViewModel: previousViewModel,
      //     newViewModel: newViewModel,
      //     routerContext: context,
      //   );
      //   await checked.runNavigationIfNeeded();
      // },
      builder: (context, viewModel) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(
                255,
                248,
                251,
                244,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImagePaths.onboardingPage1Background,
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: -30,
          //   top: 0,
          //   child: CustomPaint(
          //     size: const Size(
          //       200,
          //       200 * 0.9019230769230769,
          //     ),
          //     painter: Shape1(),
          //   ),
          // ),
          // AnimatedPositioned(
          //   curve: Curves.fastLinearToSlowEaseIn,
          //   left: _left ?? MediaQuery.of(context).size.width * 0.2,
          //   top: _top ?? MediaQuery.of(context).size.height * 0.3,
          //   duration: const Duration(seconds: 2),
          //   onEnd: () {
          //     setState(() {
          //       _opacity = 1;
          //     });
          //   },
          //   child: CustomPaint(
          //     size: Size(_width, _width * 1.1484641638225255),
          //     painter: PeamanPainter(),
          //   ),
          // ),
          AnimatedOpacity(
            // curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(seconds: 1),
            opacity: _opacity ?? 0,
            child: Align(
              child: Image.asset(
                // 'assets/images/Vegi-Logo-horizontal.png',
                ImagePaths.onboardingPage1VegiText,
                width: MediaQuery.of(context).size.width * .4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
