import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton1.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton2.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/onboard/widgets/firstOnboardingPage.dart';
import 'package:vegan_liverpool/features/onboard/widgets/on_boarding_page.dart';
import 'package:vegan_liverpool/features/onboard/widgets/sign_up_buttons.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/screens/waitingListBetaEligibilityScreen.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  static const _kDuration = Duration(milliseconds: 2000);
  static const _kCurve = Curves.ease;

  Color screenColor = Colors.white;

  double _bottomRowOpacity = 1;

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

  void nextPage() {
    if (_pageController.page!.toInt() == 4) {
      return;
    }
    _pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void previousPage() {
    if (_pageController.page!.toInt() == 0) {
      return;
    }
    _pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  final tween = MovieTween();

  @override
  Widget build(BuildContext context) {
    final List<Widget> welcomeScreens = [
      const FirstOnboardingPage(),
      const OnBoardingScreenGeneric(
        CopyWrite.onboardingScreenHeading1,
        CopyWrite.onboardingScreenSubHeading1,
        ImagePaths.onboardingScreenHeadingImage1,
      ),
      const OnBoardingScreenGeneric(
        CopyWrite.onboardingScreenHeading2,
        CopyWrite.onboardingScreenSubHeading2,
        ImagePaths.onboardingScreenHeadingImage2,
      ),
      OnBoardingScreenGeneric(
        CopyWrite.onboardingScreenHeading3,
        CopyWrite.onboardingScreenSubHeading3,
        ImagePaths.onboardingScreenHeadingImage3,
      ),
      // const SignUpButtons()
      const WaitingListBetaEligibilityScreen(),
    ];

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
                  color: _bottomRowOpacity > 0
                      ? value.get(screenColor)
                      : Colors.grey[350] ?? Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
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
                              itemBuilder: (BuildContext context, int index) =>
                                  welcomeScreens[index % welcomeScreens.length],
                            ),
                            Positioned(
                              bottom: 25,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              child: AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                opacity: _bottomRowOpacity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: previousPage,
                                      child: CustomPaint(
                                        painter: CustomButton1(),
                                        child: const SizedBox(
                                          width: 70,
                                          height: 70 * 0.7746031746031746,
                                          child: Center(
                                            child: Text(
                                              'Back',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Fat Cheeks',
                                                fontSize: 22,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.075,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Center(
                                        child: SmoothPageIndicator(
                                          controller: _pageController,
                                          count: welcomeScreens.length,
                                          effect: const JumpingDotEffect(
                                            dotWidth: 9,
                                            dotHeight: 9,
                                            activeDotColor: Color(0xFF696B6D),
                                          ),
                                          onDotClicked: gotoPage,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.075,
                                    ),
                                    GestureDetector(
                                      onTap: nextPage,
                                      child: CustomPaint(
                                        painter: CustomButton2(),
                                        child: const SizedBox(
                                          width: 75,
                                          height: 75 * 0.6551102204408818,
                                          child: Center(
                                            child: Text(
                                              'Next',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Fat Cheeks',
                                                fontSize: 22,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
