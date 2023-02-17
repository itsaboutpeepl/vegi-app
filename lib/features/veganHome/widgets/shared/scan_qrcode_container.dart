import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanQRCodeContainer extends StatelessWidget {
  const ScanQRCodeContainer({
    Key? key,
    required this.scanQRCodeHandler,
    required this.handleError,
  }) : super(key: key);

  final void Function(String, String, QRCodeScanErrCode) handleError;

  final void Function(
    String,
    void Function(),
    void Function(
      String,
      QRCodeScanErrCode,
    ),
  ) scanQRCodeHandler;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SuggestProductViewModel>(
      distinct: true,
      converter: SuggestProductViewModel.fromStore,
      builder: (_, viewModel) {
        if (viewModel.isIosSimulator) {
          return SuggestionQRCodeManualInputCard(
            scanQRCodeHandler: (qrCode, success, errorHandler) {
              scanQRCodeHandler(
                qrCode,
                () {
                  success();
                },
                errorHandler,
              );
            },
            handleError: (scannedQRCode, errMessage, errCode) {
              log.error(errMessage);
              handleError(scannedQRCode, errMessage, errCode);
            },
          );
        } else {
          return ScanQRCode(
            scanQRCodeHandler: scanQRCodeHandler,
            handleError: handleError,
          );
        }
      },
    );
  }
}
