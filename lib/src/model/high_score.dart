import 'package:match_the_cards/src/model/difficulty_level.dart';

class HighScore {
  int value;
  DifficultyLevel difficultyLevel;

  HighScore(this.value, this.difficultyLevel);

  HighScore.fromJson(Map jsonObject)
      : value = -1,
        difficultyLevel = DifficultyLevel.easy {
    value = jsonObject["value"];
    difficultyLevel =
        DifficultyLevel.fromString(jsonObject["difficulty_level"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "value": value,
      "difficulty_level": difficultyLevel.toString(),
    };
  }
}
