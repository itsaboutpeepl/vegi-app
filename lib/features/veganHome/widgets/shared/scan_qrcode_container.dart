import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({
    Key? key,
    required this.scanQRCodeHandler,
    required this.handleError,
    required this.isNumericBarCode,
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

  final bool isNumericBarCode;

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  QRViewController? cameraController;
  bool torchOn = false;
  bool cameraFacingFront = false;
  String qrCodeResult = 'Not Yet Scanned';

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Barcode? result;
  bool isProcessing = false;
  final manualQRCodeInputController = TextEditingController();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      cameraController!.pauseCamera();
    } else if (Platform.isIOS) {
      cameraController!.resumeCamera();
    }
  }

  void _onQRViewCreated(
    BuildContext context,
    QRViewController controller,
  ) {
    setState(() {
      cameraController = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      //todo: Add visible feedback to view to show that trying to find the barcode...
      await _pauseCamera();
      setState(() {
        isProcessing = true;
        result = scanData;
      });
      if (scanData.code != null) {
        await _submitQRCode(context, scanData.code!);
      } else {
        await _resumeCamera();
      }
    });
  }

  Future<void> _pauseCamera() async {
    await cameraController?.pauseCamera();
  }

  Future<void> _resumeCamera() async {
    await cameraController?.resumeCamera();
  }

  Future<void> _submitQRCode(BuildContext context, String qrCode) async {
    widget.scanQRCodeHandler(
      qrCode,
      () async {
        await showInfoSnack(
          context,
          title: 'Barcode scanned.',
        );
        setState(() {
          isProcessing = false;
        });
        await rootRouter.replaceAll([
          const RestaurantMenuScreen()
        ]); // push the restaurantMenuList to the stack
      },
      (errMessage, errCode) {
        log.error(errMessage);
        widget.handleError(qrCode, errMessage, errCode);
        setState(() {
          isProcessing = false;
        });
      },
    );
    await _resumeCamera();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SuggestProductViewModel>(
      distinct: true,
      converter: SuggestProductViewModel.fromStore,
      builder: (_, viewModel) {
        if (viewModel.isIosSimulator) {
          return Scaffold(
            backgroundColor: themeShade1100,
            appBar: AppBar(
              title: const Text('Barcode Scanner'),
              actions: [],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                SuggestionQRCodeManualInputCard(
                  isNumericBarCode: widget.isNumericBarCode,
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
                ),
                if (isProcessing)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: themeShade1100,
            appBar: AppBar(
              title: const Text('Barcode Scanner'),
              actions: [
                if (viewModel.isIosSimulator)
                  IconButton(
                    color: Colors.white,
                    icon: torchOn
                        ? const Icon(Icons.flash_on, color: Colors.yellow)
                        : const Icon(Icons.flash_off, color: Colors.grey),
                    iconSize: 32,
                    onPressed: () async {
                      if (cameraController != null) {
                        await cameraController!.toggleFlash();
                        final flashStatus =
                            await cameraController!.getFlashStatus();
                        setState(() {
                          torchOn = flashStatus ?? false;
                        });
                      }
                    },
                  ),
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(color: themeShade1200),
              padding: const EdgeInsets.all(0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            QRView(
                              key: qrKey,
                              onQRViewCreated: (controller) => _onQRViewCreated(
                                context,
                                controller,
                              ),
                              // cameraFacing: CameraFacing.back,
                              // overlay: QrScannerOverlayShape(
                              //   borderColor: isProcessing
                              //       ? Colors.amber
                              //       : Colors.transparent,
                              //   borderWidth: 2,
                              //   cutOutWidth: 100,
                              //   cutOutHeight: 100,
                              // ),
                            ),
                            Center(
                              child: Container(
                                width: (MediaQuery.of(context)
                                                .size
                                                .aspectRatio <=
                                            1
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.height) *
                                    0.45,
                                height: (MediaQuery.of(context)
                                                .size
                                                .aspectRatio <=
                                            1
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.height) *
                                    0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0),
                                  ), //here
                                  color: Color.fromARGB(15, 50, 187, 255),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 50, 187, 255),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).viewInsets.bottom,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20)), //here
                        color: themeShade1200,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: manualQRCodeInputController,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (value) async {
                                    await _submitQRCode(context, value);
                                  },
                                  style: const TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  decoration: InputDecoration(
                                    fillColor: themeShade1000,
                                    // fillColor: Colors.transparent,
                                    contentPadding: const EdgeInsets.only(
                                      left: 12,
                                      top: 12,
                                      right: 12,
                                    ),
                                    labelText: 'Enter barcode here',
                                    // border: InputBorder.none,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _submitQRCode(
                                    context,
                                    manualQRCodeInputController.text,
                                  );
                                },
                                icon: const Icon(
                                  Icons.send,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isProcessing)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
