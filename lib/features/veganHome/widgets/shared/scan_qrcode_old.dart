// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:vegan_liverpool/common/router/routes.gr.dart';
// import 'package:vegan_liverpool/constants/enums.dart';
// import 'package:vegan_liverpool/constants/theme.dart';
// import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
// import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestProductDialog.dart';
// import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
// import 'package:vegan_liverpool/utils/log/log.dart';

// class ScanQRCode extends StatefulWidget {
//   const ScanQRCode({
//     Key? key,
//     required this.scanQRCodeHandler,
//     required this.handleError,
//   }) : super(key: key);

//   final void Function(String, String, QRCodeScanErrCode) handleError;

//   final void Function(
//     String,
//     void Function(),
//     void Function(
//       String,
//       QRCodeScanErrCode,
//     ),
//   ) scanQRCodeHandler;

//   @override
//   _ScanQRCodeState createState() => _ScanQRCodeState();
// }

// class _ScanQRCodeState extends State<ScanQRCode> {
//   String qrCodeResult = 'Not Yet Scanned';

//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   Barcode? result;
//   bool isProcessing = false;

//   final manualQRCodeInputController = TextEditingController();

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       cameraController!.pauseCamera();
//     } else if (Platform.isIOS) {
//       cameraController!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: themeShade1200),
//       padding: const EdgeInsets.all(0),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                 // flex: 5,

//                 child: QRView(
//                   key: qrKey,
//                   onQRViewCreated: (controller) => _onQRViewCreated(
//                     context,
//                     controller,
//                   ),
//                 ),

