import 'dart:io';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vegan_liverpool/common/router/routes.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode_container.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/models/cart/createOrderForFulfilment.dart';
import 'package:vegan_liverpool/redux/viewsmodels/scanPaymentRecipientQRViewModel.dart';

/// Screen Route to Scan a Cashier's QR Code to receive the basket to Consumers phone
/// along with the cashier's address and allow the user to accept the basket and pay for it.
class ScanPaymentRecipientQR extends StatelessWidget {
  const ScanPaymentRecipientQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScanPaymentRecipientQRViewModel>(
      distinct: true,
      converter: ScanPaymentRecipientQRViewModel.fromStore,
      builder: (context, viewModel) {
        return ScanQRCodeScreen(
          isNumericBarCode: false,
          scanQRCodeHandler: (qrCode, successHandler, errorHandler) {
            viewModel.decodeQRCode(
              qrCode: qrCode,
              success: successHandler,
              error: (p0) => errorHandler(
                p0,
                QRCodeScanErrCode.couldntScan,
              ),
            );
          },
          handleError: (p0, p1, p2) {},
        );
      },
    );
  }
}
