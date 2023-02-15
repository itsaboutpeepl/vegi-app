import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/scanProductQRCodeViewModel.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanProductSuggestionQRCode extends StatelessWidget {
  const ScanProductSuggestionQRCode({
    Key? key,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final void Function() nextPage;
  final void Function() previousPage;

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
                success,
                errorHandler,
              );
              nextPage();
            },
          );
        },
      ),
    );
  }
}
