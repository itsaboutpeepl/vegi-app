import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/onboard.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({Key? key, this.verificationId}) : super(key: key);
  final String? verificationId;

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  String autoCode = '';
  TextEditingController codeController = TextEditingController(text: '');
  String currentText = '';
  final formKey = GlobalKey<FormState>();
  bool isPreloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: I10n.of(context).sign_up,
      body: StoreConnector<AppState, VerifyOnboardViewModel>(
        distinct: true,
        converter: VerifyOnboardViewModel.fromStore,
        onInitialBuild: (viewModel) {
          if (viewModel.firebaseCredentials != null &&
              viewModel.verificationId != null) {
            autoCode = viewModel.firebaseCredentials?.smsCode ?? '';
            setState(() {
              isPreloading = true;
            });
            viewModel.verify(
              autoCode,
              () {
                setState(() {
                  isPreloading = false;
                });
              },
              (error) {
                setState(() {
                  isPreloading = false;
                });
              },
            );
          }
        },
        builder: (_, viewModel) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${I10n.of(context).we_just_sent}'
                      '${viewModel.phoneNumber}\n',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      I10n.of(context).enter_verification_code,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: SizedBox(
                        width: 280,
                        child: PinCodeTextField(
                          length: 6,
                          backgroundColor: Theme.of(context).canvasColor,
                          showCursor: false,
                          appContext: context,
                          enableActiveFill: true,
                          enablePinAutofill: false,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          controller: codeController,
                          autoFocus: true,
                          pinTheme: PinTheme(
                            borderWidth: 4,
                            borderRadius: BorderRadius.circular(20),
                            shape: PinCodeFieldShape.underline,
                            inactiveColor: const Color(0xFFDDDDDD),
                            inactiveFillColor: Theme.of(context).canvasColor,
                            selectedFillColor: Theme.of(context).canvasColor,
                            disabledColor: Theme.of(context).primaryColor,
                            selectedColor:
                                Theme.of(context).colorScheme.onSurface,
                            activeColor:
                                Theme.of(context).colorScheme.onSurface,
                            activeFillColor: Theme.of(context).canvasColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              currentText = value;
                            });
                          },
                          onCompleted: ((value) {
                            _verifyCode(viewModel);
                          }),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: PrimaryButton(
                        label: I10n.of(context).next_button,
                        width: MediaQuery.of(context).size.width * .9,
                        preload: isPreloading,
                        disabled: isPreloading,
                        onPressed: () {
                          _verifyCode(viewModel);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          I10n.of(context).didnt_get_message,
                          style: const TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(right: 10),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            I10n.of(context).resend_code,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _verifyCode(VerifyOnboardViewModel viewModel) {
    formKey.currentState!.validate();
    if (currentText.length == 6) {
      setState(() {
        isPreloading = true;
      });
      viewModel.verify(
        codeController.text,
        () {
          setState(() {
            isPreloading = false;
          });
        },
        (dynamic error) {
          setState(() {
            isPreloading = false;
          });
        },
      );
    }
  }
}
