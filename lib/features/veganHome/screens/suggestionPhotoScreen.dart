import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/generated/l10n.dart';
import 'package:vegan_liverpool/models/app_state.dart';
import 'package:vegan_liverpool/redux/viewsmodels/suggestProductViewModel.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class SuggestionPhotoScreen extends StatefulWidget {
  const SuggestionPhotoScreen({
    Key? key,
    required this.suggestion,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final ProductSuggestionImageType suggestion;
  final void Function() nextPage;
  final void Function() previousPage;

  @override
  State<SuggestionPhotoScreen> createState() => _SuggestionPhotoScreenState();
}

class _SuggestionPhotoScreenState extends State<SuggestionPhotoScreen>
    with SingleTickerProviderStateMixin {
  final textController = TextEditingController(text: '');

  ImagePicker picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  bool isPreloading = false;

  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 0.4).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void Function(File?) _handleImageFileCb(
    SuggestProductViewModel viewModel,
    void Function() success,
    void Function(String) error,
  ) =>
      (File? image) {
        viewModel.addProductImageForProductSuggestion(
          widget.suggestion,
          image,
          success,
          error,
        );
      };

  void _handleURLButtonPress(
    BuildContext context,
    ImageSourceType type,
    SuggestProductViewModel viewModel,
    void Function() success,
    void Function(String) error,
  ) {
    final currentRouteName = context.router.current.name;
    context.router.push(
      ImageFromGalleryEx(
        type: type,
        handleImagePicked: (File? f) {
          context.router.popUntilRouteWithName(currentRouteName);
          return _handleImageFileCb(viewModel, success, error)(f);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: A screen with Title, Photo Taker, Persistent Flushbar to
    //direct user as to what photo we want that is reusable like SurveyQuestionScreen,
    //todo: Allow the screens to be skipped if there is no ingredeints list for example
    return StoreConnector<AppState, SuggestProductViewModel>(
        converter: SuggestProductViewModel.fromStore,
        builder: (_, viewmodel) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 30,
              top: MediaQuery.of(context).size.height * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        suggestProductPhotoDirector(suggestProductPhotoDirectorLabelMap[widget.suggestion]!),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        color: themeShade600,
                        child: const Text(
                          photoPickImageFromGalleryText,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _handleURLButtonPress(
                            context,
                            ImageSourceType.gallery,
                            viewmodel,
                            () {
                              widget.nextPage();
                            },
                            (errMessage) async {
                              showErrorSnack(
                                context: context,
                                title: I10n.of(context).oops,
                                message:
                                    'An error occurred uploading your image to the cloud.',
                              );
                              await Sentry.captureException(
                                Exception(errMessage),
                                // stackTrace: s, // from catch (e, s)
                                hint:
                                    'ERROR (upload Image from Gallery) - $errMessage',
                              );
                            },
                          );
                        },
                      ),
                      MaterialButton(
                        color: themeShade600,
                        child: const Text(
                          photoTakePhotoWithCameraText,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _handleURLButtonPress(
                            context,
                            ImageSourceType.camera,
                            viewmodel,
                            () {
                              widget.nextPage();
                            },
                            (errMessage) async {
                              showErrorSnack(
                                context: context,
                                title: I10n.of(context).oops,
                                message:
                                    'An error occurred uploading your image to the cloud.',
                              );
                              await Sentry.captureException(
                                Exception(errMessage),
                                // stackTrace: s, // from catch (e, s)
                                hint:
                                    'ERROR (upload Image from Camera) - $errMessage',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
