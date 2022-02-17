import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameSettings {
  int attempts;
  int wordsize;
  GameSettings({this.wordsize = 5, this.attempts = 6});

  GameSettings clone({int? wordsize, int? attempts}) {
    return GameSettings(
        wordsize: wordsize ?? this.wordsize,
        attempts: attempts ?? this.attempts);
  }
}

class GameSettingsNotifier extends StateNotifier<GameSettings> {
  GameSettingsNotifier() : super(GameSettings());

  void updateAttempts(int attempts) {
    state = state.clone(attempts: attempts);
  }

  void updateWordsize(int wordsize) {
    state = state.clone(wordsize: wordsize);
  }
}

final gameSettingsProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSettings>((ref) {
  return GameSettingsNotifier();
});
