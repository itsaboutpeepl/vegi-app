import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vegan_liverpool/generated/l10n.dart';

void showErrorSnack({
  required BuildContext context,
  String? title,
  int duration = 3,
  EdgeInsets? margin,
  String? message,
}) {
  Flushbar<void>(
      boxShadows: const [
        BoxShadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 5,
        ),
      ],
      duration: Duration(seconds: duration),
      titleText: Text(
        title ?? I10n.of(context).transaction_failed,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message ?? 'Try again later!',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
      margin: margin ??
          EdgeInsets.only(
            top: 8,
            right: 8,
            left: 8,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      icon: SvgPicture.asset(
        'assets/images/failed_icon.svg',
        width: 20,
        height: 20,
      )).show(context);
}

void showCopiedFlushbar(BuildContext context) {
  Flushbar<void>(
    duration: const Duration(seconds: 1),
    boxShadows: const [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    messageText: Text(
      I10n.of(context).copied_to_clipboard,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
    margin: const EdgeInsets.only(
      top: 25,
      right: 25,
      left: 25,
      bottom: 25,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
  ).show(context);
}

void showPlayBackCompletedFlushBar(BuildContext context) {
  Flushbar<void>(
    duration: const Duration(seconds: 4),
    boxShadows: const [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    messageText: const Text(
      'Thanks for watching. Your Reward will be added to your wallet.',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
    margin: const EdgeInsets.only(
      top: 8,
      right: 8,
      left: 8,
      bottom: 10,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
  ).show(context);
}
