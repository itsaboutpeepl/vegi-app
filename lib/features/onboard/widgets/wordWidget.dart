import 'package:flutter/material.dart';

class Word extends StatelessWidget {
  Word({
    Key? key,
    required this.mnemonic,
    required this.wordIndex,
  }) : super(key: key);
  final List<String> mnemonic;
  final int wordIndex;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        labelText: "Word" + wordIndex.toString(),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        fillColor: Theme.of(context).canvasColor,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      cursorColor: Theme.of(context).colorScheme.onSurface,
      validator: (String? value) {
        if (mnemonic[wordIndex - 1] != value?.trim()) {
          return "Does not match";
        }
        return null;
      },
    );
  }
}
