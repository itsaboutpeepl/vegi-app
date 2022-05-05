import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/cart/tipCard.dart';

class TipCardView extends StatefulWidget {
  const TipCardView({Key? key}) : super(key: key);

  @override
  State<TipCardView> createState() => _TipCardViewState();
}

class _TipCardViewState extends State<TipCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFAFAFA),
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add a Tip?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Support your delivery partner and make their day! 100% of your tip will be transferred to them!",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TipCard(
                  emoji: "assets/images/leaf-1.png",
                  tipAmount: 1,
                ),
                TipCard(
                  emoji: "assets/images/leaf-2.png",
                  tipAmount: 2,
                ),
                TipCard(
                  emoji: "assets/images/leaf-3.png",
                  tipAmount: 3,
                ),
                TipCard(
                  emoji: "assets/images/leaf-4.png",
                  tipAmount: 4,
                ),
                TipCard(
                  emoji: "assets/images/leaf-5.png",
                  tipAmount: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
