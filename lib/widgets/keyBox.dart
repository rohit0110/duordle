import 'package:flutter/material.dart';

class KeyBox extends StatelessWidget {
  final String letter;
  const KeyBox(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(3),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Text(letter),
    );
  }
}
