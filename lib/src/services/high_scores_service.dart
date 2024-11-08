import 'dart:convert';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';
import 'package:match_the_cards/src/model/high_score.dart';

class HighScoresService {
  final storage = Hive.box("storage");

  List<HighScore> get highScores {
    final highScores = List<HighScore>.empty(growable: true);

    final highScoresJSON = storage.get("high_scores");
    if (highScoresJSON == null) {
      return highScores;
    }

    final Iterable decodedHighScores = jsonDecode(highScoresJSON);

    highScores.addAll(
      List<HighScore>.from(
        decodedHighScores.map(
          (highScore) => HighScore.fromJson(highScore),
        ),
      ),
    );

    return highScores;
  }

  bool addHighScore(int value, DifficultyLevel difficultyLevel) {
    final List<HighScore> list = highScores;
    bool exists = false;

    for (var i = 0; i < list.length; i++) {
      if (list[i].difficultyLevel == difficultyLevel) {
        exists = true;
        if (list[i].value > value) {
          list[i].value = value;
          storage.put("high_scores", jsonEncode(list));

          return true;
        }
      }
    }

    if (!exists) {
      storage.put("high_scores",
          jsonEncode(list..add(HighScore(value, difficultyLevel))));
      return true;
    }

    return false;
  }
}
