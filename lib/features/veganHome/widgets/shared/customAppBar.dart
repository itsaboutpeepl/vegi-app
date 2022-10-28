import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.pageTitle, this.otherAction})
      : preferredSize = const Size.fromHeight(115),
        super(key: key);

  @override
  final Size preferredSize;

  final String pageTitle;
  final Widget? otherAction;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorToWhiteGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Spacer(
                  flex: 3,
                ),
                if (widget.otherAction != null)
                  Padding(
                    padding: EdgeInsets.zero,
                    child: SizedBox(height: 40, child: widget.otherAction),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.pageTitle,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
