import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
// import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton1.dart';
import 'package:vegan_liverpool/constants/CustomPainterWidgets/customButton2.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/snackbars.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

import '../Helpers/helpers.dart';

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
  // final s3Uploader = UploadAWS();
  int _sliderValue = 100;
  File? _image;
  bool isPreloading = false;

  double _bottomRowOpacity = 1;

  Future<void> _addImage(BuildContext? context) async {
    setState(() {
      isPreloading = true;
    });
    final source = widget.type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    final image = await imagePicker.pickImage(
      source: source,
      imageQuality: cameraPreferredImageQuality,
      maxHeight:
          context != null ? MediaQuery.of(context).size.height * 0.5 : null,
      maxWidth:
          context != null ? MediaQuery.of(context).size.width * 0.5 : null,
      preferredCameraDevice: CameraDevice.rear,
    );
    File? imageFile;
    if (image != null) {
      imageFile = await compressFileToMaxSize(
        File(image.path),
        maxSizeMB: fileUploadVegiMaxSizeMB,
      );
    }

    setState(() {
      isPreloading = false;
      _image = imageFile != null
          ? imageFile
          : null; // used to populate image on screen
    });
  }

  Future<File?> compressFile(File file, {int imageQuality = 5}) async {
    final filePath = file.absolute.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: imageQuality,
    );

    print(file.lengthSync());
    print(result?.lengthSync());

    return result;
  }

  Future<File?> compressFileToMaxSize(File file,
      {int maxSizeMB = fileUploadVegiMaxSizeMB}) async {
    var currentSize = getFileSizeMB(_image);
    File? outFile = file;

    final deciles = List<double>.generate(10, (i) => (i + 1) / 10).reversed;

    for (final decile in deciles) {
      outFile = await compressFile(file, imageQuality: (decile * 100).round());
      currentSize = getFileSizeMB(outFile);
      if (currentSize <= maxSizeMB) {
        return outFile;
      }
    }
    log.error(
        'Unable to compress ${getFileSizeMB(file)} MB file to below $maxSizeMB MB');
    return null;

    // while (currentSize > maxSizeMB && outFile != null) {
    //   final outFileBetter = await compressFile(outFile, imageQuality: 75);
    //   final currentSizeBetter = getFileSizeMB(outFileBetter);
    //   if (currentSizeBetter <= maxSizeMB) {
    //     return outFileBetter;
    //   }
    //   outFile = await compressFile(file, imageQuality: 50);
    //   currentSize = getFileSizeMB(outFile);
    //   if (currentSize != null && currentSize <= maxSizeMB) {
    //     return outFile;
    //   }
    // }
  }

  // Future<Uint8List> compressAndTryCatch(String path) async {
  //   Uint8List result;
  //   try {
  //     result = await FlutterImageCompress.compressWithFile(
  //       path,
  //       format: CompressFormat.heic,
  //     );
  //   } on UnsupportedError catch (e) {
  //     print(e);
  //     result = await FlutterImageCompress.compressWithFile(
  //       path,
  //       format: CompressFormat.jpeg,
  //     );
  //   }
  //   return result;
  // }

  void _submitImage(BuildContext context) {
    if (_image == null) {
      return;
    }
    log.warn('Uploading image with size: ${getFileSizeMB(_image)} MB');
    // context.router.pop();
    if (getFileSizeMB(_image) < fileUploadVegiMaxSizeMB) {
      widget.handleImagePicked(_image);
    } else {
      showInfoSnack(context, title: 'Image not uploaded as too large!');
    }
  }

  @override
  void initState() {
    super.initState();
    _addImage(null);
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
                        onTap: () => _addImage(context),
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
                                onTap: () => _addImage(context),
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
                    Positioned(
                      bottom: 100,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      child: AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: _bottomRowOpacity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_image != null)
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ElevatedButton(
                                        child: Text(
                                          'Upload AWS (${getFileSizeMB(_image!).toStringAsFixed(3)}MB)',
                                          style: TextStyle(
                                            color: Colors.indigo[900],
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .white, // ~ The backgroundColor and foregroundColor properties were introduced in Flutter 3.3. Prior to that, they were called primary and onPrimary.
                                          foregroundColor: Colors.black,
                                          fixedSize: const Size(120, 50),
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            isPreloading = true;
                                          });
                                          // try {
                                          //   await s3Uploader.uploadImage(
                                          //     _image!,
                                          //     'suggestions/',
                                          //   );
                                          // } catch (err) {
                                          //   log.error(
                                          //       'ERROR: s3Uploader: $err');
                                          // }
                                          // try {
                                          //   await _onAddPhotoClicked();
                                          // } catch (err) {
                                          //   log.error(
                                          //       'ERROR: express presigned uploader -> $err');
                                          // }
                                          try {
                                            await peeplEatsService
                                                .tryUploadImage(
                                                    image: _image!,
                                                    onError: (error, errCode) {
                                                      showErrorSnack(
                                                          context: context,
                                                          title:
                                                              'Upload Failed',
                                                          message: error,);
                                                    },
                                                    onSuccess: ((p0) {
                                                      showInfoSnack(context,
                                                          title:
                                                              'Upload Succeeded');
                                                    }));
                                          } catch (err) {
                                            print('Error: $err');
                                          }

                                          // try {
                                          //   String extension = path
                                          //       .extension(_image!.path)
                                          //       .substring(1);
                                          //   if (extension == 'jpg') {
                                          //     extension = 'jpeg';
                                          //   }
                                          //   final response =
                                          //       await AwsS3.uploadFile(
                                          //     accessKey:
                                          //         Secrets.amazonS3AccessKey,
                                          //     secretKey: Secrets.amazonS3Secret,
                                          //     file: _image!,
                                          //     destDir: '.tmp/uploads',
                                          //     contentType: "image/$extension",
                                          //     bucket: Secrets.amazonS3Bucket,
                                          //     region: Secrets.amazonS3Region,
                                          //     metadata: {
                                          //       /*"test": "test"*/
                                          //     }, // optional
                                          //   );
                                          //   debugPrint(response ??
                                          //       'AWS S3 Upload failed...');
                                          // } catch (err) {
                                          //   log.error(
                                          //       'ERROR: aws_s3_upload -> $err');
                                          // }

                                          setState(() {
                                            isPreloading = false;
                                          });
                                        },
                                      ),
                                      Slider(
                                        value: _sliderValue.toDouble(),
                                        min: 0,
                                        max: 100,
                                        divisions: 101,
                                        label:
                                            '${_sliderValue}% ==> File Size (${getFileSizeMB(_image!).toStringAsFixed(3)})MB',
                                        onChanged: (value) {},
                                        onChangeEnd: (value) async {
                                          final valueInt = value.round();
                                          setState(() {
                                            _sliderValue = valueInt;
                                          });
                                          final compressedImage =
                                              await compressFile(
                                            _image!,
                                            imageQuality: valueInt,
                                          );
                                          if (compressedImage != null) {
                                            setState(() {
                                              _image = compressedImage;
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
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
