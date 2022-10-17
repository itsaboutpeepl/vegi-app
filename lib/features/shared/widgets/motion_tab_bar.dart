import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:vegan_liverpool/features/shared/widgets/TabItem.dart';

typedef MotionTabBuilder = Widget Function();

const int _animDuration = 500;

class MotionTabBar extends StatefulWidget {
  MotionTabBar({
    Key? key,
    required this.textStyle,
    required this.tabIconColor,
    required this.tabSelectedColor,
    required this.onTabItemSelected,
    required this.initialSelectedTab,
    required this.labels,
    required this.icons,
  })  : assert(labels.contains(initialSelectedTab), 'Initial tab not selected'),
        super(key: key);

  final Color tabIconColor, tabSelectedColor;
  final TextStyle textStyle;
  final void Function(int) onTabItemSelected;
  final String initialSelectedTab;
  final List<String> labels;
  final List<IconData> icons;

  @override
  State<MotionTabBar> createState() => _MotionTabBarState();
}

class _MotionTabBarState extends State<MotionTabBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _positionTween;
  late Animation<double> _positionAnimation;

  late AnimationController _fadeOutController;
  late Animation<double> _fadeFabOutAnimation;
  late Animation<double> _fadeFabInAnimation;

  List<String> labels = [];
  Map<String, IconData> icons = {};

  int get tabAmount => icons.keys.length;
  int get index => labels.indexOf(selectedTab);
  double get position {
    final double pace = 2 / (labels.length - 1);
    return (pace * index) - 1;
  }

  double fabIconAlpha = 1;
  late IconData activeIcon;
  late String selectedTab;

  @override
  void initState() {
    super.initState();

    labels = widget.labels;
    icons = {
      for (var label in labels) label: widget.icons[labels.indexOf(label)]
    };

    selectedTab = widget.initialSelectedTab;
    activeIcon = icons[selectedTab]!;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: _animDuration),
      vsync: this,
    );

    _fadeOutController = AnimationController(
      duration: const Duration(milliseconds: _animDuration ~/ 5),
      vsync: this,
    );

    _positionTween = Tween<double>(begin: position, end: 1);

    _positionAnimation = _positionTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut),
    )
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = icons[selectedTab]!;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.8, 1, curve: Curves.easeOut),
      ),
    )..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -1),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: generateTabItems(),
          ),
        ),
        IgnorePointer(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Align(
              heightFactor: 0,
              alignment: Alignment(_positionAnimation.value, 0),
              child: FractionallySizedBox(
                widthFactor: 1 / tabAmount,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: ClipRect(
                        clipper: HalfClipper(),
                        child: Center(
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: 90,
                      child: CustomPaint(painter: HalfPainter()),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.tabSelectedColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                            style: BorderStyle.none,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> generateTabItems() {
    return labels.map((tabLabel) {
      return TabItem(
        selected: selectedTab == tabLabel,
        iconData: icons[tabLabel]!,
        title: tabLabel,
        textStyle: widget.textStyle,
        tabSelectedColor: widget.tabSelectedColor,
        tabIconColor: widget.tabIconColor,
        callbackFunction: () {
          setState(() {
            activeIcon = icons[tabLabel]!;
            selectedTab = tabLabel;
            widget.onTabItemSelected(index);
          });
          _initAnimationAndStart(_positionAnimation.value, position);
        },
      );
    }).toList();
  }

  void _initAnimationAndStart(double from, double to) {
    _positionTween
      ..begin = from
      ..end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height / 2);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class HalfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path()
      ..arcTo(beforeRect, vector.radians(0), vector.radians(90), false)
      ..lineTo(20, size.height / 2)
      ..arcTo(largeRect, vector.radians(0), -vector.radians(180), false)
      ..moveTo(size.width - 10, size.height / 2)
      ..lineTo(size.width - 10, (size.height / 2) - 10)
      ..arcTo(afterRect, vector.radians(180), vector.radians(-90), false)
      ..close();

    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
