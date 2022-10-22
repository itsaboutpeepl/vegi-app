import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/features/shared/widgets/numeric_keyboard.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/topup.dart';
import 'package:vegan_liverpool/services.dart';

//TODO: add save card functionality
class TopupScreen extends StatefulWidget {
  @override
  _TopupScreenState createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen>
    with SingleTickerProviderStateMixin {
  String _amountText = "25";
  bool _isPreloading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  //decimal place checker
  String decimalChecker(double a, {int decimalPlaces = 2}) {
    List<String> values = a.toString().split('.');
    if (values.length == 2 && values[1].length > decimalPlaces) {
      return "Too long";
    } else {
      return a.toString();
    }
  }

  void _onKeyPress(String value, {bool back = false}) {
    if (back) {
      if (_amountText.length == 0) return;
      _amountText = _amountText.substring(0, _amountText.length - 1);
    } else {
      if (_amountText == '0' && value == '0') {
        _amountText = _amountText;
      } else if (!(num.parse(_amountText + value) > 250) &&
          !(decimalChecker(double.parse(_amountText + value)) == 'Too long')) {
        _amountText = _amountText + value;
      }
      // Prevent deposits greater than 250

    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Top up using your card',
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Topups are limited to £250',
                style: TextStyle(
                  color: Color(
                    0xFF898989,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              _amountText,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'GBP',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(
                                      0xFF808080,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Divider(
                        color: Color(0xFFE8E8E8),
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                NumericKeyboard(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onKeyboardTap: _onKeyPress,
                  rightButtonFn: () {
                    _onKeyPress('', back: true);
                  },
                  rightIcon: SvgPicture.asset(
                    'assets/images/backspace.svg',
                    // width: 28,
                  ),
                  leftButtonFn: () {
                    if (_amountText.contains('.')) {
                      return;
                    } else {
                      setState(() {
                        _amountText = _amountText + '.';
                      });
                    }
                  },
                  leftIcon: Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            StoreConnector<AppState, TopUpViewModel>(
              distinct: true,
              converter: TopUpViewModel.fromStore,
              builder: (_, viewModel) => Center(
                child: PrimaryButton(
                  // labelFontWeight: FontWeight.normal,
                  label: I10n.of(context).next_button,
                  onPressed: () => stripeService.handleStripe(
                    walletAddress: viewModel.walletAddress,
                    amountText: _amountText,
                    context: context,
                    shouldPushToHome: true,
                  ),
                  preload: _isPreloading,
                  disabled: _isPreloading,
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Leave the topup screen as it is. should work with any amount. 
//if the user does not have a balance during checkout, then just popup the stripe sheet and get the payment done.
//after the payment is done, make a call to update the balances and show dialog saying that it was a success or error.
//after that, show the peepl pay sheet and then its the normal order flow. 