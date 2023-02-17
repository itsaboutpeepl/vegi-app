import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton1.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton2.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class ImageFromGalleryEx extends StatefulWidget {
  const ImageFromGalleryEx(
    this.type, {
    Key? key,
    required this.handleImagePicked,
  }) : super(key: key);

  final ImageSourceType type;

  final void Function(File?) handleImagePicked;

  @override
  _ImageFromGalleryExState createState() => _ImageFromGalleryExState();
}

class _ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  final imagePicker = ImagePicker();
  File? _image;
  bool isPreloading = false;

  double _bottomRowOpacity = 1;

  Future<void> _addImage() async {
    setState(() {
      isPreloading = true;
    });
    final source = widget.type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    final image = await imagePicker.pickImage(
      source: source,
      imageQuality: cameraPreferredImageQuality,
      maxHeight: 400,
      maxWidth: 400,
      preferredCameraDevice: CameraDevice.rear,
    );
    setState(() {
      isPreloading = false;
      _image = image != null
          ? File(image.path)
          : null; // used to populate image on screen
    });
  }

  void _submitImage(BuildContext context) {
    if (_image == null) {
      return;
    }
    // context.router.pop();
    widget.handleImagePicked(_image);
  }

  @override
  void initState() {
    super.initState();
    _addImage();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == ImageSourceType.camera
              ? imageFromCameraText
              : imageFromLibraryText,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // const SizedBox(
            //   height: 52,
            // ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: themeShade1200),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: _addImage,
                        child: _image != null
                            ? Image.file(
                                _image!,
                                fit: BoxFit.fill,
                              )
                            // ignore: use_decorated_box
                            : Container(
                                decoration:
                                    const BoxDecoration(color: themeShade1200),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      widget.type == ImageSourceType.camera
                                          ? Icons.camera_alt
                                          : Icons.photo_library,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      widget.type == ImageSourceType.camera
                                          ? 'Take photo'
                                          : 'Choose image',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        // fontFamily: 'Fat Cheeks',
                                        fontSize: 22,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      child: AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: _bottomRowOpacity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_image != null)
                              GestureDetector(
                                onTap: _addImage,
                                child: CustomPaint(
                                  painter: CustomButton1(),
                                  child: const SizedBox(
                                    width: 70,
                                    height: 70 * 0.7746031746031746,
                                    child: Center(
                                      child: Text(
                                        're-do',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Fat Cheeks',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox(
                                width: 70,
                                height: 70 * 0.7746031746031746,
                              ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.075,
                            // ),
                            if (_image != null)
                              GestureDetector(
                                onTap: () => _submitImage(context),
                                child: CustomPaint(
                                  painter: CustomButton2(),
                                  child: const SizedBox(
                                    width: 75,
                                    height: 75 * 0.6551102204408818,
                                    child: Center(
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Fat Cheeks',
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox(
                                width: 70,
                                height: 70 * 0.7746031746031746,
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (isPreloading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
