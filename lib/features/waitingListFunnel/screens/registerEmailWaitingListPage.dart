import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/signup.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnel/registerEmailNotificationsViewModel.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

typedef RegisterEmailToWaitingList = void Function(
  String,
  void Function() onSuccess,
  void Function(dynamic error) onError,
);

class RegisterEmailWaitingListScreen extends StatefulWidget {
  const RegisterEmailWaitingListScreen({
    Key? key,
    this.onSubmitEmail,
  }) : super(key: key);

  final void Function()? onSubmitEmail;

  @override
  State<RegisterEmailWaitingListScreen> createState() =>
      _RegisterEmailWaitingListScreenState();
}

class _RegisterEmailWaitingListScreenState
    extends State<RegisterEmailWaitingListScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 0.4).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: EdgeInsets.only(
      //   bottom: 30,
      //   top: MediaQuery.of(context).size.height * 0.08,
      // ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const <Widget>[
                  Text(
                    Messages.enterEmail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      // color: Theme.of(context).textTheme.bodySmall?.color ??
                      //     Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 280,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).colorScheme.onSurface,
                                width: 2,
                              ),
                            ),
                          ),
                          child: ScaleTransition(
                            scale: scaleAnimation,
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              // onTapOutside: (event) {
                              //   FocusScope.of(context).unfocus();
                              // },
                              autocorrect: false,
                              autofocus: true,
                              validator: (String? value) => value!.isEmpty
                                  ? 'Please enter your email'
                                  : null,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 10,
                                ),
                                hintText: Messages.email,
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        StoreConnector<AppState, RegisterEmailNotificationsViewModel>(
                          distinct: true,
                          converter: RegisterEmailNotificationsViewModel.fromStore,
                          onWillChange: (previousViewModel, newViewModel) {
                            if (newViewModel.cartError != null &&
                                newViewModel.cartError !=
                                    previousViewModel?.cartError) {
                              final err = newViewModel.cartError!;
                              if (err.code != null) {
                                if (err.code ==
                                    CartErrCode
                                        .failedToRegisterEmailToWaitingList) {
                                  showErrorSnack(
                                    context: context,
                                    title: err.title,
                                    message: err.message,
                                  );
                                }
                              }
                            }
                          },
                          builder: (_, viewModel) =>
                              PrimaryButton(
                            label: I10n.of(context).next_button,
                            preload: viewModel.isLoadingCartState,
                            disabled: viewModel.isLoadingCartState,
                            onPressed: () async {
                              final String email = emailController.text;
                              FocusScope.of(context).unfocus();
                              viewModel.registerEmailToWaitingList(email: email,);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => launchUrl(VEGI_PRIVACY_URL),
                          child: Text(
                            Messages.byRegisteringEmailWaitListReason +
                                Messages.unsubscribeAtAnyTime,
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
