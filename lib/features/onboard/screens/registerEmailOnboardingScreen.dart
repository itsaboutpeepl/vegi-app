import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/signup.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/waitingListFunnel/registerEmailNotificationsViewModel.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class RegisterEmailOnBoardingScreen extends StatefulWidget {
  const RegisterEmailOnBoardingScreen({
    Key? key,
    this.onSubmitEmail,
  }) : super(key: key);

  final void Function()? onSubmitEmail;

  @override
  State<RegisterEmailOnBoardingScreen> createState() =>
      _RegisterEmailOnBoardingScreenState();
}

class _RegisterEmailOnBoardingScreenState
    extends State<RegisterEmailOnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  bool isPreloading = false;

  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;
  bool emailRegistered = false;

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
    return MyScaffold(
      title: Labels.registerEmailOnboardingScreenTitle,
      body: StoreConnector<AppState, RegisterEmailNotificationsViewModel>(
        distinct: true,
        converter: RegisterEmailNotificationsViewModel.fromStore,
        builder: (context, viewModel) {
          return Container(
            alignment: Alignment.center,
            color: Colors.grey[350],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        emailRegistered
                            ? Messages.emailRegisteredThankYou
                            : Messages.emailPleaseEnterToHelpProtectYourAccount,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fonts.fatFace,
                        ),
                        maxLines: emailRegistered ? 1 : 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (emailRegistered)
                        AutoSizeText(
                          ' ${viewModel.userEmail}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (emailRegistered)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: Column(
                          children: const [
                            AutoSizeText(
                              Messages.wellBeInTouchSoon,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      )
                    else
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
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
                                        ? Messages.pleaseEnterEmail
                                        : null,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 10,
                                      ),
                                      hintText: Messages.email,
                                      border: InputBorder.none,
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .background,
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
                              PrimaryButton(
                                label: I10n.of(context).next_button,
                                preload: isPreloading,
                                disabled: isPreloading,
                                onPressed: () async {
                                  final String email = emailController.text;
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    isPreloading = true;
                                  });
                                  try {
                                    viewModel.registerEmailToWaitingList(
                                      email: email,
                                      onSuccess: () {
                                        setState(() {
                                          isPreloading = false;
                                          emailRegistered = true;
                                        });
                                        widget.onSubmitEmail?.call();
                                        _nextOnBoardingScreen(
                                          viewModel,
                                          context,
                                        );
                                      },
                                      onError: (error) {
                                        setState(() {
                                          isPreloading = false;
                                        });
                                        showErrorSnack(
                                          message: Messages.invalidEmail,
                                          title: I10n.of(context)
                                              .something_went_wrong,
                                          context: context,
                                          margin: const EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                            left: 8,
                                            bottom: 120,
                                          ),
                                        );
                                      },
                                    );
                                  } catch (e) {
                                    setState(() {
                                      isPreloading = false;
                                    });
                                    await showErrorSnack(
                                      message: Messages.invalidEmail,
                                      title:
                                          I10n.of(context).something_went_wrong,
                                      context: context,
                                      margin: const EdgeInsets.only(
                                        top: 8,
                                        right: 8,
                                        left: 8,
                                        bottom: 120,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () => launchUrl(VEGI_PRIVACY_URL),
                                child: const Text(
                                  Messages.byRegisteringEmailWaitListReason +
                                      Messages.unsubscribeAtAnyTime,
                                  style: TextStyle(
                                    color: textLinkColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (viewModel.positionInQueue != null)
                      AutoSizeText(
                        'You\'re our ${viewModel.positionInQueue!.thFormatted(dontFormatStrictlyAbove: 100)} new pal!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          fontFamily: Fonts.fatFace,
                        ),
                        maxLines: 1,
                      )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _nextOnBoardingScreen(
    RegisterEmailNotificationsViewModel viewModel,
    BuildContext context,
  ) {
    if (!viewModel.biometricAuthIsSet) {
      rootRouter.push(const ChooseSecurityOption());
    } else {
      rootRouter.push(const MainScreen());
    }
  }
}
