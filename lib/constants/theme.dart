import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final FlexColorScheme flexColorSchemeLight = FlexColorScheme.light(
  fontFamily: 'Europa',
  colors: FlexSchemeColor.from(
    secondary: Colors.grey[800],
    secondaryVariant: Colors.grey[700]!,
    primary: Colors.yellow[200]!, //makes 'Feed' text white
    primaryVariant: Colors.yellow[100]!,
    appBarColor: Colors.yellow[200]!,
  ),
);
