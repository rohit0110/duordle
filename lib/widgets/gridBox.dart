import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final String? letter;
  const GridBox({Key? key, this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(3),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Text(letter ?? ""),
    );
  }
}
