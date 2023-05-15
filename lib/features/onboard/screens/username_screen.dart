import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/onboard.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({Key? key}) : super(key: key);

  final TextEditingController displayNameController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: I10n.of(context).sign_up,
      body: StoreConnector<AppState, VerifyOnboardViewModel>(
        distinct: true,
        converter: VerifyOnboardViewModel.fromStore,
        builder: (_, viewmodel) {
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset(
                            'assets/images/username.svg',
                            width: 95,
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          I10n.of(context).pickup_display_name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          I10n.of(context).pickup_display_name_text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 255,
                          color: Theme.of(context).canvasColor,
                          child: TextFormField(
                            controller: displayNameController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              fillColor: Theme.of(context).canvasColor,
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Center(
                    child: PrimaryButton(
                      label: I10n.of(context).next_button,
                      onPressed: () {
                        if (displayNameController.text.isNotEmpty) {
                          viewmodel.setDisplayName(
                            displayName: displayNameController.text.capitalize(),
                          );
                          _nextOnBoardingScreen(viewmodel,context,);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  void _nextOnBoardingScreen(VerifyOnboardViewModel viewModel, BuildContext context,) {
    if (viewModel.email.isEmpty) {
      rootRouter.push(
        RegisterEmailOnBoardingScreen(
          onSubmitEmail: () {},
        ),
      );
    } else if (!viewModel.biometricAuthIsSet) {
      rootRouter.push(const ChooseSecurityOption());
    } else {
      rootRouter.push(const MainScreen());
    }
  }
}
