
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode_container.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/scanProductQRCodeViewModel.dart';

class ScanListedProductQRCodeScreen extends StatelessWidget {
  const ScanListedProductQRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScanProductQRCodeViewModel>(
      distinct: true,
      converter: ScanProductQRCodeViewModel.fromStore,
      builder: (_, viewModel) {
        return ScanQRCodeScreen(
          isNumericBarCode: true,
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
                },
              );
            } else {
              showErrorSnack(
                context: context,
                title: 'Unable to scan barcode',
              );
            }
          },
        );
      },
    );
  }
}
