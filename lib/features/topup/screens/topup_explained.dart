import 'dart:core';
import 'package:flutter/material.dart';
import 'package:vegan_liverpool/features/shared/widgets/primary_button.dart';

class TopupExplained extends StatefulWidget {
  const TopupExplained({
    Key? key,
  }) : super(key: key);

  @override
  State<TopupExplained> createState() => _TopupExplainedState();
}

class _TopupExplainedState extends State<TopupExplained> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> texts = [
    'Top up using Stripe, one of the worlds most trusted payment processors.',
    'Just use your credit or debit card. It takes less than a minute. 😉',
    'Stripe is fully regulated by the FCA and used by millions of businesses worldwide.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Flexible(
              child: Text(
                'Top up your Peepl wallet using Stripe',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Center(
                child: PrimaryButton(
                  label: "Let's do it",
                  fontSize: 35,
                  width: MediaQuery.of(context).size.width * .7,
                  // radius: 20,
                  height: 80,
                  // labelFontWeight: FontWeight.bold,
                  onPressed: () {
                    // ExtendedNavigator.named('topupRouter').pushTopupScreen(
                    //   topupType: TopupType.STRIPE,
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
