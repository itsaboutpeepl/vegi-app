import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreenGeneric extends StatelessWidget {
  const OnBoardingScreenGeneric(
    this.title,
    this.subTitle,
    this.iconName, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/Vegi-Logo-horizontal.png',
          width: MediaQuery.of(context).size.width * .4,
        ),
        const SizedBox(
          height: 80,
        ),
        SvgPicture.asset(
          'assets/images/$iconName',
          height: 75,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontFamily: 'Fat Cheeks',
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
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
    );
  }
}
