import 'package:duordle/providers/game_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyBox extends ConsumerWidget {
  final String letter;
  const KeyBox(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double height;
    double width;
    if (letter == '<') {
      width = 60;
      height = 50;
      keyCap = Icon(Icons.backspace_outlined);
    } else if (letter == '_') {
      width = 70;
      height = 50;
      keyCap = Text("Enter");
    } else {
      width = 40;
      height = 50;
      keyCap = Text(letter);
    }
    return InkWell(
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromARGB(50, 50, 50, 50),
        ),
        child: keyCap,
      ),
    );
  }
}
