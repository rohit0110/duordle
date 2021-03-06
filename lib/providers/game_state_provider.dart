import 'dart:math';

import 'package:duordle/data/word_data.dart';
import 'package:duordle/main.dart';
import 'package:duordle/providers/game_settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameState {
  final List<String> validWords;
  final String correctWord;
  final GameSettings settings;
  final List<String> attempts;
  final int attempted;

  GameState(
      {required this.validWords,
      required this.correctWord,
      required this.settings,
      required this.attempts,
      required this.attempted});

  GameState clone(
      {List<String>? validWords,
      String? correctWord,
      int? attempted,
      List<String>? attempts}) {
    return GameState(
        validWords: validWords ?? this.validWords,
        correctWord: correctWord ?? this.correctWord,
        settings: this.settings,
        attempts: attempts ?? this.attempts,
        attempted: attempted ?? this.attempted);
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  final Random rng = Random();
  GameStateNotifier(GameSettings settings)
      : super(GameState(
            validWords: [],
            correctWord: "lover",
            settings: settings,
            attempts: [],
            attempted: 0));

  Future<void> updateWords() async {
    final words = await loadWords(state.settings.wordsize);
    state = state.clone(
        validWords: words, correctWord: words[rng.nextInt(words.length - 1)]);
  }

  void resetCorrectWord() {
    state = state.clone(
        correctWord:
            state.validWords[rng.nextInt(state.validWords.length - 1)]);
  }

  void updateCurrentAttempt(String key) {
    final attempts = state.attempts;
    if (attempts.length <= state.attempted) {
      attempts.add("");
    }
    var curAttempt = attempts[state.attempted];

    if (key == '_') {
      if (curAttempt.length < state.settings.wordsize) {
        print("Insufficient Characters");
        return;
      } else if (!state.validWords.contains(curAttempt)) {
        print("Word isnt in database WHOOPS");
      } else if (curAttempt == state.correctWord) {
        print("You win i guess");
        resetCorrectWord();
      } else {
        state = state.clone(attempted: state.attempted + 1);
      }
    } else if (key == '<') {
      if (curAttempt.length > 0) {
        curAttempt = curAttempt.substring(0, curAttempt.length - 1);
      }
      attempts[state.attempted] = curAttempt;
      state = state.clone(attempts: attempts);
    } else {
      if (curAttempt.length >= state.settings.wordsize) {
        print("Longer than allowed word");
        return;
      }
      curAttempt += key;
      attempts[state.attempted] = curAttempt;
      state = state.clone(attempts: attempts);
    }
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  final setting = ref.watch(gameSettingsProvider);
  final gameStateNotifier = GameStateNotifier(setting);

  gameStateNotifier.updateWords();
  return gameStateNotifier;
});
