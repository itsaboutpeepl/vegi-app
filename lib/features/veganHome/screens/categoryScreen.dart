import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(
                  'Liverpool, ,UK',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              //  TODO: Use MediaQuery
              padding: const EdgeInsets.only(left: 120),
              child: Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
