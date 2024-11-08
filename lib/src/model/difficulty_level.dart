enum DifficultyLevel {
  easy,
  medium,
  hard;

  static DifficultyLevel fromString(String difficultyLevel) {
    return DifficultyLevel.values
        .firstWhere((level) => level.toString() == difficultyLevel);
  }
}
