import 'package:flutter/material.dart';
import 'package:duordle/widgets/gridBox.dart';

class GridRow extends StatelessWidget {
  final int totCols;
  final String rowContent;
  const GridRow({Key? key, required this.totCols, required this.rowContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridBox> boxes = List.empty(growable: true);
    for (int j = 0; j < totCols; j++) {
      if (rowContent.length > j) {
        boxes.add(GridBox(letter: rowContent[j]));
      } else {
        boxes.add(GridBox());
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
