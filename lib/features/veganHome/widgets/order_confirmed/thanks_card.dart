import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/enums.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/Helpers/drawStar.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class ThankYouCard extends StatefulWidget {
  const ThankYouCard({
    Key? key,
    required this.isDelivery,
    required this.orderId,
  }) : super(key: key);

  final bool isDelivery;
  final String orderId;

  @override
  State<ThankYouCard> createState() => _ThankYouCardState();
}

class _ThankYouCardState extends State<ThankYouCard> {
  // late ConfettiController _confettiController;

  @override
  void initState() {
    // _confettiController =
    //     ConfettiController(duration: const Duration(seconds: 10));

    // playConfetti();

    super.initState();
  }

  void playConfetti() {
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   _confettiController.play();
    // });
  }

  @override
  void dispose() {
    // _confettiController.dispose();
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
                    widget.isDelivery
                        ? 'assets/${DeliveryOrderCreationStatus.confirmed.imageTitle}'
                        : 'assets/${CollectionOrderCreationStatus.confirmed.imageTitle}',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  // ConfettiWidget(
                  //   confettiController: _confettiController,
                  //   blastDirectionality: BlastDirectionality.explosive,
                  //   colors: [
                  //     Colors.green.withOpacity(0.8),
                  //     Colors.blue.withOpacity(0.8),
                  //     Colors.pink.withOpacity(0.8),
                  //     Colors.orange.withOpacity(0.8),
                  //     Colors.purple.withOpacity(0.8)
                  //   ],
                  //   createParticlePath: drawStar,
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Messages.checkoutSuccessThankyouForOrdering,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
             Messages.checkoutSuccessOrderReceivedButNotConfirmed(widget.orderId),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
