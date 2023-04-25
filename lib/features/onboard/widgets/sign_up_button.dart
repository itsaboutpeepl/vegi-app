import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
    this.autoSizeText = false,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Future<void> Function() onPressed;
  final bool isLoading;
  final bool autoSizeText;

  BoxConstraints signupButtonSizeConstraints(BuildContext context) =>
      BoxConstraints(
        minWidth: 250,
        maxWidth: MediaQuery.of(context).size.width - 40,
      );

  @override
  Widget build(BuildContext context) {
    if (autoSizeText) {
      return buildConstrainedButton(context);
    } else {
      return buildConstrainedButton(context);
    }
  }

  Widget buildAutoSizedTextButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      constraints: signupButtonSizeConstraints(context),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(
            color: Colors.grey[100]!,
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: !isLoading
                ? AutoSizeText(
                    buttonText,
                    style: TextStyle(
                      color: isLoading ? const Color(0xFF797979) : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 1,
                  )
                : Container(
                    width: 21,
                    height: 21,
                    margin: const EdgeInsets.only(
                      left: 28,
                      right: 28,
                    ),
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

  Widget buildConstrainedButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      constraints: signupButtonSizeConstraints(context),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(
            color: Colors.grey[100]!,
            width: 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.grey[100],
          ),
        ),
      ),
    );
  }
}
