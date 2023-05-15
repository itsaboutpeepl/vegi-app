import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/checkout/details_card_vm.dart';

class YourDetailsCard extends StatelessWidget {
  const YourDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet<Widget>(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (_) => const YourDetailsModalSheet(),
      ),
      child: Card(
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
            child: StoreConnector<AppState, DetailsCardViewModel>(
              converter: DetailsCardViewModel.fromStore,
              builder: (context, viewmodel) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          viewmodel.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          viewmodel.phone,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (viewmodel.hasEmail)
                          Text(
                            viewmodel.email,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
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

class YourDetailsModalSheet extends StatefulWidget {
  const YourDetailsModalSheet({Key? key}) : super(key: key);

  @override
  State<YourDetailsModalSheet> createState() => _YourDetailsModalSheetState();
}

class _YourDetailsModalSheetState extends State<YourDetailsModalSheet> {
  late GlobalKey<FormBuilderState> _detailsForm;

  @override
  void initState() {
    _detailsForm = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: _detailsForm,
            child: StoreConnector<AppState, DetailsCardViewModel>(
              converter: DetailsCardViewModel.fromStore,
              builder: (context, viewmodel) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Update your details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      initialValue: viewmodel.phone,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Phone number',
                        isDense: true,
                      ),
                      readOnly: true,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      name: 'phoneNumber',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormBuilderTextField(
                      initialValue: viewmodel.name,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Full name',
                        isDense: true,
                      ),
                      name: 'name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      initialValue: viewmodel.email,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Email',
                        isDense: true,
                      ),
                      name: 'email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      onPressed: () {
                        viewmodel.updateDetails(
                          email: _detailsForm
                              .currentState!.fields['email']!.value as String,
                          name: _detailsForm.currentState!.fields['name']!.value
                              as String,
                        );
                        context.router.pop();
                      },
                      label: 'Update',
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
