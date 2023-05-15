import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vegan_liverpool/features/onboard/widgets/createWalletButtons.dart';
import 'package:vegan_liverpool/features/shared/widgets/my_scaffold.dart';

class CreateWalletFirstOnboardingScreen extends StatelessWidget {
  const CreateWalletFirstOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Create wallet',
      body: ColoredBox(
        color: Colors.grey[350]!,
        child: const CreateWalletButtons(),
      ),
    );
  }
}
