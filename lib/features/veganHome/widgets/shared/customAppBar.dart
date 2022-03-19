import 'package:flutter/material.dart';
import 'package:vegan_liverpool/constants/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.pageTitle, this.otherAction})
      : preferredSize = Size.fromHeight(115),
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colorToWhiteGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.3, 0.5, 0.7, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
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
                  icon: Icon(Icons.arrow_back),
                ),
                Spacer(
                  flex: 2,
                ),
                Spacer(
                  flex: 3,
                ),
                widget.otherAction != null
                    ? Padding(
                        //  TODO: Use MediaQuery
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(height: 40, child: widget.otherAction),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.pageTitle,
                style: TextStyle(
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
