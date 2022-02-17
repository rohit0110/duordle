import 'package:duordle/widgets/gridRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:duordle/providers/game_settings_provider.dart';

class Grid extends ConsumerWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final wordsize = gameSettings.wordsize;
    final rows = gameSettings.attempts;
    return Container(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < rows; i++) GridRow(totCols: wordsize)
          //   GridRow(
          //     totCols: wordsize,
          //   ),
          // GridRow(
          //   totCols: wordsize,
          // ),
          // GridRow(
          //   totCols: wordsize,
          // ),
          // GridRow(
          //   totCols: wordsize,
          // ),
          // GridRow(
          //   totCols: wordsize,
          // ),
          // GridRow(
          //   totCols: wordsize,
          // ),
        ],
      ),
    );
  }
}
