import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/utils/constants.dart';
import 'package:vegan_liverpool/utils/url.dart';

class SurveyCompletedCard extends StatefulWidget {
  const SurveyCompletedCard({
    Key? key,
  }) : super(key: key);

  @override
  State<SurveyCompletedCard> createState() => _SurveyCompletedCardState();
}

class _SurveyCompletedCardState extends State<SurveyCompletedCard> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));

    playConfetti();

    super.initState();
  }

  void playConfetti() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeShade100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/order-pending.gif',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    colors: const [themeAccent600, themeShade600],
                    createParticlePath: drawStar,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Messages.thanksForRegisteringEmailWaitList,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            // GestureDetector(
            //   onTap: () => launchUrl(getGuideLiverpoolLink(),
            //       mode: LaunchMode.externalApplication),
            //   child: Text(
            //     Messages.signUpForTheGuideToAccessTheBeta,
            //     style: TextStyle(
            //       color: Colors.grey[500],
            //       fontSize: 16,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
