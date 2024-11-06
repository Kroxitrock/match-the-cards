import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:match_the_cards/src/match_the_cards_game.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';

class GameScreen extends StatelessWidget {
  final DifficultyLevel difficultyLevel;

  const GameScreen(this.difficultyLevel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: MatchTheCardsGame(difficultyLevel),
    );
  }
}
