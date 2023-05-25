import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/helpers.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class WaitingListBetaEligibilityButton extends StatelessWidget {
  const WaitingListBetaEligibilityButton({
    required this.title,
    required this.textLines,
    required this.onPressed,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<String> textLines;
  final void Function()? onPressed;
  final String imagePath;

  Future<Size> getImageSize({
    required AssetImage image,
  }) async {
    final snailImage = Image(
      image: image,
    );
    final snailImageSize = calculateImageDimension(image: snailImage);
    return snailImageSize;
  }

  @override
  Widget build(BuildContext context) {
    final assetImage = AssetImage(
      // ImagePaths.vegiHorizontalLogo,
      imagePath,
    );
    return FutureBuilder<Size>(
      future: getImageSize(image: assetImage),
      builder: (context, snapshot) {
        final containerHeight = snapshot.hasData
            ? MediaQuery.of(context).size.width / snapshot.data!.aspectRatio
            : 0.0;
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: assetImage,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: containerHeight * 0.1,
                    bottom: containerHeight * 0.2,
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        title,
                        style: const TextStyle(
                          color: themeShade1100,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          fontFamily: Fonts.gelica,
                        ),
                        maxLines: 1,
                      ),
                      ...textLines.map(
                        (text) => AutoSizeText(
                          text,
                          style: const TextStyle(
                            color: themeShade1100,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.gelica,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: Colors.black,
    //     // fixedSize: const Size(200, 50),
    //     // textStyle: const TextStyle(fontWeight: FontWeight.w900),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     padding: const EdgeInsets.all(15),
    //   ),
    //   onPressed: onPressed,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Column(
    //         children: [
    //           AutoSizeText(
    //             title,
    //             style: const TextStyle(
    //               color: Colors.black,
    //               fontSize: 40,
    //               fontWeight: FontWeight.w500,
    //             ),
    //             maxLines: 1,
    //           ),
    //           ...textLines.map(
    //             (text) => AutoSizeText(
    //               text,
    //               style: const TextStyle(
    //                 color: Colors.black,
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.w500,
    //               ),
    //               maxLines: 1,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
