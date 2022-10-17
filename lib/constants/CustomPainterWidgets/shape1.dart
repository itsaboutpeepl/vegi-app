import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.9019230769230769).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

// ignore_for_file: cascade_invocations, require_trailing_commas, non_constant_identifier_names, lines_longer_than_80_chars

//Copy this CustomPainter code to the Bottom of the File
class Shape1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.9979711, size.height * -0.1525910);
    path_0.cubicTo(
        size.width * 0.9819461,
        size.height * -0.4429211,
        size.width * 0.5571946,
        size.height * -0.1100429,
        size.width * 0.4592717,
        size.height * -0.1767582);
    path_0.cubicTo(
        size.width * 0.2128690,
        size.height * -0.3446354,
        size.width * -0.1659410,
        size.height * -0.06865693,
        size.width * -0.04307437,
        size.height * 0.2255650);
    path_0.cubicTo(
        size.width * 0.07979249,
        size.height * 0.5197846,
        size.width * -0.2297225,
        size.height * 0.4694606,
        size.width * -0.1170676,
        size.height * 0.8353412);
    path_0.cubicTo(
        size.width * -0.004412023,
        size.height * 1.201222,
        size.width * 0.9333584,
        size.height * 0.8770341,
        size.width * 0.7737881,
        size.height * 0.5910341);
    path_0.cubicTo(
        size.width * 0.5106262,
        size.height * 0.1193665,
        size.width * 1.030908,
        size.height * 0.4441599,
        size.width * 0.9979711,
        size.height * -0.1525910);
    path_0.close();

    final Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffC4FF7F).withOpacity(1);
    canvas.drawPath(path_0, paint_0_fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.9979711, size.height * -0.1525910);
    path_1.cubicTo(
        size.width * 0.9819461,
        size.height * -0.4429211,
        size.width * 0.5571946,
        size.height * -0.1100429,
        size.width * 0.4592717,
        size.height * -0.1767582);
    path_1.cubicTo(
        size.width * 0.2128690,
        size.height * -0.3446354,
        size.width * -0.1659410,
        size.height * -0.06865693,
        size.width * -0.04307437,
        size.height * 0.2255650);
    path_1.cubicTo(
        size.width * 0.07979249,
        size.height * 0.5197846,
        size.width * -0.2297225,
        size.height * 0.4694606,
        size.width * -0.1170676,
        size.height * 0.8353412);
    path_1.cubicTo(
        size.width * -0.004412023,
        size.height * 1.201222,
        size.width * 0.9333584,
        size.height * 0.8770341,
        size.width * 0.7737881,
        size.height * 0.5910341);
    path_1.cubicTo(
        size.width * 0.5106262,
        size.height * 0.1193665,
        size.width * 1.030908,
        size.height * 0.4441599,
        size.width * 0.9979711,
        size.height * -0.1525910);
    path_1.close();

    final Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.black.withOpacity(0.2);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
