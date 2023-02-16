import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/scanProductQRCodeViewModel.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanListedProductQRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: StoreConnector<AppState, ScanProductQRCodeViewModel>(
        distinct: true,
        converter: ScanProductQRCodeViewModel.fromStore,
        builder: (_, viewModel) {
          return ScanQRCode(
            scanQRCodeHandler: viewModel.scanQRCode,
            handleError: (scannedQRCode, errMessage, errCode) {
              if (errCode == QRCodeScanErrCode.productNotFound) {
                // showErrorSnack(
                //   context: context,
                //   title: errCode == QRCodeScanErrCode.productNotFound
                //       ? 'Product not found'
                //       : 'Unable to scan barcode',
                // );
                showDialog<Widget>(
                    context: context,
                    builder: (context) {
                      return SuggestProductDialog(
                        scannedQRCode: scannedQRCode,
                      );
                    },);
              } else {
                showErrorSnack(
                  context: context,
                  title: 'Unable to scan barcode',
                );
              }
            },
          );
        },
      ),
    );
  }
}
