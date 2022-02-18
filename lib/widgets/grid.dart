import 'package:duordle/providers/game_state_provider.dart';
import 'package:duordle/widgets/gridRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:duordle/providers/game_settings_provider.dart';

class Grid extends ConsumerWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameState = ref.watch(gameStateProvider);

    final wordsize = gameSettings.wordsize;
    final List<GridRow> rows = List.empty(growable: true);
    final correctWord = gameState.correctWord;

    for (int i = 0; i < gameSettings.attempts; i++) {
      var word = "";
      if (gameState.attempts.length > i) {
        word = gameState.attempts[i];
      }
      var attempted = false;
      if (gameState.attempted > i) attempted = true;
      rows.add(GridRow(
        totCols: wordsize,
        rowContent: word,
        attempted: attempted,
        correctWord: correctWord,
      ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
