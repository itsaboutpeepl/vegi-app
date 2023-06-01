import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class UnauthenticatedDialog extends StatelessWidget {
  const UnauthenticatedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VegiDialog(
      storeConverter: (store) {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Connection issue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Unable to connect to wallet at this time. Please contact vegi support if this issue persists.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          VegiDialogButton(
            label: 'Check account details',
            onPressed: () => context.router.push(const ProfileScreen()),
          ),
          VegiDialogButton(
            label: 'O.K.',
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }
}