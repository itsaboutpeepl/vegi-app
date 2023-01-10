import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
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
    required String label,
    required IconData icon,
    required void Function() onPressed,
  }) {
    const _buttonLabelColour = Colors.white;
    const _buttonLabelFontSize = 30.0;
    return Container(
      width: 255,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
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
            label: 'Website',
            icon: Icons.open_in_new,
            onPressed: () => launchUrl(VEGI_CONTACT_US_URL),
          ),
          // const SizedBox(height: 15),
          _dialogButton(
            label: 'Email',
            icon: Icons.send,
            onPressed: () => launchUrl(mailContactVegiSupport),
          ),
          // const SizedBox(height: 15),
          _dialogButton(
            label: whatsappContactVegiSupportUrlButtonLabel,
            icon: FontAwesomeIcons.whatsapp,
            onPressed: () => launchUrl(whatsappContactVegiSupportUrl),
          ),
          _dialogButton(
            label: instaDMContactVegiSupportUrlButtonLabel,
            icon: FontAwesomeIcons.instagram,
            onPressed: () => launchUrl(VEGI_INSTA_PROFILE_URL),
          ),
        ],
      ),
    );
  }
}

// class HelpDialog extends StatefulWidget {
//   const HelpDialog({Key? key}) : super(key: key);

//   @override
//   State<HelpDialog> createState() => _HelpDialogState();
// }

// // TODO: Use the VegiDialog widget instead once this component works.
// class _HelpDialogState extends State<HelpDialog>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> scaleAnimation;

//   late void Function() logout;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//     scaleAnimation =
//         CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

//     controller
//       ..addListener(() {
//         setState(() {});
//       })
//       ..forward();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Widget _dialogButton({
//     required String label,
//     required IconData icon,
//     required void Function() onPressed,
//   }) {
//     const _buttonLabelColour = Colors.white;
//     const _buttonLabelFontSize = 30.0;
//     return Container(
//       width: 255,
//       padding: const EdgeInsets.all(16),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: Center(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     color: _buttonLabelColour,
//                     fontSize: _buttonLabelFontSize * 0.75,
//                     fontWeight: FontWeight.normal,
//                   ),
//                   maxLines: 1,
//                 ),
//               ),
//             ),
//             // const SizedBox(
//             //   width: 16,
//             // ),
//             Icon(
//               icon, //Icons.sms
//               color: _buttonLabelColour,
//               size: _buttonLabelFontSize,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, void>(
//       converter: (store) {
//         logout = () {
//           if (store.state.userState.hasSavedSeedPhrase) {
//             store.dispatch(LogoutRequestSuccess());
//             context.router.replace(const OnBoardScreen());
//             Analytics.track(eventName: AnalyticsEvents.logout);
//           }
//           context.router.pop();
//           context.router.push(const ShowUserMnemonic());
//         };
//       },
//       builder: (_, viewmodel) {
//         return ScaleTransition(
//           scale: scaleAnimation,
//           child: AlertDialog(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             content: Container(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Support',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   _dialogButton(
//                     label: 'Website',
//                     icon: Icons.open_in_new,
//                     onPressed: () => launchUrl(VEGI_CONTACT_US_URL),
//                   ),
//                   // const SizedBox(height: 15),
//                   _dialogButton(
//                     label: 'Email',
//                     icon: Icons.send,
//                     onPressed: () => launchUrl(mailContactVegiSupport),
//                   ),
//                   // const SizedBox(height: 15),
//                   _dialogButton(
//                     label: whatsappContactVegiSupportUrlButtonLabel,
//                     icon: FontAwesomeIcons.whatsapp,
//                     onPressed: () => launchUrl(whatsappContactVegiSupportUrl),
//                   ),
//                   _dialogButton(
//                     label: instaDMContactVegiSupportUrlButtonLabel,
//                     icon: FontAwesomeIcons.instagram,
//                     onPressed: () => launchUrl(VEGI_INSTA_PROFILE_URL),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
