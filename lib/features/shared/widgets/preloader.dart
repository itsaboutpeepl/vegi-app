import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  const Preloader({
    Key? key,
    this.width = 60,
    this.height = 60,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(left: 28, right: 28),
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
