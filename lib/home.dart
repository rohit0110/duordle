import 'package:duordle/widgets/grid.dart';
import 'package:duordle/widgets/keyboard.dart';
import 'package:duordle/widgets/titlebar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [TitleBar(), Grid(), Keyboard()],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
