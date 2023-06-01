import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class BackHomeDialog extends StatefulWidget {
  const BackHomeDialog({
    this.cancelButtonName = 'Cancel',
    this.cancelButtonIcon = FontAwesomeIcons.ban,
    Key? key,
  }) : super(key: key);

  final String cancelButtonName;
  final IconData cancelButtonIcon;

  @override
  State<BackHomeDialog> createState() => _BackHomeDialogState();
}

class _BackHomeDialogState extends State<BackHomeDialog> {
  @override
  Widget build(BuildContext context) {
    return VegiDialog(
      storeConverter: (store) {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Back to home',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          VegiDialogButton(
            label: Labels.homeScreenRouteLabel,
            icon: FontAwesomeIcons.house,
            onPressed: () => rootRouter.replaceAll([const MainScreen()]),
          ),
          // const SizedBox(height: 15),
          VegiDialogButton(
            label: widget.cancelButtonName,
            icon: widget.cancelButtonIcon,
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }
}
