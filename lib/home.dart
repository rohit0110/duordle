import 'package:duordle/widgets/grid.dart';
import 'package:duordle/widgets/keyboard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DUORDLE",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Column(
          children: [Grid(), Keyboard()],
        ),
      ),
      backgroundColor: Colors.grey[700],
    );
  }
}
