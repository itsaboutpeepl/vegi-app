import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(150),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading: IconButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   icon: Icon(Icons.arrow_back),
      // ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      toolbarHeight: 300,
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
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Liverpool,L17 0AB,UK',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Padding(
                //  TODO: Use MediaQuery
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Da Cimino',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
