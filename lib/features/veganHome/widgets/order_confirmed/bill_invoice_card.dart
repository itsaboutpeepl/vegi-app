import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/bill_invoice_vm.dart';

class BillInvoiceCard extends StatelessWidget {
  const BillInvoiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: themeShade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: StoreConnector<AppState, BillInvoiceViewModel>(
            converter: BillInvoiceViewModel.fromStore,
            builder: (context, viewmodel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bill Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount paid in GBP',
                      ),
                      Text(
                        viewmodel.gbpxUsed,
                      ),
                    ],
                  ),
                  if (viewmodel.didUsePPL)
                    const SizedBox(
                      height: 5,
                    ),
                  if (viewmodel.didUsePPL)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Amount paid in PPL rewards',
                        ),
                        Text(
                          viewmodel.pplUsed,
                        ),
                      ],
                    ),
                  const Divider(
                    color: themeShade300,
                    thickness: 1,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rewards Earned',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        'assets/images/avatar-ppl-red.png',
                        width: 23,
                      ),
                      const Spacer(),
                      Text(
                        '${viewmodel.pplRewardsEarned} ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '(${viewmodel.pplRewardsEarnedValue})',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
