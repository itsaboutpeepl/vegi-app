import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class VegiDialogButton extends StatelessWidget {
  const VegiDialogButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.disabled = false,
    this.dangerButton = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final void Function() onPressed;
  final bool disabled;
  final bool dangerButton;

  @override
  Widget build(BuildContext context) {
    final _buttonLabelColour =
        disabled ? const Color(0xFF797979) : Colors.white;
    const _buttonLabelFontSize = 30.0;
    final _buttonBackgroundColor = dangerButton
        ? disabled
            ? themeShade800
            : themeAccent600
        : disabled
            ? themeShade900
            : Theme.of(context).colorScheme.primary;
    return Container(
      width: 255,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: disabled ? () {} : onPressed,
        style: dangerButton
            ? ElevatedButton.styleFrom(backgroundColor: themeShade1100)
            : ElevatedButton.styleFrom(backgroundColor: themeShade600),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: _buttonLabelColour,
                    fontSize: _buttonLabelFontSize * 0.75,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            // const SizedBox(
            //   width: 16,
            // ),
            Icon(
              icon, //Icons.sms
              color: _buttonLabelColour,
              size: _buttonLabelFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
