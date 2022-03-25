// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.7746031746031746).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

import 'package:flutter/material.dart';

class CustomButton1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6139016, size.height * 0.8484549);
    path_0.cubicTo(
        size.width * 0.7390159,
        size.height * 0.7603197,
        size.width * 0.8292032,
        size.height * 0.8508320,
        size.width * 0.9071111,
        size.height * 0.8000410);
    path_0.cubicTo(
        size.width * 1.103152,
        size.height * 0.6722459,
        size.width * 0.9605206,
        size.height * 0.3032881,
        size.width * 0.7402032,
        size.height * 0.2889160);
    path_0.cubicTo(
        size.width * 0.5198889,
        size.height * 0.2745443,
        size.width * 0.6726698,
        size.height * 0.05444877,
        size.width * 0.4147079,
        size.height * 0.005615041);
    path_0.cubicTo(
        size.width * 0.1567448,
        size.height * -0.04321885,
        size.width * -0.04628698,
        size.height * 0.6141844,
        size.width * 0.01360527,
        size.height * 0.8654057);
    path_0.cubicTo(
        size.width * 0.07349746,
        size.height * 1.116627,
        size.width * 0.4575111,
        size.height * 0.9586189,
        size.width * 0.6139016,
        size.height * 0.8484549);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
