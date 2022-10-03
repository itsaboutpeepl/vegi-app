import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/peaman.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/shape1.dart';

class FirstOnboardingPage extends StatefulWidget {
  const FirstOnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstOnboardingPage> createState() => _FirstOnboardingPageState();
}

class _FirstOnboardingPageState extends State<FirstOnboardingPage> {
  double? _left = null;
  double? _top = null;
  double _width = 200;
  double? _opacity = null;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _left = MediaQuery.of(context).size.width * 0.6;
        _top = MediaQuery.of(context).size.height * 0.1;
        _width = 150;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -30,
          top: 0,
          child: CustomPaint(
            size: Size(
                200,
                (200 * 0.9019230769230769)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: Shape1(),
          ),
        ),
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          left: _left ?? MediaQuery.of(context).size.width * 0.2,
          top: _top ?? MediaQuery.of(context).size.height * 0.3,
          child: CustomPaint(
            size: Size(_width, _width * 1.1484641638225255),
            painter: PeamanPainter(),
          ),
          duration: Duration(seconds: 2),
          onEnd: () {
            setState(() {
              _opacity = 1;
            });
          },
        ),
        AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _opacity ?? 0,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/Vegi-Logo-horizontal.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
        )
      ],
    );
  }
}
