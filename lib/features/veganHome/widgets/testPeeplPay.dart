import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vegan_liverpool/constants/keys.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/screens/inapp_webview_page.dart';
import 'package:vegan_liverpool/models/app_state.dart';

class TestPeeplPay extends StatefulWidget {
  const TestPeeplPay({Key? key}) : super(key: key);

  @override
  State<TestPeeplPay> createState() => _TestPeeplPayState();
}

// token.address,
// receiverAddress,
// tokensAmount,
// externalId

class _TestPeeplPayState extends State<TestPeeplPay> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InAppWebViewViewModel>(
      converter: InAppWebViewViewModel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Test Peepl Pay for Adam ❤️"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: FormBuilder(
              key: AppKeys.peeplPayTestFormKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  FormBuilderTextField(
                      name: 'tokenName',
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: themeShade300, width: 3.0),
                        ),
                        fillColor: Colors.transparent,
                        labelText: 'Token Name',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.required(context)),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                      name: 'receiverAddress',
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: themeShade300, width: 3.0),
                        ),
                        fillColor: Colors.transparent,
                        labelText: 'Receiver Address',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.required(context)),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                      name: 'tokenAmount',
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: themeShade300, width: 3.0),
                        ),
                        fillColor: Colors.transparent,
                        labelText: 'Token Amount',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context)
                      ])),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                      name: 'externalID',
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: themeShade300, width: 3.0),
                        ),
                        fillColor: Colors.transparent,
                        labelText: 'External ID',
                      ),
                      onChanged: (value) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      keyboardType: TextInputType.text,
                      validator: FormBuilderValidators.required(context)),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.grey[800],
                      primary: themeShade300,
                      textStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    onPressed: () {
                      if (AppKeys.peeplPayTestFormKey.currentState!
                          .saveAndValidate()) {
                        viewmodel.sendTokenFromWebView(
                            AppKeys.peeplPayTestFormKey.currentState!
                                .fields["tokenName"]!.value,
                            AppKeys.peeplPayTestFormKey.currentState!
                                .fields["receiverAddress"]!.value,
                            num.parse(AppKeys.peeplPayTestFormKey.currentState!
                                .fields["tokenAmount"]!.value),
                            AppKeys.peeplPayTestFormKey.currentState!
                                .fields["externalID"]!.value, (_) {
                          print(_);
                        }, () {});
                      }
                    },
                    child: const Text('Test API'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
