import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegan_liverpool/common/router/route_guards.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({Key? key}) : super(key: key);

  final TextEditingController displayNameController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: I10n.of(context).sign_up,
      body: StoreConnector<AppState, void Function(String)>(
        distinct: true,
        converter: (store) => (String displayName) async {
          isAuthenticated = true;
          store
            ..dispatch(SetDisplayName(displayName))
            ..dispatch(createAccountWalletCall());
        },
        builder: (_, setDisplayName) {
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 0,
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
                          setDisplayName(
                            displayNameController.text.capitalize(),
                          );
                          context.router.push(const ChooseSecurityOption());
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
}
