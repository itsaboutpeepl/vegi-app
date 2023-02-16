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
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({
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
                  success();
                },
                errorHandler,
              );
            },
            handleError: (scannedQRCode, errMessage, errCode) {
              log.error(errMessage);
              widget.handleError(scannedQRCode, errMessage, errCode);
            },
          );
        }
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
            widget.handleError(scanData.code!, errMessage, errCode);
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
