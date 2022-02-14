import 'package:flutter/material.dart';
import 'package:duordle/widgets/gridBox.dart';

const totCols = 5;

class GridRow extends StatelessWidget {
  const GridRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridBox> boxes = List.empty(growable: true);
    for (int j = 0; j < totCols; j++) {
      boxes.add(GridBox());
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