//                 // child: Container(
//                 //   // height: 60,
//                 //   color: Colors.blue,
//                 // ),
//               ),
//               // Container(
//               //   height: 70,
//               //   decoration: const BoxDecoration(color: themeShade1200),
//               // child: Form(
//               //   key: _formKey,
//               //   child: Padding(
//               //     padding: const EdgeInsets.all(8.0),
//               //     child: Column(
//               //       mainAxisAlignment: MainAxisAlignment.end,
//               //       mainAxisSize: MainAxisSize.max,
//               //       children: <Widget>[
//               //         TextFormField(
//               //           controller: manualQRCodeInputController,
//               //           keyboardType: TextInputType.number,
//               //           onFieldSubmitted: (value) async {
//               //             await _submitQRCode(value);
//               //           },
//               //           style: TextStyle(
//               //             color: Theme.of(context).colorScheme.onSurface,
//               //             backgroundColor: Theme.of(context).canvasColor,
//               //           ),
//               //           decoration: InputDecoration(
//               //             fillColor: Theme.of(context).canvasColor,
//               //             // fillColor: Colors.transparent,
//               //             contentPadding: const EdgeInsets.only(
//               //                 left: 12, top: 12, right: 12),
//               //             labelText: 'Enter barcode here',
//               //             // border: InputBorder.none,
//               //             border: OutlineInputBorder(
//               //               borderSide: BorderSide(
//               //                 width: 2,
//               //                 color: Theme.of(context).colorScheme.onSurface,
//               //               ),
//               //             ),
//               //             focusedBorder: OutlineInputBorder(
//               //               borderSide: BorderSide(
//               //                 width: 2,
//               //                 color: Theme.of(context).colorScheme.onSurface,
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               // ),
//               Container(
//                 height: MediaQuery.of(context).viewInsets.bottom,
//                 color: Colors.black,
//               ),
//               // Expanded(
//               //   flex: 1,
//               //   child: Center(
//               //     child: (result != null)
//               //         ? Text(
//               //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//               //         : const Text('Scan a code'),
//               //   ),
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   crossAxisAlignment: CrossAxisAlignment.center,
//               //   children: <Widget>[
//               //     Container(
//               //       margin: const EdgeInsets.all(8),
//               //       child: ElevatedButton(
//               //         onPressed: () async {
//               //           await controller?.toggleFlash();
//               //           setState(() {});
//               //         },
//               //         child: FutureBuilder(
//               //           future: controller?.getFlashStatus(),
//               //           builder: (context, snapshot) {
//               //             return Text('Flash: ${snapshot.data}');
//               //           },
//               //         ),
//               //       ),
//               //     ),
//               //     Container(
//               //       margin: const EdgeInsets.all(8),
//               //       child: ElevatedButton(
//               //           onPressed: () async {
//               //             await controller?.flipCamera();
//               //             setState(() {});
//               //           },
//               //           child: FutureBuilder(
//               //             future: controller?.getCameraInfo(),
//               //             builder: (context, snapshot) {
//               //               if (snapshot.data != null) {
//               //                 return Text(
//               //                     'Camera facing ${describeEnum(snapshot.data!)}');
//               //               } else {
//               //                 return const Text('loading');
//               //               }
//               //             },
//               //           ),),
//               //     )
//               //   ],
//               // ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   crossAxisAlignment: CrossAxisAlignment.center,
//               //   children: <Widget>[
//               //     Container(
//               //       margin: const EdgeInsets.all(8),
//               //       child: ElevatedButton(
//               //         onPressed: () async {
//               //           await controller?.pauseCamera();
//               //         },
//               //         child: const Text('pause', style: TextStyle(fontSize: 20)),
//               //       ),
//               //     ),
//               //     Container(
//               //       margin: const EdgeInsets.all(8),
//               //       child: ElevatedButton(
//               //         onPressed: () async {
//               //           await controller?.resumeCamera();
//               //         },
//               //         child: const Text('resume', style: TextStyle(fontSize: 20)),
//               //       ),
//               //     )
//               //   ],
//               // ),
//             ],
//           ),
//           Positioned(
//             top: 10,
//             left: 10,
//             right: 10,
//             child: Container(
//               height: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)), //here
//                 color: themeShade1200,
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //       color: Theme.of(context).primaryColor,
//                 //       offset: Offset(0, -5),
//                 //       blurRadius: 10.0)
//                 // ],
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   height: 50,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.max,
//                     children: <Widget>[
//                       Expanded(
//                         child: TextFormField(
//                           controller: manualQRCodeInputController,
//                           keyboardType: TextInputType.number,
//                           onFieldSubmitted: (value) async {
//                             await _submitQRCode(context, value);
//                           },
//                           style: TextStyle(
//                             color: Colors.white,
//                             backgroundColor: Colors.transparent,
//                           ),
//                           decoration: InputDecoration(
//                             fillColor: themeShade1000,
//                             // fillColor: Colors.transparent,
//                             contentPadding: const EdgeInsets.only(
//                               left: 12,
//                               top: 12,
//                               right: 12,
//                             ),
//                             labelText: 'Enter barcode here',
//                             // border: InputBorder.none,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0,
//                                 color: Theme.of(context).colorScheme.onSurface,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 2,
//                                 color: Theme.of(context).colorScheme.onSurface,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           _submitQRCode(
//                             context,
//                             manualQRCodeInputController.text,
//                           );
//                         },
//                         icon: Icon(
//                           Icons.send,
//                           size: 28.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(
//     BuildContext context,
//     QRViewController controller,
//   ) {
//     this.cameraController = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       //todo: Add visible feedback to view to show that trying to find the barcode...
//       await _pauseCamera();
//       setState(() {
//         isProcessing = true;
//         result = scanData;
//       });
//       if (scanData.code != null) {
//         await _submitQRCode(context, scanData.code!);
//       } else {
//         await _resumeCamera();
//       }
//     });
//   }

//   Future<void> _pauseCamera() async {
//     await cameraController?.pauseCamera();
//   }

//   Future<void> _resumeCamera() async {
//     await cameraController?.resumeCamera();
//   }

//   Future<void> _submitQRCode(BuildContext context, String qrCode) async {
//     widget.scanQRCodeHandler(
//       qrCode,
//       () {
//         context.router.replaceAll([
//           const RestaurantMenuScreen()
//         ]); // push the restaurantMenuList to the stack
//         showInfoSnack(
//           context,
//           title: 'Barcode scanned.',
//         );
//       },
//       (errMessage, errCode) {
//         log.error(errMessage);
//         widget.handleError(qrCode, errMessage, errCode);
//       },
//     );
//     await _resumeCamera();
//   }

//   @override
//   void dispose() {
//     cameraController?.dispose();
//     super.dispose();
//   }
// }
