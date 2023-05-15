import 'package:flutter/material.dart';
import 'package:vegan_liverpool/utils/constants.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({
    Key? key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.refreshable,
  }) : super(key: key);
  final String emoji;
  final String title;
  final String subtitle;
  final bool refreshable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 100,
          ),
          Text(
            emoji,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 75,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (refreshable)
            const Text(
              Messages.pullDownToRefresh,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            )
        ],
      ),
    );
  }
}
