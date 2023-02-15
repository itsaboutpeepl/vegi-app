import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton1.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton2.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/screens/scan_product_suggestion_qrcode.dart';
import 'package:vegan_liverpool/features/veganHome/screens/suggestionAdditionalInfoScreen.dart';
import 'package:vegan_liverpool/features/veganHome/screens/suggestionPhotoScreen.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/customAppBar.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnelViewModel.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class SuggestProductFunnelScreen extends StatefulWidget {
  const SuggestProductFunnelScreen({Key? key}) : super(key: key);

  @override
  State<SuggestProductFunnelScreen> createState() =>
      _SuggestProductFunnelScreenState();
}

class _SuggestProductFunnelScreenState extends State<SuggestProductFunnelScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  static const _kDuration = Duration(milliseconds: 2000);
  static const _kCurve = Curves.ease;

  Color screenColor = Colors.white;

  double _bottomRowOpacity = 1;

  int pageCount = 2;

  final screenTypes = <ProductSuggestionImageType>[
    ProductSuggestionImageType.barCode,
    ProductSuggestionImageType.frontOfPackage,
    ProductSuggestionImageType.nutritionalInfo,
    ProductSuggestionImageType.ingredientInfo,
    ProductSuggestionImageType.teachUsMore,
  ];
  String _label(ProductSuggestionImageType psType) =>
      suggestProductPhotoDirectorLabelMap[psType]!;

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

  bool isLastPage(int surveyQuestionCount) =>
      _pageController.positions.isNotEmpty &&
      _pageController.page!.toInt() >= surveyQuestionCount;

  bool isFirstPage() =>
      _pageController.positions.isEmpty || _pageController.page!.toInt() == 0;

  void Function() nextPage(int surveyQuestionCount) {
    final pageCount = surveyQuestionCount;
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

  List<Widget> getSuggestionUploadScreens(
    BuildContext context,
  ) {
    return [
      //TODO: A screen with Title, Photo Taker, Persistent Flushbar to
      //direct user as to what photo we want that is reusable like SurveyQuestionScreen,
      ScanProductSuggestionQRCode(
        nextPage: nextPage(4),
        previousPage: previousPage(4),
      ),

      ...screenTypes.sublist(1, screenTypes.length - 1).map(
            (s) => SuggestionPhotoScreen(
              suggestion: s,
              nextPage: nextPage(4),
              previousPage: previousPage(4),
            ),
          ),

      SuggestionAdditionalInfoScreen(
        title: _label(screenTypes[screenTypes.length - 1]),
        nextPage: nextPage(4),
        previousPage: previousPage(4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final suggestionScreens = getSuggestionUploadScreens(context);
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
      appBar: CustomAppBar(
        pageTitle: _pageController.hasClients &&
                _pageController.positions.isNotEmpty
            ? _label(screenTypes[_pageController.page!.round()]).capitalize()
            : _label(screenTypes[0]).capitalize(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: CustomAnimationBuilder(
              tween: _tween, // Pass in tween
              duration: _tween.duration, // Obtain duration
              builder: (_, Movie value, child) {
                return ColoredBox(
                  color: value.get(screenColor),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: StoreConnector<AppState,
                            WaitingListFunnelViewModel>(
                          distinct: true,
                          converter: WaitingListFunnelViewModel.fromStore,
                          onInit: (store) => store
                            ..dispatch(fetchSurveyQuestions())
                            ..dispatch(CreateProductSuggestion()),
                          builder: (context, vm) {
                            return Stack(
                              children: <Widget>[
                                PageView.builder(
                                  onPageChanged: (page) {
                                    if (page ==
                                        (suggestionScreens.length - 1)) {
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
                                  itemCount: suggestionScreens.length,
                                  controller: _pageController,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          suggestionScreens[
                                              index % suggestionScreens.length],
                                ),
                                Positioned(
                                  bottom: 25,
                                  left:
                                      MediaQuery.of(context).size.width * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: AnimatedOpacity(
                                    duration: const Duration(seconds: 1),
                                    opacity: _bottomRowOpacity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: isFirstPage()
                                              ? () => context.router.pop()
                                              : previousPage(
                                                  screenTypes.length,
                                                ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        // Container(
                                        //   padding: const EdgeInsets.all(20),
                                        //   child: Center(
                                        //     child: SmoothPageIndicator(
                                        //       controller: _pageController,
                                        //       count: screenTypes.length,
                                        //       effect: const JumpingDotEffect(
                                        //         dotWidth: 9,
                                        //         dotHeight: 9,
                                        //         activeDotColor:
                                        //             Color(0xFF696B6D),
                                        //       ),
                                        //       onDotClicked: gotoPage,
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        // if (!isLastPage(screenTypes.length))
                                        //   GestureDetector(
                                        //     onTap: nextPage(screenTypes.length),
                                        //     child: CustomPaint(
                                        //       painter: CustomButton2(),
                                        //       child: SizedBox(
                                        //         width: 75,
                                        //         height: 75 * 0.6551102204408818,
                                        //         child: Center(
                                        //           child: Text(
                                        //             isLastPage(
                                        //                     screenTypes.length)
                                        //                 ? 'Finish'
                                        //                 : 'Submit',
                                        //             style: const TextStyle(
                                        //               color: Colors.white,
                                        //               fontFamily: 'Fat Cheeks',
                                        //               fontSize: 22,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   )
                                        // else
                                        //   SizedBox(
                                        //     width: MediaQuery.of(context)
                                        //             .size
                                        //             .width *
                                        //         0.075,
                                        //   ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
                                        ),
                                        GestureDetector(
                                          onTap: nextPage(screenTypes.length),
                                          child: CustomPaint(
                                            painter: CustomButton2(),
                                            child: SizedBox(
                                              width: 75,
                                              height: 75 * 0.6551102204408818,
                                              child: Center(
                                                child: Text(
                                                  isLastPage(screenTypes.length)
                                                      ? 'Finish'
                                                      : 'Skip',
                                                  style: const TextStyle(
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
