import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  const TransparentButton({
    Key? key,
    this.fontSize = 18,
    required this.onPressed,
    required this.label,
    this.width = 21.0,
    this.height = 21.0,
    this.preload = false,
    this.textColor = Colors.black87,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;
  final double width;
  final double height;
  final bool preload;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Theme.of(context).canvasColor,
        highlightColor: Theme.of(context).canvasColor,
        onTap: onPressed,
        child: !preload
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
              )
            : Container(
                width: width,
                height: height,
                margin: const EdgeInsets.only(left: 28, right: 28),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
      ),
    );
  }
}
