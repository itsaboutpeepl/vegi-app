import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/address_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/bill_invoice_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/order_items_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/order_confirmed/thanks_card.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/shimmerButton.dart';
import 'package:vegan_liverpool/features/waitingListFunnel/widgets/surveyCompletedCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/view_item.dart';
import 'package:vegan_liverpool/redux/actions/past_order_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/orderConfirmed.dart';
import 'package:vegan_liverpool/redux/viewsmodels/survey_thanks.dart';

class SurveyThanksScreen extends StatelessWidget {
  const SurveyThanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SurveyThanksViewModel>(
      converter: SurveyThanksViewModel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          backgroundColor: themeShade1100,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: 30,
              top: MediaQuery.of(context).size.height * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SurveyCompletedCard(),
              ],
            ),
          ),
        );
      },
    );
  }
}
