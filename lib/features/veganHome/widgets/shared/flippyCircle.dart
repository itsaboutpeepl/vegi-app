import 'dart:math';
import 'package:flutter/material.dart';

class FlippyCircle extends StatefulWidget {
  const FlippyCircle({Key? key, required this.rewardAmount}) : super(key: key);

  final String rewardAmount;

  @override
  _FlippyCircleState createState() => _FlippyCircleState();
}

class _FlippyCircleState extends State<FlippyCircle> {
  bool _showFrontSide = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return Container(
      key: ValueKey(true),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // #E7352D
        color: Color(0xFF313131),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(
            //   "",
            //   style: TextStyle(color: Colors.white),
            // ),
            Text(
              "Earn",
              style: TextStyle(
                color: Color(0xFFf4f2eb),
                fontWeight: FontWeight.w900,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Image.asset(
              "assets/images/avatar-ppl-cream.png",
              width: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRear() {
    return Container(
      key: ValueKey(false),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // #E7352D
        color: Color.fromARGB(255, 255, 0, 0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(
            //   "",
            //   style: TextStyle(color: Colors.white),
            // ),
            Text(
              widget.rewardAmount,
              style: TextStyle(
                color: Color(0xFFf4f2eb),
                fontWeight: FontWeight.w900,
                fontSize: 23,
                fontFamily: "Indie Flower",
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Image.asset(
              "assets/images/avatar-ppl-cream.png",
              width: 35,
            ),
          ],
        ),
      ),
    );
  }
}
