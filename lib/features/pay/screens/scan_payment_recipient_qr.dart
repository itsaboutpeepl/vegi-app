import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPaymentRecipientQR extends StatefulWidget {
  @override
  _ScanPaymentRecipientQRState createState() => _ScanPaymentRecipientQRState();
}

class _ScanPaymentRecipientQRState extends State<ScanPaymentRecipientQR> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
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
                    : Text('Scan a code'),
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
                    ),
                  ),
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
                    child: const Text('pause', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller?.resumeCamera();
                    },
                    child: const Text('resume', style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
