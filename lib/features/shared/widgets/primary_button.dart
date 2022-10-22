import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.fontSize = 20,
    required this.onPressed,
    required this.label,
    this.width = 255.0,
    this.height = 50.0,
    this.preload = false,
    this.disabled = false,
  }) : super(key: key);
  final GestureTapCallback onPressed;
  final String label;
  final double width;
  final double height;
  final bool preload;
  final bool disabled;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: disabled
              ? [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary
                ]
              : [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary,
                ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(11)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? () {} : onPressed,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          highlightColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
          splashColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
          child: Center(
            child: !preload
                ? AutoSizeText(
                    label,
                    style: TextStyle(
                      color: disabled ? const Color(0xFF797979) : Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 1,
                  )
                : Container(
                    width: 21,
                    height: 21,
                    margin: const EdgeInsets.only(left: 28, right: 28),
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
