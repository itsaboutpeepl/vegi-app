import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vegan_liverpool/common/router/routes.gr.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/shared/widgets/arrowButton.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:vegan_liverpool/services.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class PreLaunchPerksDetailsPage extends StatelessWidget {
  const PreLaunchPerksDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: '',
      body: ColoredBox(
        color: themeLightShade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              ImagePaths.vegiHorizontalLogo,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: AutoSizeText(
                CopyWrite.preLaunchPerksHeadingPart1,
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.grey[700],
                  fontFamily: 'Fat Cheeks',
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: AutoSizeText(
                CopyWrite.preLaunchPerksHeadingPart2,
                style: TextStyle(
                  fontSize: 64,
                  color: Colors.grey[700],
                  fontFamily: 'Fat Cheeks',
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20, top: 20),
            //   child: AutoSizeText(
            //     TextSpan(
            //       children: [
            //         TextSpan(
            //           text: CopyWrite.preLaunchPerksHeadingPart1,
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //           ),
            //         ),
            //         TextSpan(
            //           text: CopyWrite.preLaunchPerksHeadingPart2,
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //           ),
            //         ),
            //       ],
            //     ),
            //     style: TextStyle(
            //       fontSize: 24,
            //       color: Colors.grey[700],
            //       fontFamily: 'Fat Cheeks',
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: CopyWrite.preLaunchPerksCreditsExplanation,
                      // children: [
                      //   TextSpan(
                      //     text: ,
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.grey[850],
                      //     ),
                      //   ),
                      // ],
                    ),
                    minFontSize: 16,
                    maxFontSize: 80,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: CopyWrite.startCollectingFreeCreditNow,
                    ),
                    minFontSize: 16,
                    maxFontSize: 80,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
                ArrowButton(
                  onTap: () {
                    rootRouter.push(
                      AddDiscountCodeScreen(
                        onVerifyDiscountCode: () {
                          rootRouter.push(const SurveyThanksScreen());
                        },
                      ),
                    );
                  },
                  iconSize: 80,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
