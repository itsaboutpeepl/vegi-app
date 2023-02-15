import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';
import 'package:vegan_liverpool/features/veganHome/widgets/menu/suggestionAdditionalInfoCard.dart';

// abstract class SuggestionScreen {
//   const SuggestionScreen({
//     required this.title,
//   });

//   final String title;
// }

class SuggestionAdditionalInfoScreen extends StatelessWidget {
  const SuggestionAdditionalInfoScreen({
    Key? key,
    required this.title,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final String title;
  final void Function() nextPage;
  final void Function() previousPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeShade1100,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 30,
          top: MediaQuery.of(context).size.height * 0.08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SuggestionAdditionalInfoCard(),
          ],
        ),
      ),
    );
  }
}
