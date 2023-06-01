import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class AppUpdateNeededDialog extends StatelessWidget {
  const AppUpdateNeededDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VegiDialog(
      storeConverter: (store) {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Update available',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          if (Platform.isIOS)
            VegiDialogButton(
              label: Labels.launchAppStore,
              icon: FontAwesomeIcons.appStoreIos,
              onPressed: _launchUrl,
            )
          else
            VegiDialogButton(
              label: Labels.launchAppStore,
              icon: FontAwesomeIcons.googlePlay,
              onPressed: _launchUrl,
            ),
          // const SizedBox(height: 15),
          VegiDialogButton(
            label: Labels.cancelButtonLabel,
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    final appStoreUrl = await getAppStoreLink();
    if (appStoreUrl == null) {
      return;
    }
    return launchUrl(
      appStoreUrl.toString(),
    );
  }
}
