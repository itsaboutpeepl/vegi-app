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
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class ContinueWithoutDiscountCodeDialog extends StatelessWidget {
  const ContinueWithoutDiscountCodeDialog({
    required this.dialogClosedCallback,
    Key? key,
  }) : super(key: key);

  final void Function(bool didCancel) dialogClosedCallback;

  @override
  Widget build(BuildContext context) {
    return VegiDialog(
      storeConverter: (store) {},
      actions: [
        VegiDialogButton(
          label: I10n.of(context).ok,
          dangerButton: true,
          onPressed: () => dialogClosedCallback(false),
        ),
        VegiDialogButton(
          label: I10n.of(context).cancel,
          onPressed: () => dialogClosedCallback(true),
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            CopyWrite.continueWithoutDiscountCode,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
