import 'package:flutter/material.dart';
import 'package:duordle/widgets/gridBox.dart';

class GridRow extends StatelessWidget {
  final int totCols;
  final String rowContent;
  final bool attempted;
  final String correctWord;

  const GridRow(
      {Key? key,
      required this.totCols,
      required this.rowContent,
      required this.attempted,
      required this.correctWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridBox> boxes = List.empty(growable: true);
    for (int j = 0; j < totCols; j++) {
      var letter = "";
      if (rowContent.length > j) {
        letter = rowContent[j];
      }
      boxes.add(GridBox(
          index: j,
          letter: letter,
          attempted: attempted,
          correctWord: correctWord));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
