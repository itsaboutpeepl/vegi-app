// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:vegan_liverpool/common/router/routes.gr.dart';
// import 'package:vegan_liverpool/constants/enums.dart';
// import 'package:vegan_liverpool/constants/theme.dart';
// import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
// import 'package:vegan_liverpool/features/veganHome/Helpers/extensions.dart';
// import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
// import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionQRCodeManualInputCard.dart';
// import 'package:vegan_liverpool/features/veganHome/widgets/shared/scan_qrcode.dart';
// import 'package:vegan_liverpool/models/app_state.dart';
// import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
// import 'package:vegan_liverpool/utils/log/log.dart';

// class ScanQRCodeScaffold extends StatefulWidget {
//   const ScanQRCodeScaffold({
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
//   State<ScanQRCodeScaffold> createState() => _ScanQRCodeScaffoldState();
// }

// class _ScanQRCodeScaffoldState extends State<ScanQRCodeScaffold> {
//   MobileScannerController cameraController = MobileScannerController(
//     facing: CameraFacing.back,
//     torchEnabled: false,
//     returnImage: true,
//   );
//   bool isLoading = false;
//   List<Barcode> barcodes = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: themeShade1100,
//       appBar: AppBar(
//         title: const Text('Barcode Scanner'),
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state as TorchState) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.cameraFacingState,
//               builder: (context, state, child) {
//                 switch (state as CameraFacing) {
//                   case CameraFacing.front:
//                     return const Icon(Icons.camera_front);
//                   case CameraFacing.back:
//                     return const Icon(Icons.camera_rear);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: StoreConnector<AppState, SuggestProductViewModel>(
//         distinct: true,
//         converter: SuggestProductViewModel.fromStore,
//         builder: (_, viewModel) {
//           if (viewModel.isIosSimulator) {
//             return SuggestionQRCodeManualInputCard(
//               scanQRCodeHandler: (qrCode, success, errorHandler) {
//                 widget.scanQRCodeHandler(
//                   qrCode,
//                   () {
//                     success();
//                   },
//                   errorHandler,
//                 );
//               },
//               handleError: (scannedQRCode, errMessage, errCode) {
//                 log.error(errMessage);
//                 widget.handleError(scannedQRCode, errMessage, errCode);
//               },
//             );
//           } else {
//             // return ScanQRCode(
//             //   scanQRCodeHandler: widget.scanQRCodeHandler,
//             //   handleError: widget.handleError,
//             // );
//             return MobileScanner(
//               // fit: BoxFit.contain,
//               controller: cameraController,
//               onDetect: (capture) {
//                 setState(() {
//                   barcodes = capture.barcodes;
//                   isLoading = true;
//                 });
//                 //todo: draw the green rects to join the dots on barcodes

//                 final Uint8List? image = capture.image;
//                 for (final barcode in capture.barcodes) {
//                   debugPrint('Barcode found! ${barcode.rawValue}');
//                 }
//                 //if multiple barcodes, pick first for now, pick biggest one?
//                 Barcode? barcode;
//                 if (capture.barcodes.length > 1) {
//                   final sizes = Map.fromEntries(
//                     capture.barcodes.map(
//                       (bc) => MapEntry(
//                         bc.rawValue,
//                         bc.corners != null && bc.corners!.length == 4
//                             ? rectArea(
//                                 bc.corners![0],
//                                 bc.corners![1],
//                                 bc.corners![2],
//                                 bc.corners![3],
//                               )
//                             : 0.0,
//                       ),
//                     ),
//                   );
//                   final biggestRV = sizes.entries
//                       .max(maxComparitor: (a, b) => a.value > b.value);
//                   barcode = capture.barcodes
//                       .where((bc) => bc.rawValue == biggestRV.key)
//                       .first;
//                 } else if (capture.barcodes.length == 1) {
//                   barcode = capture.barcodes.first;
//                 } else {
//                   barcode = null;
//                 }

//                 if (barcode != null && barcode.rawValue != null) {
//                   widget.scanQRCodeHandler(
//                     barcode.rawValue!,
//                     () {
//                       context.router.replaceAll([
//                         const RestaurantMenuScreen()
//                       ]); // push the restaurantMenuList to the stack
//                       showInfoSnack(
//                         context,
//                         title: 'Barcode scanned.',
//                       );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     },
//                     (errMessage, errCode) {
//                       log.error(errMessage);
//                       widget.handleError(
//                         barcode!.rawValue!,
//                         errMessage,
//                         errCode,
//                       );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     },
//                   );
//                 }

//                 if (image != null) {
//                   viewModel.addProductImageForProductSuggestion(
//                       ProductSuggestionImageType.barCode, image, () {
//                     setState(() {
//                       isLoading = false;
//                     });
//                   }, (errorMessage) {
//                     log.error(errorMessage);
//                     setState(() {
//                       isLoading = false;
//                     });
//                   });
//                 } else {
//                   setState(() {
//                     isLoading = false;
//                   });
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
