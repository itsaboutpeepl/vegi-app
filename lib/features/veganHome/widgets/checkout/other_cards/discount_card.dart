import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/discount_card_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Analytics.track(
          eventName: AnalyticsEvents.addDiscount,
        );
        showModalBottomSheet<Widget>(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (_) => const DiscountSelectorModalSheet(),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: themeShade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: StoreConnector<AppState, DiscountCardViewModel>(
              converter: DiscountCardViewModel.fromStore,
              builder: (context, viewmodel) {
                return Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.percent,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      viewmodel.hasDiscount
                          ? viewmodel.discountCode
                          : 'Add a discount code',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    if (viewmodel.hasDiscount)
                      IconButton(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 2),
                        onPressed: () => viewmodel.removeDiscount(),
                        icon: const Icon(
                          Icons.remove,
                          size: 18,
                        ),
                      )
                    else
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DiscountSelectorModalSheet extends StatefulWidget {
  const DiscountSelectorModalSheet({Key? key}) : super(key: key);

  @override
  State<DiscountSelectorModalSheet> createState() =>
      _DiscountSelectorModalSheetState();
}

class _DiscountSelectorModalSheetState
    extends State<DiscountSelectorModalSheet> {
  late GlobalKey<FormBuilderState> _discountForm;

  bool _isLoading = false;

  @override
  void initState() {
    _discountForm = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, void Function(String)>(
            converter: (store) {
              return (discountCode) {
                store.dispatch(
                  updateCartDiscount(
                    newDiscountCode: discountCode,
                    successCallback: () => setState(() {
                      _isLoading = false;
                      context.router.pop();
                    }),
                    errorCallback: () {
                      setState(() {
                        _isLoading = false;
                        _discountForm.currentState!.invalidateField(
                          name: 'discountCode',
                          errorText: 'Discount code invalid',
                        );
                      });
                    },
                  ),
                );
              };
            },
            builder: (context, setDiscountCode) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter a discount code',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilder(
                    key: _discountForm,
                    child: FormBuilderTextField(
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Discount Code',
                        isDense: true,
                      ),
                      name: 'discountCode',
                      onChanged: (value) {
                        if (_discountForm
                            .currentState!.fields['discountCode']!.hasError) {
                          _discountForm.currentState!.fields['discountCode']!
                              .reset();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      setState(() => _isLoading = true);
                      setDiscountCode(
                        _discountForm.currentState!.fields['discountCode']!
                            .value as String,
                      );
                    },
                    label: 'Apply',
                    width: double.infinity,
                    preload: _isLoading,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
