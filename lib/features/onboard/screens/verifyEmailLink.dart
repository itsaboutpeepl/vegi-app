import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/analytics_props.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/arrowButton.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/emptyStatePage.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/onboarding/verifyEmailLinkViewModel.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnel/waitingListPositionInQueueViewModel.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';
import 'package:vegan_liverpool/utils/config.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class VerifyEmailLinkPage extends StatelessWidget {
  const VerifyEmailLinkPage({
    required this.emailAddress,
    required this.emailLinkFromVerificationEmail,
    Key? key,
  }) : super(key: key);

  final String emailLinkFromVerificationEmail;
  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyEmailLinkViewModel>(
      converter: VerifyEmailLinkViewModel.fromStore,
      distinct: true,
      builder: (context, viewModel) {
        return FutureBuilder<void>(
          future: viewModel.signInWithEmailLinkCallback(
            emailAddress: emailAddress,
            emailLinkFromVerificationEmail: emailLinkFromVerificationEmail,
          ),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              rootRouter.push(const MainScreen()); // dont replace as keep nav state here
            }
            return const MyScaffold(
              title: 'Email verification',
              body: Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}
