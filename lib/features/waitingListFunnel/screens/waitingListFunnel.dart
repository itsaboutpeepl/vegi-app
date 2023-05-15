import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton1.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton2.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/registerEmailWaitingListPage.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/surveyQuestionScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/surveyThanksScreen.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListPositionInQueuePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnel/waitingListFunnelViewModel.dart';

class WaitingListFunnelScreen extends StatefulWidget {
  const WaitingListFunnelScreen({Key? key}) : super(key: key);

  @override
  State<WaitingListFunnelScreen> createState() =>
      _WaitingListFunnelScreenState();
}

class _WaitingListFunnelScreenState extends State<WaitingListFunnelScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  static const _kDuration = Duration(milliseconds: 2000);
  static const _kCurve = Curves.ease;

  Color screenColor = Colors.white;

  double _bottomRowOpacity = 1;

  int pageCount = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void gotoPage(int page) {
    _pageController.animateToPage(
      page,
      duration: _kDuration,
      curve: _kCurve,
    );
  }

  void Function() nextPage(int surveyQuestionCount) {
    final pageCount = surveyQuestionCount + 2;
    return () {
      if (_pageController.page!.toInt() >= pageCount) {
        return;
      }
      _pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    };
  }

  void Function() previousPage(int surveyQuestionCount) {
    return () {
      if (_pageController.page!.toInt() <= 0) {
        return;
      }
      _pageController.previousPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    };
  }

  final tween = MovieTween();

  List<Widget> getWelcomeScreens(
    BuildContext context,
    WaitingListFunnelViewModel viewmodel,
  ) {
    return [
      if (viewmodel.email.isEmpty)
        RegisterEmailWaitingListScreen(
          onSubmitEmail: nextPage(viewmodel.surveyQuestions.length),
        ),
      const WaitingListPositionInQueuePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final _tween = MovieTween()
      ..scene(begin: Duration.zero, duration: const Duration(seconds: 1)).tween(
        screenColor,
        ColorTween(begin: themeShade200, end: themeShade700),
      )
      ..scene(
        begin: const Duration(seconds: 1),
        end: const Duration(seconds: 3),
      ).tween(
        screenColor,
        ColorTween(begin: themeShade700, end: themeShade1100),
      )
      ..scene(
        begin: const Duration(seconds: 3),
        duration: const Duration(seconds: 1),
      ).tween(
        screenColor,
        ColorTween(begin: themeShade1100, end: themeShade1200),
      );
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: CustomAnimationBuilder(
              tween: _tween, // Pass in tween
              duration: _tween.duration, // Obtain duration
              builder: (_, Movie value, child) {
                return ColoredBox(
                  color: Colors.grey[300]!,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: StoreConnector<AppState,
                            WaitingListFunnelViewModel>(
                          distinct: true,
                          converter: WaitingListFunnelViewModel.fromStore,
                          onInit: (store) => store
                            ..dispatch(fetchSurveyQuestions())
                            ..dispatch(isBetaWhitelistedAddress()),
                          builder: (context, vm) {
                            final welcomeScreens =
                                getWelcomeScreens(context, vm);

                            return Stack(
                              children: <Widget>[
                                PageView.builder(
                                  onPageChanged: (page) {
                                    if (page == (welcomeScreens.length - 1)) {
                                      setState(() {
                                        _bottomRowOpacity = 0;
                                      });
                                    } else {
                                      setState(() {
                                        _bottomRowOpacity = 1;
                                      });
                                    }
                                  },
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: welcomeScreens.length,
                                  controller: _pageController,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          welcomeScreens[
                                              index % welcomeScreens.length],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
