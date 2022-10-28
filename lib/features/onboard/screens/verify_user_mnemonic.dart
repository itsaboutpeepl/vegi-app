import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/features/onboard/widgets/wordWidget.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/account.dart';

class VerifyUserMnemonic extends StatefulWidget {
  const VerifyUserMnemonic({Key? key}) : super(key: key);

  @override
  State<VerifyUserMnemonic> createState() => _VerifyUserMnemonicState();
}

class _VerifyUserMnemonicState extends State<VerifyUserMnemonic> {
  List<int> selectedWordsNum = <int>[];
  final _formKey = GlobalKey<FormState>();

  List<int> getRandom3Numbers() {
    final List<int> list = List<int>.generate(12, (int index) => index + 1)
      ..shuffle();
    final List<int> _l = list.sublist(0, 3)..sort();
    return _l;
  }

  @override
  void initState() {
    super.initState();

    selectedWordsNum = getRandom3Numbers();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Verify Seed Phrase',
      body: StoreConnector<AppState, AccountViewModel>(
        converter: AccountViewModel.fromStore,
        builder: (_, viewmodel) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  'Please enter the correct words below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Word(
                        mnemonic: viewmodel.mnemonic,
                        wordIndex: selectedWordsNum[0],
                      ),
                      const SizedBox(height: 16),
                      Word(
                        mnemonic: viewmodel.mnemonic,
                        wordIndex: selectedWordsNum[1],
                      ),
                      const SizedBox(height: 16),
                      Word(
                        mnemonic: viewmodel.mnemonic,
                        wordIndex: selectedWordsNum[2],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PrimaryButton(
                  label: 'Verify',
                  onPressed: () {
                    //viewmodel.finishSaveSeedPhrase();
                    if (_formKey.currentState!.validate()) {
                      context.router.popUntilRoot();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
