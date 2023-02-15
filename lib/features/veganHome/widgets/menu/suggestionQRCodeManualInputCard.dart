import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';

class SuggestionQRCodeManualInputCard extends StatefulWidget {
  const SuggestionQRCodeManualInputCard({
    Key? key,
    required this.scanQRCodeHandler,
  }) : super(key: key);

  final void Function(
      String,
      void Function(),
      void Function(
    String,
    QRCodeScanErrCode,
  )) scanQRCodeHandler;

  @override
  State<SuggestionQRCodeManualInputCard> createState() =>
      _SuggestionQRCodeManualInputCardState();
}

class _SuggestionQRCodeManualInputCardState
    extends State<SuggestionQRCodeManualInputCard> {
  final barcodeController = TextEditingController(text: '');
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
                  'Barcode Manual Input',
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
                      children: <Widget>[
                        TextFormField(
                          controller: barcodeController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            backgroundColor: Theme.of(context).canvasColor,
                          ),
                          validator: (value) {
                            final RegExp regex = RegExp(
                              r'^[0-9]+$',
                            );

                            if (value == null ||
                                value.isEmpty ||
                                !regex.hasMatch(value)) {
                              return 'Barcode must be a text of digits.';
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            // fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.only(
                                left: 12, top: 12, right: 12),
                            labelText: 'Barcode',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: PrimaryButton(
                    preload: isPreloading,
                    disabled: isPreloading,
                    label: I10n.of(context).save_button,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isPreloading = true;
                        });

                        final qrCodeStr = barcodeController.text;

                        widget.scanQRCodeHandler(
                          qrCodeStr,
                          () {
                            setState(() {
                              isPreloading = false;
                            });
                          },
                          (errMessage, errCode) async {
                            setState(() {
                              isPreloading = false;
                            });
                            final warning =
                                'Error adding barcode to product suggestion: $errMessage';
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
                        );
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
