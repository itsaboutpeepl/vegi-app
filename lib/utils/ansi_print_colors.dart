import 'package:ansicolor/ansicolor.dart';


class PrintPens {
  static final AnsiPen blackPen = AnsiPen()..black();
  static final AnsiPen redPen = AnsiPen()..red();
  static final AnsiPen greenPen = AnsiPen()..green();
  static final AnsiPen yellowPen = AnsiPen()..yellow();
  static final AnsiPen bluePen = AnsiPen()..blue();
  static final AnsiPen magentaPen = AnsiPen()..magenta();
  static final AnsiPen cyanPen = AnsiPen()..cyan();
  static final AnsiPen whitePen = AnsiPen()..white();
  static final AnsiPen peachPen = AnsiPen()..rgb(r: 1.0, g: 0.8, b: 0.2);
  static final AnsiPen orangePen = AnsiPen()..rgb(r: 0.95, g: 0.58, b: 0.13);
  static final AnsiPen greyPen = AnsiPen()..gray();
  static final AnsiPen brownPen = AnsiPen()
    ..rgb(r: (167.0 / 255.0), g: (95.0 / 255.0), b: (47.0 / 255.0));

  static final AnsiPen redPenPeachBg = AnsiPen()
    ..red() //Red pen with peach background defined second
    ..rgb(r: 1.0, g: 0.8, b: 0.2);
  static final AnsiPen whiteBackgroundPen = AnsiPen()..white(bg: true);
}

final ansiEscapeCodesForColors = {
  'Black': '\x1B[30m',
  'Red': '\x1B[31m',
  'Green': '\x1B[32m',
  'Yellow': '\x1B[33m',
  'Blue': '\x1B[34m',
  'Magenta': '\x1B[35m',
  'Cyan': '\x1B[36m',
  'White': '\x1B[37m',
  'Reset': '\x1B[0m',
};

// '📕: error message'
// '📙: warning message'
// '📗: ok status message'
// '📘: action message'
// '📓: canceled status message'
// '📔: Or anything you like and want to recognize immediately by color'