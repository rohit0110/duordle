import 'package:duordle/widgets/gridBox.dart';
import 'package:duordle/widgets/gridRow.dart';
import 'package:flutter/material.dart';

const totRows = 6;

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridRow(),
          GridRow(),
          GridRow(),
          GridRow(),
          GridRow(),
          GridRow(),
        ],
      ),
    );
  }
}
