import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class _StripePaymentConfirmedDialogViewModel extends Equatable {
  const _StripePaymentConfirmedDialogViewModel({
    required this.isLoading,
    required this.isError,
    required this.isSuccessful,
  });

  factory _StripePaymentConfirmedDialogViewModel.fromStore(Store<AppState> store) {
    return _StripePaymentConfirmedDialogViewModel(
      isLoading: store.state.cartState.transferringTokens,
      isError: store.state.cartState.errorCompletingPayment,
      isSuccessful: store.state.cartState.confirmedPayment,
    );
  }
  final bool isLoading;
  final bool isError;
  final bool isSuccessful;

  @override
  List<Object> get props => [isLoading, isError, isSuccessful];
}

class StripePaymentConfirmedDialog extends StatefulWidget {
  const StripePaymentConfirmedDialog({
    Key? key,
  }) : super(key: key);
  @override
  State<StripePaymentConfirmedDialog> createState() => _StripePaymentConfirmedDialogState();
}

class _StripePaymentConfirmedDialogState extends State<StripePaymentConfirmedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  int _valueKey = 0;

  Duration theDuration = const Duration(seconds: 3);
  bool _paymentTakingTooLong = false;
  late Timer countdownTimer;
  late DateTime timerFrom;
  DateTime get timerTo => timerFrom.add(theDuration);

  void startTimer(Store<AppState> store) {
    timerFrom = DateTime.now();
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(store),
    );
  }

  int get paymentTookTooLongInNSeconds =>
      timerTo.difference(DateTime.now()).inSeconds;

  void setCountDown(Store<AppState> store) {
    setState(() {
      final seconds = timerTo.difference(DateTime.now()).inSeconds;
      if (seconds < 0) {
        _paymentTakingTooLong = true;
        countdownTimer.cancel();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
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
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _StripePaymentConfirmedDialogViewModel>(
      distinct: true,
      converter: _StripePaymentConfirmedDialogViewModel.fromStore,
      onInit: startTimer,
      onWillChange: (prevVM, nextVM) {
        if (nextVM.isError) {
          setState(() {
            _valueKey = 1;
          });
          Future.delayed(
            const Duration(seconds: 2),
            () {
              context.router
                ..pop()
                ..navigate(const VeganHomeTab());
            },
          );
        }
        if (nextVM.isSuccessful) {
          _valueKey = 2;
          Future.delayed(
            const Duration(seconds: 2),
            () {
              context.router
                ..pop()
                ..navigate(const OrderConfirmedScreen());
            },
          );
        }
      },
      builder: (_, viewmodel) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 28, right: 28),
              child: Center(
                child: AnimatedCrossFade(
                  crossFadeState: viewmodel.isLoading
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                  firstChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  secondChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: viewmodel.isError
                        ? Icon(
                            Icons.error_outline_outlined,
                            size: 50,
                            color: Theme.of(context).primaryColorDark,
                          )
                        : Icon(
                            Icons.done,
                            size: 50,
                            color: Theme.of(context).primaryColorDark,
                          ),
                  ),
                ),
              ),
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    viewmodel.isLoading
                        ? 'Processing your payment'
                        : viewmodel.isError
                            ? 'Something went wrong!'
                            : 'Payment completed successfully',
                    key: ValueKey(_valueKey),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    viewmodel.isLoading
                        ? _paymentTakingTooLong
                            ? 'Sorry if this is taking too long'
                            : ''
                        : viewmodel.isError
                            ? 'Please contact us at $VEGI_SUPPORT_EMAIL'
                            : 'Thank you for your order!',
                    key: ValueKey(_valueKey),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
