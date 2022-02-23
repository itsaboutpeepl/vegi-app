import 'package:flutter/material.dart';

class TipCard extends StatefulWidget {
  const TipCard({Key? key, required this.emoji, required this.tipAmount})
      : super(key: key);

  final String emoji;
  final String tipAmount;

  @override
  _TipCardState createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _isSelected ? Colors.yellow[200] : Colors.white,
      margin: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  text: widget.emoji,
                  style: TextStyle(fontSize: 20),
                  children: [
                    TextSpan(
                      text: " ${widget.tipAmount}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
