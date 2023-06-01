import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VegiDialog(
      storeConverter: (store) {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Support',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          VegiDialogButton(
            label: whatsappContactVegiSupportUrlButtonLabel(),
            icon: FontAwesomeIcons.whatsapp,
            dangerButton: true,
            disabled: whatsappChatIsOutOfHours(),
            onPressed: () => launchUrl(whatsappContactVegiSupportUrl),
          ),
          VegiDialogButton(
            label: 'Email',
            icon: Icons.send,
            onPressed: () => launchUrl(mailContactVegiSupport),
          ),
          // const SizedBox(height: 15),
          VegiDialogButton(
            label: 'Website',
            icon: Icons.open_in_new,
            onPressed: () => launchUrl(VEGI_CONTACT_US_URL),
          ),
          // _dialogButton(
          //   context: context,
          //   label: instaDMContactVegiSupportUrlButtonLabel,
          //   icon: FontAwesomeIcons.instagram,
          //   onPressed: () => launchUrl(VEGI_INSTA_PROFILE_URL),
          // ),
        ],
      ),
    );
  }
}
