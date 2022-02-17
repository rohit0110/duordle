import 'package:duordle/providers/game_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AttemptsToggle(),
          Text(
            "WORDLE",
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          WordSizeToggle(),
        ],
      ),
      padding: EdgeInsets.all(10),
    );
  }
}

class WordSizeToggle extends ConsumerWidget {
  const WordSizeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);

    void _updateWordSize() {
      var newWordSize = 3;
      if (gameSettings.wordsize == 4) newWordSize = 5;
      if (gameSettings.wordsize == 5) newWordSize = 6;
      if (gameSettings.wordsize == 6) newWordSize = 4;
      gameSettingsNotifier.updateWordsize(newWordSize);
    }

    return Container(
        child: OutlinedButton(
          child: Text(gameSettings.wordsize.toString()),
          onPressed: _updateWordSize,
        ),
        margin: EdgeInsets.fromLTRB(30, 0, 0, 0));
  }
}

class AttemptsToggle extends ConsumerWidget {
  const AttemptsToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);
    String attemptSize;

    void _updateAttemptSize() {
      var newattempts = 3;
      if (gameSettings.attempts == 4) {
        newattempts = 5;
      }
      if (gameSettings.attempts == 5) {
        newattempts = 6;
      }
      if (gameSettings.attempts == 6) {
        newattempts = 4;
      }
      gameSettingsNotifier.updateAttempts(newattempts);
    }

    switch (gameSettings.attempts) {
      case 4:
        attemptSize = "HIGH";
        break;
      case 5:
        attemptSize = "MED";
        break;
      case 6:
      default:
        attemptSize = "LOW";
        break;
    }

    return Container(
        child: OutlinedButton(
          child: Text(attemptSize),
          onPressed: _updateAttemptSize,
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 30, 0));
  }
}
