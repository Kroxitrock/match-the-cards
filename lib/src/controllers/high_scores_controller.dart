import 'package:get/get.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';
import 'package:match_the_cards/src/model/high_score.dart';
import 'package:match_the_cards/src/services/high_scores_service.dart';

class HighScoresController {
  final highScoresService = Get.find<HighScoresService>();

  RxList<HighScore> highScores = <HighScore>[].obs;

  HighScoresController() {
    highScores.value = highScoresService.highScores;
  }

  HighScore? getHighScore(DifficultyLevel difficultyLevel) =>
      highScores.firstWhereOrNull(
          (highScore) => highScore.difficultyLevel == difficultyLevel);

  bool addHighScore(DifficultyLevel difficultyLevel, int value) {
    bool added = highScoresService.addHighScore(value, difficultyLevel);

    if (added) {
      var highScore = highScores.firstWhereOrNull(
          (element) => element.difficultyLevel == difficultyLevel);

      if (highScore == null) {
        highScores.add(HighScore(value, difficultyLevel));
      } else {
        highScore.value = value;
      }

      highScores.refresh();
    }

    return added;
  }
}
