import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final int index;
  final String letter;
  final bool attempted;
  final String correctWord;

  const GridBox(
      {Key? key,
      required this.index,
      required this.letter,
      required this.attempted,
      required this.correctWord})
      : super(key: key);

  Color? isColor() {
    // print(correctWord);
    // print(correctWord[index] == letter);
    if (!attempted) return null;
    if (correctWord.indexOf(letter) == index) {
      return Colors.green;
    } else if (correctWord.contains(letter)) {
      return Colors.yellow;
    } else {
      return Colors.grey;
    }
  }

  Color whichColor() {
    if (!attempted)
      return Colors.black;
    else
      return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2), color: isColor()),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(
            color: whichColor(), fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
