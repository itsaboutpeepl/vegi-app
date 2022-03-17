import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class CustomButton2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.02601944, size.height * 0.3042606);
    path_0.cubicTo(
        size.width * -0.07858477,
        size.height * 0.6581083,
        size.width * 0.1647846,
        size.height * 0.6467076,
        size.width * 0.1829487,
        size.height * 0.7845126);
    path_0.cubicTo(
        size.width * 0.2286553,
        size.height * 1.131271,
        size.width * 0.4785090,
        size.height * 0.9935812,
        size.width * 0.6431323,
        size.height * 0.8283682);
    path_0.cubicTo(
        size.width * 0.8178297,
        size.height * 0.6530469,
        size.width * 1.035509,
        size.height * 0.9219314,
        size.width * 0.9950982,
        size.height * 0.4978736);
    path_0.cubicTo(
        size.width * 0.9661182,
        size.height * 0.1937661,
        size.width * 0.6760020,
        size.height * -0.1209560,
        size.width * 0.5288016,
        size.height * 0.04672383);
    path_0.cubicTo(
        size.width * 0.2582385,
        size.height * 0.3549260,
        size.width * 0.1996084,
        size.height * -0.2829426,
        size.width * 0.02601944,
        size.height * 0.3042606);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = themeAccent600;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
