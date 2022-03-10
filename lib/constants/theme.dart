import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final FlexColorScheme flexColorSchemeLight = FlexColorScheme.light(
  fontFamily: 'Europa',
  colors: FlexSchemeColor.from(
    secondary: Colors.grey[800],
    secondaryVariant: Colors.grey[700]!,
    primary: themeShade200, //makes 'Feed' text white
    primaryVariant: themeShade100,
    appBarColor: themeShade200,
  ),
);

//Yellow Color Scheme

// const Color themeShade100 = Color(0xFFFFF9c4);
// const Color themeShade200 = Color(0xFFFFF59d);
// const Color themeShade300 = Color(0xFFFFF176);
// const Color themeShade400 = Color(0xFFFFEE58);
// const Color themeShade500 = Color(0xFFFFEB3B);
// const Color themeShade600 = Color(0xFFFDD835);
// const Color themeShade700 = Color(0xFFFBC02D);
// const Color themeShade800 = Color(0xFFF9A825);
// const Color themeShade900 = Color(0xFFF57F17);

//Blue Color Scheme
const Color themeShade100 = Color(0xFFb3e5fc);
const Color themeShade200 = Color(0xFF81d4fa);
const Color themeShade300 = Color(0xFF4fc3f7);
const Color themeShade400 = Color(0xFF29b6f6);
const Color themeShade500 = Color(0xFF03a9f4);
const Color themeShade600 = Color(0xFF039be5);
const Color themeShade700 = Color(0xFF0288d1);
const Color themeShade800 = Color(0xFF0277bd);
const Color themeShade900 = Color(0xFF01579b);

const List<Color> screenGradient = [
  themeShade100,
  themeShade200,
  themeShade300,
  themeShade400,
  themeShade300,
  themeShade200,
  themeShade100,
];

final List<Color> colorToWhiteGradient = [
  themeShade300,
  themeShade200,
  themeShade200,
  themeShade100,
  Colors.white
];
