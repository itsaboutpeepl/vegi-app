import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class SuggestProductDialog extends StatelessWidget {
  const SuggestProductDialog({
    Key? key,
    this.scannedQRCode,
  }) : super(key: key);

  final String? scannedQRCode;

  @override
  Widget build(BuildContext context) {
    final nextButtonLabel = I10n.of(context).next_button;
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
          Text(
            scanQRCodeProductNotFoundPleaseSendUsDetails(nextButtonLabel),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 15),
          VegiDialogButton(
            label: nextButtonLabel,
            icon: Icons.send,
            onPressed: () {
              // context.router
              //   ..popUntilRoot()
              //   ..pushNamed('veganHomeScreenAlt');
              // print(context.router);
              context.router.navigate(const VeganHomeScreenAlt());
              // context.router.replaceAll([const VeganHomeScreenAlt(), SuggestProductFunnelScreen(
              //     scannedQRCode: scannedQRCode,
              //   ),
              // ]);
              // context.router.replaceAll([
              //   const MainScreen(),
              //   SuggestProductFunnelScreen(
              //     scannedQRCode: scannedQRCode,
              //   ),
              // ]);
              context.router.push(
                SuggestProductFunnelScreen(
                  scannedQRCode: scannedQRCode,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
