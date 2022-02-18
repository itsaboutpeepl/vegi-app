import 'package:flutter/material.dart';

class RestaurantMenuAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  RestaurantMenuAppBar(
      {Key? key,
      required this.centerText,
      required this.pageTitle,
      this.otherAction})
      : preferredSize = Size.fromHeight(80),
        super(key: key);

  @override
  final Size preferredSize;

  final String centerText;
  final String pageTitle;
  final Widget? otherAction;

  @override
  State<RestaurantMenuAppBar> createState() => _RestaurantMenuAppBarState();
}

class _RestaurantMenuAppBarState extends State<RestaurantMenuAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.yellow[300]!,
              Colors.yellow[200]!,
              Colors.yellow[200]!,
              Colors.yellow[100]!,
              Colors.white
            ],
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
                Text(
                  widget.centerText,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 8,
              ),
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
