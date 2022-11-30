import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/onboard/dialogs/signup.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/admin/surveyQuestion.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/user_actions.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

typedef SubmitSurveyResponse = void Function(
  String,
  void Function() onSuccess,
  void Function(dynamic error) onError,
);

class SurveyQuestionScreen extends StatefulWidget {
  const SurveyQuestionScreen({
    Key? key,
    required this.question,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final SurveyQuestion question;
  final void Function() nextPage;
  final void Function() previousPage;

  @override
  State<SurveyQuestionScreen> createState() => _SurveyQuestionScreenState();
}

class _SurveyQuestionScreenState extends State<SurveyQuestionScreen>
    with SingleTickerProviderStateMixin {
  final textController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  bool isPreloading = false;

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
    return Padding(
      padding: EdgeInsets.only(
        bottom: 30,
        top: MediaQuery.of(context).size.height * 0.08,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  widget.question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
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
                  child: StoreConnector<AppState, SubmitSurveyResponse>(
                    distinct: true,
                    converter: (store) => (
                      String response,
                      void Function() onSuccess,
                      dynamic Function(dynamic) onError,
                    ) =>
                        store.dispatch(
                          submitSurveyResponse(
                            widget.question.question,
                            response,
                            onSuccess,
                            onError,
                          ),
                        ),
                    builder: (context, submit) => Column(
                      children: <Widget>[
                        _buildAnswerField(
                          context,
                          widget.question.responseType,
                          submit,
                        ),
                        const SizedBox(height: 40),
                        if (widget.question.responseType ==
                                SurveyResponseType.string ||
                            widget.question.responseType ==
                                SurveyResponseType.multiline)
                          PrimaryButton(
                            label: I10n.of(context).next_button,
                            preload: isPreloading,
                            disabled: isPreloading,
                            onPressed: () async {
                              setState(() {
                                isPreloading = true;
                              });
                              try {
                                submit(
                                  textController.text,
                                  () {
                                    setState(() {
                                      isPreloading = false;
                                    });
                                    widget.nextPage();
                                  },
                                  (error) {
                                    setState(() {
                                      isPreloading = false;
                                    });
                                    widget.nextPage();
                                  },
                                );
                              } catch (e) {
                                setState(() {
                                  isPreloading = false;
                                });
                                showErrorSnack(
                                  message: Messages.invalidEmail,
                                  title: I10n.of(context).something_went_wrong,
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAnswerField(
    BuildContext context,
    SurveyResponseType responseType,
    dynamic Function(
      String response,
      void Function() onSuccess,
      dynamic Function(dynamic) onError,
    )
        submit,
  ) {
    switch (responseType) {
      case SurveyResponseType.boolean:
        return Container(
          width: 280,
          decoration: BoxDecoration(
              // border: Border(
              //   bottom: BorderSide(
              //     color: Theme.of(context).colorScheme.onSurface,
              //     width: 2,
              //   ),
              // ),
              ),
          child: ScaleTransition(
            scale: scaleAnimation,
            child: _buildAnswerNumberField(context, submit),
            // child: _buildAnswerBooleanField(context, submit),
          ),
        );
      case SurveyResponseType.number:
      case SurveyResponseType.string:
      case SurveyResponseType.multiline:
        return Container(
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
            child: _buildAnswerTextField(context),
          ),
        );
    }
  }

  Widget _buildAnswerNumberField(
    BuildContext context,
    dynamic Function(
      String response,
      void Function() onSuccess,
      dynamic Function(dynamic) onError,
    )
        submit,
  ) {
    return Container(
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
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 280 * 0.4,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return themeShade300;
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isPreloading = true;
                    });
                    try {
                      submit(
                        'Yes',
                        () {
                          setState(() {
                            isPreloading = false;
                          });
                          widget.nextPage();
                        },
                        (error) {
                          setState(() {
                            isPreloading = false;
                          });
                          widget.nextPage();
                        },
                      );
                    } catch (e) {
                      setState(() {
                        isPreloading = false;
                      });
                      showErrorSnack(
                        message: Messages.invalidEmail,
                        title: I10n.of(context).something_went_wrong,
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
                  child: const Icon(Icons.done),
                ),
              ),
              SizedBox(
                width: 280 * 0.4,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return themeAccent300;
                        return themeAccent400; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isPreloading = true;
                    });
                    try {
                      submit(
                        'No',
                        () {
                          setState(() {
                            isPreloading = false;
                          });
                          widget.nextPage();
                        },
                        (error) {
                          setState(() {
                            isPreloading = false;
                          });
                          widget.nextPage();
                        },
                      );
                    } catch (e) {
                      setState(() {
                        isPreloading = false;
                      });
                      showErrorSnack(
                        message: Messages.invalidEmail,
                        title: I10n.of(context).something_went_wrong,
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
                  child: const Icon(Icons.highlight_off),
                ),
              ),
            ],
          ),
        ),
        // child: _buildAnswerBooleanField(context),
      ),
    );
  }

  Widget _buildAnswerBooleanField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.3,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  textController.text = 'Yes';
                },
                child: const Text('Yes'),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.3,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  textController.text = 'No';
                },
                child: const Text('No'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerTextField(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.multiline,
      autofocus: true,
      // validator: (String? value) => value!.isEmpty
      //     ? 'Please enter your email'
      //     : null,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        hintText: 'Answer',
        border: InputBorder.none,
        fillColor: Theme.of(context).backgroundColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
