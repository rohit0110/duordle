import 'package:duordle/widgets/gridRow.dart';
import 'package:duordle/widgets/keyBox.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                KeyBox("Q"),
                KeyBox("W"),
                KeyBox("E"),
                KeyBox("R"),
                KeyBox("T"),
                KeyBox("Y"),
                KeyBox("U"),
                KeyBox("I"),
                KeyBox("O"),
                KeyBox("P"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                KeyBox("A"),
                KeyBox("S"),
                KeyBox("D"),
                KeyBox("F"),
                KeyBox("G"),
                KeyBox("H"),
                KeyBox("J"),
                KeyBox("K"),
                KeyBox("L"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                KeyBox("Z"),
                KeyBox("X"),
                KeyBox("C"),
                KeyBox("V"),
                KeyBox("B"),
                KeyBox("N"),
                KeyBox("M"),
              ],
            )
          ],
        ));
  }
}
