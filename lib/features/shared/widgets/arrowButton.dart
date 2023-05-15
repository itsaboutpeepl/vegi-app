import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class ArrowButton extends StatelessWidget {
  ArrowButton({
    required this.onTap,
    this.tooltip = '',
    this.iconSize,
    Key? key,
  }) : super(key: key);

  final void Function() onTap;
  final String tooltip;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.east),
      color: Theme.of(context).primaryColor,
      highlightColor: themeShade850,
      tooltip: tooltip,
      onPressed: onTap,
      iconSize: iconSize,
    );
  }
}
