
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';

class ScanProductSuggestionQRCode extends StatelessWidget {
  const ScanProductSuggestionQRCode({
    Key? key,
    required this.nextPage,
    required this.previousPage,
    this.scannedQRCode,
  }) : super(key: key);

  final void Function() nextPage;
  final void Function() previousPage;
  final String? scannedQRCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeShade1100,
      body: StoreConnector<AppState, SuggestProductViewModel>(
        distinct: true,
        converter: SuggestProductViewModel.fromStore,
        builder: (_, viewModel) {
          return ScanQRCode(
            scanQRCodeHandler: (qrCode, success, errorHandler) {
              viewModel.addProductQRCodeForProductSuggestion(
                qrCode,
                () {
                  // context.router.pop();
                  success();
                },
                errorHandler,
              );
              nextPage();
            },
            handleError: (scannedQRCode, errMessage, errCode) {
              showErrorSnack(
                context: context,
                title: 'Unable to scan barcode',
              );
            },
          );
        },
      ),
    );
  }
}
