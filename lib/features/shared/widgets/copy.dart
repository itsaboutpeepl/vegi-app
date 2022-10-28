import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';

class CopyToClipboard extends StatelessWidget {
  const CopyToClipboard({
    Key? key,
    required this.content,
    this.textColor,
  }) : super(key: key);
  final String content;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Theme.of(context).canvasColor,
      highlightColor: Theme.of(context).canvasColor,
      child: Text(
        I10n.of(context).copy_to_clipboard,
        style: TextStyle(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        unawaited(Clipboard.setData(ClipboardData(text: content)));
        showCopiedFlushbar(context);
      },
    );
  }
}
