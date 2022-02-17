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
              children: [for (var i in "QWERTYUIOP".split("")) KeyBox(i)],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [for (var i in "ASDFGHJKL".split("")) KeyBox(i)],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [for (var i in "_ZXCVBNM<".split("")) KeyBox(i)],
            )
          ],
        ));
  }
}
