import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_app_bar.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.makeBodySafe = false,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);
  final String title;
  final Widget body;
  final bool makeBodySafe;
  final bool automaticallyImplyLeading;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: MyAppBar(
        height: kToolbarHeight,
        child: AppBar( 
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: themeShade300,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: Fonts.europa,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            softWrap: true,
          ),
        ),
      ),
      body: makeBodySafe ? SafeArea(child: body) : body,
    );
  }
}
