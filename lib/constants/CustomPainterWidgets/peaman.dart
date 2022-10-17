import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1.1484641638225255).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

// ignore_for_file: cascade_invocations, require_trailing_commas, non_constant_identifier_names, lines_longer_than_80_chars

//Copy this CustomPainter code to the Bottom of the File
class PeamanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.4182918, size.height * 0.8373284);
    path_0.cubicTo(
        size.width * 0.2563020,
        size.height * 0.7139896,
        size.width * 0.1911229,
        size.height * 0.4760579,
        size.width * 0.1794369,
        size.height * 0.3576300);
    path_0.cubicTo(
        size.width * 0.1527391,
        size.height * 0.08706062,
        size.width * 0.5564761,
        size.height * -0.09111501,
        size.width * 0.6286741,
        size.height * 0.2212467);
    path_0.cubicTo(
        size.width * 0.6667765,
        size.height * 0.3860892,
        size.width * 0.7082389,
        size.height * 0.4140446,
        size.width * 0.8652833,
        size.height * 0.6126196);
    path_0.cubicTo(
        size.width * 1.022326,
        size.height * 0.8111961,
        size.width * 0.6207799,
        size.height * 0.9915037,
        size.width * 0.4182918,
        size.height * 0.8373284);
    path_0.close();

    final Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffC4FF7F).withOpacity(1);
    canvas.drawPath(path_0, paint_0_fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.4182918, size.height * 0.8373284);
    path_1.cubicTo(
        size.width * 0.2563020,
        size.height * 0.7139896,
        size.width * 0.1911229,
        size.height * 0.4760579,
        size.width * 0.1794369,
        size.height * 0.3576300);
    path_1.cubicTo(
        size.width * 0.1527391,
        size.height * 0.08706062,
        size.width * 0.5564761,
        size.height * -0.09111501,
        size.width * 0.6286741,
        size.height * 0.2212467);
    path_1.cubicTo(
        size.width * 0.6667765,
        size.height * 0.3860892,
        size.width * 0.7082389,
        size.height * 0.4140446,
        size.width * 0.8652833,
        size.height * 0.6126196);
    path_1.cubicTo(
        size.width * 1.022326,
        size.height * 0.8111961,
        size.width * 0.6207799,
        size.height * 0.9915037,
        size.width * 0.4182918,
        size.height * 0.8373284);
    path_1.close();

    final Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.black.withOpacity(0.2);
    canvas.drawPath(path_1, paint_1_fill);

    final Path path_2 = Path();
    path_2.moveTo(size.width * 0.4204744, size.height * 0.3684458);
    path_2.cubicTo(
        size.width * 0.4231758,
        size.height * 0.3712927,
        size.width * 0.4227150,
        size.height * 0.3755067,
        size.width * 0.4194454,
        size.height * 0.3778603);
    path_2.cubicTo(
        size.width * 0.4161775,
        size.height * 0.3802125,
        size.width * 0.4113362,
        size.height * 0.3798113,
        size.width * 0.4086348,
        size.height * 0.3769643);
    path_2.lineTo(size.width * 0.4204744, size.height * 0.3684458);
    path_2.close();
    path_2.moveTo(size.width * 0.3840119, size.height * 0.3903388);
    path_2.cubicTo(
        size.width * 0.3849539,
        size.height * 0.3939391,
        size.width * 0.3823652,
        size.height * 0.3975230,
        size.width * 0.3782304,
        size.height * 0.3983432);
    path_2.cubicTo(
        size.width * 0.3740956,
        size.height * 0.3991634,
        size.width * 0.3699795,
        size.height * 0.3969094,
        size.width * 0.3690375,
        size.height * 0.3933091);
    path_2.lineTo(size.width * 0.3840119, size.height * 0.3903388);
    path_2.close();
    path_2.moveTo(size.width * 0.3444590, size.height * 0.3989421);
    path_2.cubicTo(
        size.width * 0.3465802,
        size.height * 0.4021397,
        size.width * 0.3453208,
        size.height * 0.4062288,
        size.width * 0.3416485,
        size.height * 0.4080758);
    path_2.cubicTo(
        size.width * 0.3379761,
        size.height * 0.4099227,
        size.width * 0.3332782,
        size.height * 0.4088262,
        size.width * 0.3311587,
        size.height * 0.4056285);
    path_2.lineTo(size.width * 0.3444590, size.height * 0.3989421);
    path_2.close();
    path_2.moveTo(size.width * 0.3016706, size.height * 0.4125542);
    path_2.cubicTo(
        size.width * 0.3026143,
        size.height * 0.4161545,
        size.width * 0.3000256,
        size.height * 0.4197385,
        size.width * 0.2958908,
        size.height * 0.4205587);
    path_2.cubicTo(
        size.width * 0.2917560,
        size.height * 0.4213789,
        size.width * 0.2876399,
        size.height * 0.4191263,
        size.width * 0.2866962,
        size.height * 0.4155245);
    path_2.lineTo(size.width * 0.3016706, size.height * 0.4125542);
    path_2.close();
    path_2.moveTo(size.width * 0.4086348, size.height * 0.3769643);
    path_2.cubicTo(
        size.width * 0.4050478,
        size.height * 0.3731857,
        size.width * 0.3977782,
        size.height * 0.3718514,
        size.width * 0.3915085,
        size.height * 0.3741991);
    path_2.cubicTo(
        size.width * 0.3885802,
        size.height * 0.3752957,
        size.width * 0.3862372,
        size.height * 0.3770996,
        size.width * 0.3848430,
        size.height * 0.3795097);
    path_2.cubicTo(
        size.width * 0.3834693,
        size.height * 0.3818886,
        size.width * 0.3827150,
        size.height * 0.3853834,
        size.width * 0.3840119,
        size.height * 0.3903388);
    path_2.lineTo(size.width * 0.3690375, size.height * 0.3933091);
    path_2.cubicTo(
        size.width * 0.3670751,
        size.height * 0.3858113,
        size.width * 0.3679044,
        size.height * 0.3790684,
        size.width * 0.3711246,
        size.height * 0.3734978);
    path_2.cubicTo(
        size.width * 0.3743259,
        size.height * 0.3679614,
        size.width * 0.3795870,
        size.height * 0.3641070,
        size.width * 0.3854403,
        size.height * 0.3619138);
    path_2.cubicTo(
        size.width * 0.3967355,
        size.height * 0.3576835,
        size.width * 0.4117372,
        size.height * 0.3592422,
        size.width * 0.4204744,
        size.height * 0.3684458);
    path_2.lineTo(size.width * 0.4086348, size.height * 0.3769643);
    path_2.close();
    path_2.moveTo(size.width * 0.3311587, size.height * 0.4056285);
    path_2.cubicTo(
        size.width * 0.3299693,
        size.height * 0.4038336,
        size.width * 0.3274334,
        size.height * 0.4020401,
        size.width * 0.3235444,
        size.height * 0.4008707);
    path_2.cubicTo(
        size.width * 0.3197133,
        size.height * 0.3997192,
        size.width * 0.3152713,
        size.height * 0.3994027,
        size.width * 0.3113157,
        size.height * 0.4000134);
    path_2.cubicTo(
        size.width * 0.3073242,
        size.height * 0.4006285,
        size.width * 0.3045119,
        size.height * 0.4020579,
        size.width * 0.3029642,
        size.height * 0.4037860);
    path_2.cubicTo(
        size.width * 0.3015922,
        size.height * 0.4053180,
        size.width * 0.3004573,
        size.height * 0.4079153,
        size.width * 0.3016706,
        size.height * 0.4125542);
    path_2.lineTo(size.width * 0.2866962, size.height * 0.4155245);
    path_2.cubicTo(
        size.width * 0.2846519,
        size.height * 0.4077117,
        size.width * 0.2861485,
        size.height * 0.4008158,
        size.width * 0.2908549,
        size.height * 0.3955617);
    path_2.cubicTo(
        size.width * 0.2953857,
        size.height * 0.3905022,
        size.width * 0.3020990,
        size.height * 0.3878529,
        size.width * 0.3086365,
        size.height * 0.3868455);
    path_2.cubicTo(
        size.width * 0.3152099,
        size.height * 0.3858321,
        size.width * 0.3222986,
        size.height * 0.3863477,
        size.width * 0.3285597,
        size.height * 0.3882318);
    path_2.cubicTo(
        size.width * 0.3347645,
        size.height * 0.3900981,
        size.width * 0.3408805,
        size.height * 0.3935438,
        size.width * 0.3444590,
        size.height * 0.3989421);
    path_2.lineTo(size.width * 0.3311587, size.height * 0.4056285);
    path_2.close();

    final Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff0D2A21).withOpacity(1);
    canvas.drawPath(path_2, paint_2_fill);

    final Path path_3 = Path();
    path_3.moveTo(size.width * 0.3670256, size.height * 0.4616003);
    path_3.cubicTo(
        size.width * 0.3641331,
        size.height * 0.4589004,
        size.width * 0.3592730,
        size.height * 0.4587519,
        size.width * 0.3561724,
        size.height * 0.4612704);
    path_3.cubicTo(
        size.width * 0.3530700,
        size.height * 0.4637875,
        size.width * 0.3528993,
        size.height * 0.4680193,
        size.width * 0.3557918,
        size.height * 0.4707207);
    path_3.lineTo(size.width * 0.3670256, size.height * 0.4616003);
    path_3.close();
    path_3.moveTo(size.width * 0.4438174, size.height * 0.4285022);
    path_3.cubicTo(
        size.width * 0.4437611,
        size.height * 0.4248098,
        size.width * 0.4402765,
        size.height * 0.4218574,
        size.width * 0.4360358,
        size.height * 0.4219064);
    path_3.cubicTo(
        size.width * 0.4317952,
        size.height * 0.4219554,
        size.width * 0.4284027,
        size.height * 0.4249896,
        size.width * 0.4284608,
        size.height * 0.4286820);
    path_3.lineTo(size.width * 0.4438174, size.height * 0.4285022);
    path_3.close();
    path_3.moveTo(size.width * 0.3557918, size.height * 0.4707207);
    path_3.cubicTo(
        size.width * 0.3580154,
        size.height * 0.4727979,
        size.width * 0.3611689,
        size.height * 0.4744160,
        size.width * 0.3642935,
        size.height * 0.4756449);
    path_3.cubicTo(
        size.width * 0.3675700,
        size.height * 0.4769346,
        size.width * 0.3714505,
        size.height * 0.4780416,
        size.width * 0.3756587,
        size.height * 0.4788574);
    path_3.cubicTo(
        size.width * 0.3840307,
        size.height * 0.4804785,
        size.width * 0.3942850,
        size.height * 0.4810505,
        size.width * 0.4043601,
        size.height * 0.4791917);
    path_3.cubicTo(
        size.width * 0.4145188,
        size.height * 0.4773150,
        size.width * 0.4247355,
        size.height * 0.4729049,
        size.width * 0.4322816,
        size.height * 0.4644294);
    path_3.cubicTo(
        size.width * 0.4398140,
        size.height * 0.4559688,
        size.width * 0.4440580,
        size.height * 0.4441620,
        size.width * 0.4438174,
        size.height * 0.4285022);
    path_3.lineTo(size.width * 0.4284608, size.height * 0.4286820);
    path_3.cubicTo(
        size.width * 0.4286672,
        size.height * 0.4421664,
        size.width * 0.4250137,
        size.height * 0.4507652,
        size.width * 0.4201433,
        size.height * 0.4562363);
    path_3.cubicTo(
        size.width * 0.4152850,
        size.height * 0.4616939,
        size.width * 0.4085904,
        size.height * 0.4647400,
        size.width * 0.4011741,
        size.height * 0.4661085);
    path_3.cubicTo(
        size.width * 0.3936741,
        size.height * 0.4674933,
        size.width * 0.3856860,
        size.height * 0.4670996,
        size.width * 0.3789915,
        size.height * 0.4658024);
    path_3.cubicTo(
        size.width * 0.3756672,
        size.height * 0.4651590,
        size.width * 0.3728072,
        size.height * 0.4643195,
        size.width * 0.3706177,
        size.height * 0.4634591);
    path_3.cubicTo(
        size.width * 0.3682765,
        size.height * 0.4625379,
        size.width * 0.3672389,
        size.height * 0.4618009,
        size.width * 0.3670256,
        size.height * 0.4616003);
    path_3.lineTo(size.width * 0.3557918, size.height * 0.4707207);
    path_3.close();

    final Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff0D2A21).withOpacity(1);
    canvas.drawPath(path_3, paint_3_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
