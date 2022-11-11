import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/analytics_events.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/instructions_card_vm.dart';
import 'package:vegan_liverpool/utils/analytics.dart';

class InstructionsCard extends StatelessWidget {
  const InstructionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Analytics.track(
          eventName: AnalyticsEvents.addInstructions,
        );
        showModalBottomSheet<Widget>(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (_) => const AdditionalInstructionsModalSheet(),
        );
      },
      child: StoreConnector<AppState, InstructionsCardViewModel>(
        converter: InstructionsCardViewModel.fromStore,
        builder: (context, viewmodel) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: viewmodel.hasInstructions
                ? [
                    SizedBox(
                      width: width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add additional instructions',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            viewmodel.instructions,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 2),
                      onPressed: () => viewmodel.removeInstructions(),
                      icon: const Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    )
                  ]
                : [
                    const Text(
                      'Add additional instructions',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
          );
        },
      ),
    );
  }
}

class AdditionalInstructionsModalSheet extends StatefulWidget {
  const AdditionalInstructionsModalSheet({Key? key}) : super(key: key);

  @override
  State<AdditionalInstructionsModalSheet> createState() =>
      _AdditionalInstructionsModalSheetState();
}

class _AdditionalInstructionsModalSheetState
    extends State<AdditionalInstructionsModalSheet> {
  late GlobalKey<FormBuilderState> _additionalInstructionsForm;

  bool _isLoading = false;

  @override
  void initState() {
    _additionalInstructionsForm = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, void Function(String instructions)>(
            converter: (store) {
              return (String instructions) {
                store.dispatch(
                  updateInstructions(
                    instructions: instructions,
                    successCallback: () => setState(() {
                      _isLoading = false;
                      context.router.pop();
                    }),
                    errorCallback: () {
                      setState(() {
                        _isLoading = false;
                        _additionalInstructionsForm.currentState!
                            .invalidateField(
                          name: 'discountCode',
                          errorText: 'Discount code invalid',
                        );
                      });
                    },
                  ),
                );
              };
            },
            builder: (context, setInstructions) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add additional instructions',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilder(
                    key: _additionalInstructionsForm,
                    child: FormBuilderTextField(
                      maxLines: 4,
                      maxLength: 250,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Delivery Instructions',
                        isDense: true,
                      ),
                      name: 'deliveryInstructions',
                      onChanged: (value) {
                        if (_additionalInstructionsForm.currentState!
                            .fields['deliveryInstructions']!.hasError) {
                          _additionalInstructionsForm
                              .currentState!.fields['deliveryInstructions']!
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
                      setInstructions(
                        _additionalInstructionsForm.currentState!
                            .fields['deliveryInstructions']!.value as String,
                      );
                      context.router.pop();
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
