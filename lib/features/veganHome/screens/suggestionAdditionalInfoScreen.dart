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
  SuggestionAdditionalInfoScreen({
    Key? key,
    required this.title,
    required this.nextPage,
    required this.previousPage,
  }) : super(key: key);

  final String title;
  final void Function() nextPage;
  final void Function() previousPage;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeShade1100,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 30,
            // top: MediaQuery.of(context).size.height * 0.02,
            top: 30,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SuggestionAdditionalInfoCard(
                    // scrollController: scrollController,
                    ),
                Container(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
