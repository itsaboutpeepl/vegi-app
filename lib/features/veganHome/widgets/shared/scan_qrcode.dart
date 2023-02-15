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
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/scanProductQRCodeViewModel.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({
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
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrCodeResult = "Not Yet Scanned";

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SuggestProductViewModel>(
      distinct: true,
      converter: SuggestProductViewModel.fromStore,
      builder: (_, viewModel) {
        if (viewModel.isIosSimulator) {
          return SuggestionQRCodeManualInputCard(
            scanQRCodeHandler: (qrCode, success, errorHandler) {
              widget.scanQRCodeHandler(
                qrCode,
                () {
                  context.router.pop();
                  success();
                },
                errorHandler,
              );
            },
          );
        }
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Message displayed over here
              // Text(
              //   "Result",
              //   style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              //   textAlign: TextAlign.center,
              // ),
              // Text(
              //   qrCodeResult,
              //   style: TextStyle(
              //     fontSize: 8.0,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),

              // //Button to scan QR code
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.white,
              //     foregroundColor: Colors.black,
              //     fixedSize: const Size(120, 40),
              //     textStyle: const TextStyle(fontWeight: FontWeight.w900),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     padding: const EdgeInsets.all(15),
              //   ),
              //   onPressed: () async {
              //     String codeSanner =
              //         // await BarcodeScanner.scan(); //barcode scanner
              //         await FlutterBarcodeScanner.scanBarcode(
              //             COLOR_CODE,
              //             CANCEL_BUTTON_TEXT,
              //             isShowFlashIcon,
              //             scanMode);
              //     setState(() {
              //       qrCodeResult = codeSanner;
              //     });
              //   },
              //   child: Text(
              //     "Open Scanner",
              //     style: TextStyle(color: Colors.indigo[900]),
              //   ),
              // ),
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : const Text('Scan a code'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Text('Flash: ${snapshot.data}');
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getCameraInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text(
                                  'Camera facing ${describeEnum(snapshot.data!)}');
                            } else {
                              return const Text('loading');
                            }
                          },
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.pauseCamera();
                      },
                      child:
                          const Text('pause', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.resumeCamera();
                      },
                      child:
                          const Text('resume', style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onQRViewCreated(
    QRViewController controller,
  ) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      //todo: Add visible feedback to view to show that trying to find the barcode...
      setState(() {
        result = scanData;
      });
      if (scanData.code != null) {
        widget.scanQRCodeHandler(
          scanData.code!,
          () {
            context.router.pop();
            showInfoSnack(
              context,
              title: 'Barcode scanned.',
            );
          },
          (errMessage, errCode) {
            log.error(errMessage);
            if (errCode == QRCodeScanErrCode.productNotFound) {
              showErrorSnack(
                context: context,
                title: errCode == QRCodeScanErrCode.productNotFound
                    ? 'Product not found'
                    : 'Unable to scan barcode',
              );
              showDialog<Widget>(
                context: context,
                builder: (context) => const SuggestProductDialog(),
              );
            } else {
              showErrorSnack(
                context: context,
                title: 'Unable to scan barcode',
              );
            }
          },
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
