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
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key? key}) : super(key: key);

  Widget _dialogButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required void Function() onPressed,
    bool disabled = false,
    bool dangerButton = false,
  }) {
    // final _buttonLabelColour = dangerButton ? themeShade1200 : Colors.white;
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
          _dialogButton(
            context: context,
            label: whatsappContactVegiSupportUrlButtonLabel(),
            icon: FontAwesomeIcons.whatsapp,
            dangerButton: true,
            disabled: whatsappChatIsOutOfHours(),
            onPressed: () => launchUrl(whatsappContactVegiSupportUrl),
          ),
          _dialogButton(
            context: context,
            label: 'Email',
            icon: Icons.send,
            onPressed: () => launchUrl(mailContactVegiSupport),
          ),
          // const SizedBox(height: 15),
          _dialogButton(
            context: context,
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
