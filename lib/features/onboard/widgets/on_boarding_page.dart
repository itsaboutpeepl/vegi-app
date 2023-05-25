import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class OnBoardingScreenGeneric extends StatelessWidget {
  const OnBoardingScreenGeneric({
    required this.title,
    required this.subTitle,
    required this.iconName,
    required this.backgroundImageOverlayPath,
    required this.headingColour,
    required this.subHeadingColour,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String iconName;
  final String backgroundImageOverlayPath;
  final Color headingColour;
  final Color subHeadingColour;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                backgroundImageOverlayPath,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.275,
            ),
            Image.asset(
              // ImagePaths.vegiHorizontalLogo,
              ImagePaths.onboardingPage1VegiText,
              width: MediaQuery.of(context).size.width * .4,
            ),
            const SizedBox(
              height: 180,
            ),
            // SvgPicture.asset(
            //   'assets/images/$iconName',
            //   height: 75,
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 45,
                  color: headingColour,
                  fontFamily: Fonts.gelica,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: subTitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: subHeadingColour,
                        fontFamily: Fonts.gelica,
                      ),
                    ),
                  ],
                ),
                minFontSize: 16,
                maxFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
