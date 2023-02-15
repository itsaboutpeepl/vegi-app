import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class SuggestionAdditionalInfoCard extends StatefulWidget {
  const SuggestionAdditionalInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SuggestionAdditionalInfoCard> createState() =>
      _SuggestionAdditionalInfoCardState();
}

class _SuggestionAdditionalInfoCardState
    extends State<SuggestionAdditionalInfoCard> {
  final nameController = TextEditingController(text: '');
  final retailerController = TextEditingController(text: '');
  final wordsController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPreloading = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeShade100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  productSuggestionAdditionalInfoRequestText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextFormField(
                          controller: nameController,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            backgroundColor: Theme.of(context).canvasColor,
                          ),
                          validator: FormBuilderValidators.required(
                            errorText: 'Please add a product name',
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            // fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                                left: 12, top: 12, right: 12),
                            labelText: 'Product Name',
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: retailerController,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            backgroundColor: Theme.of(context).canvasColor,
                          ),
                          validator: FormBuilderValidators.required(
                            errorText: 'Please add a retailer name',
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            // fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 12,
                              top: 12,
                              right: 12,
                            ),
                            labelText: 'Retailer',
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: wordsController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            backgroundColor: Theme.of(context).canvasColor,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            // fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                              left: 12,
                              top: 24,
                              right: 12,
                            ),

                            labelText: 'Additional Information',
                            // border: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StoreConnector<AppState, SuggestProductViewModel>(
                  distinct: true,
                  converter: SuggestProductViewModel.fromStore,
                  builder: (_, viewModel) => Center(
                    child: PrimaryButton(
                      preload: isPreloading,
                      disabled: isPreloading,
                      label: I10n.of(context).save_button,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isPreloading = true;
                          });
                          final suggestionAdditionalInfo = wordsController.text;
                          final productSuggestionName = nameController.text;
                          final productSuggestionRetailerName = retailerController.text;
                          //todo: take text from additional input and add to store and then submit to vegi backend along with photos
                          //TODO Make sure the photo of the barcode ALSO scans it so its a number sent too
                          viewModel
                            ..addAdditionalInfoForProductSuggestion(
                              suggestionAdditionalInfo,
                              () {},
                              (errMessage) async {
                                setState(() {
                                  isPreloading = false;
                                });
                                final warning =
                                    'Error adding additional information to product suggestion: $errMessage';
                                await Sentry.captureMessage(
                                  warning,
                                );
                                showErrorSnack(
                                  context: context,
                                  // ignore: use_build_context_synchronously
                                  message: I10n.of(context).error,
                                  // ignore: use_build_context_synchronously
                                  title: I10n.of(context).oops,
                                );
                              },
                            )
                            ..addNameToProductSuggestion(
                              productSuggestionName,
                              productSuggestionRetailerName,
                              () {},
                              (errMessage) async {
                                setState(() {
                                  isPreloading = false;
                                });
                                final warning =
                                    'Error adding product name to product suggestion: $errMessage';
                                await Sentry.captureMessage(
                                  warning,
                                );
                                showErrorSnack(
                                  context: context,
                                  // ignore: use_build_context_synchronously
                                  message: I10n.of(context).error,
                                  // ignore: use_build_context_synchronously
                                  title: I10n.of(context).oops,
                                );
                              },
                            )
                            ..submitProductSuggestion(() {
                              setState(() {
                                isPreloading = false;
                              });
                              context.router.popUntilRoot();
                            }, (errMessage, errCode) async {
                              setState(() {
                                isPreloading = false;
                              });
                              final warning =
                                  'Error [${errCode.name}] submitting product suggestion to vegi server: $errMessage';
                              await Sentry.captureMessage(
                                warning,
                              );
                              showErrorSnack(
                                context: context,
                                // ignore: use_build_context_synchronously
                                message: I10n.of(context).error,
                                // ignore: use_build_context_synchronously
                                title: I10n.of(context).oops,
                              );
                            });
                        } else {
                          setState(() {
                            isPreloading = false;
                          });
                          showErrorSnack(
                            context: context,
                            message: I10n.of(context).error,
                            title: I10n.of(context).oops,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
