import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/vegiDialogButton.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class _StripePaymentConfirmedDialogViewModel extends Equatable {
  const _StripePaymentConfirmedDialogViewModel({
    required this.confirmedPayment,
  });

  factory _StripePaymentConfirmedDialogViewModel.fromStore(
    Store<AppState> store,
  ) {
    return _StripePaymentConfirmedDialogViewModel(
      confirmedPayment: store.state.cartState.confirmedPayment,
    );
  }
  final bool confirmedPayment;

  @override
  List<Object> get props => [
        confirmedPayment,
      ];
}

class StripePaymentConfirmedDialog extends StatelessWidget {
  const StripePaymentConfirmedDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        context.router
            .pop()
            .then((_) => context.router.navigate(const OrderConfirmedScreen()));
        // await rootRouter.popAndPush(const OrderConfirmedScreen());
        // if (widget.shouldPushToHome) {
        //   context.router.navigate(const VeganHomeTab());
        // }
      },
    );
    return VegiDialog<_StripePaymentConfirmedDialogViewModel>(
      storeConverter: _StripePaymentConfirmedDialogViewModel.fromStore,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Payment submitted',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 15),
          VegiDialogButton(
            label: 'O.K.',
            icon: Icons.thumb_up_alt,
            onPressed: () {
              context.router.pop().then(
                    (_) =>
                        context.router.navigate(const OrderConfirmedScreen()),
                  );
              // await rootRouter.popAndPush(const OrderConfirmedScreen());
            },
          ),
        ],
      ),
    );
  }
}
