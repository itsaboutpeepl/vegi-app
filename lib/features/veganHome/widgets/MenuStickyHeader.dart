import 'package:flutter/material.dart';

class MenuStickyHeader extends StatelessWidget {
  const MenuStickyHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.yellow[100],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: Offset(4, 4),
              spreadRadius: 1.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        height: 40.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.grey[850],
              fontSize: 20,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
