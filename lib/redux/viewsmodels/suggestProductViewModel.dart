import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/actions/cart_actions.dart';

class SuggestProductViewModel extends Equatable {
  const SuggestProductViewModel({
    required this.isIosSimulator,
    required this.addProductImageForProductSuggestion,
    required this.addProductQRCodeForProductSuggestion,
    required this.addNameToProductSuggestion,
    required this.addAdditionalInfoForProductSuggestion,
    required this.submitProductSuggestion,
  });

  factory SuggestProductViewModel.fromStore(Store<AppState> store) {
    return SuggestProductViewModel(
      //todo: add function to find a product from selected vendor
      isIosSimulator: store.state.userState.isUsingIosSimulator,
      addProductImageForProductSuggestion:
          (imageType, image, successHandler, errorHandler) {
        if (image == null) {
          errorHandler('Image is empty!');
          return;
        }
        store.dispatch(
          addImageToProductSuggestion(
            imageType,
            image,
            successHandler,
            errorHandler,
          ),
        );
      },
      addNameToProductSuggestion: (
        productName,
        retailerName,
        successHandler,
        errorHandler,
      ) {
        store.dispatch(
          addProductNameToProductSuggestion(
            productName,
            retailerName,
            successHandler,
            errorHandler,
          ),
        );
      },
      addProductQRCodeForProductSuggestion:
          (qrCode, successHandler, errorHandler) {
        store.dispatch(
          addProductQRCodeToProductSuggestion(
            qrCode,
            successHandler,
            errorHandler,
          ),
        );
      },
      addAdditionalInfoForProductSuggestion:
          (suggestionAdditionalInfo, successHandler, errorHandler) {
        store.dispatch(
          addAdditionalInformationToProductSuggestion(
            suggestionAdditionalInfo,
            successHandler,
            errorHandler,
          ),
        );
      },
      submitProductSuggestion: (successHandler, errorHandler) {
        store.dispatch(
          uploadProductSuggestion(
            successHandler,
            errorHandler,
          ),
        );
      },
    );
  }

  final bool isIosSimulator;

  final void Function(
    ProductSuggestionImageType imageType,
    File image,
    void Function() success,
    void Function(String) error,
  ) addProductImageForProductSuggestion;

  final void Function(
    String qrCode,
    void Function() success,
    void Function(String, QRCodeScanErrCode) error,
  ) addProductQRCodeForProductSuggestion;

  final void Function(
    String suggestionAdditionalInfo,
    void Function() success,
    void Function(String) error,
  ) addAdditionalInfoForProductSuggestion;

  final void Function(
    String productName,
    String retailerName,
    void Function() success,
    void Function(String) error,
  ) addNameToProductSuggestion;

  final void Function(
    void Function() success,
    void Function(String, ProductSuggestionUploadErrCode) error,
  ) submitProductSuggestion;

  @override
  List<Object?> get props => [];
}
