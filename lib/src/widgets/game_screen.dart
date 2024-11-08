import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:match_the_cards/src/controllers/high_scores_controller.dart';
import 'package:match_the_cards/src/match_the_cards_game.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';

class GameScreen extends StatelessWidget {
  final highScoresController = Get.find<HighScoresController>();

  final DifficultyLevel difficultyLevel;

  GameScreen(this.difficultyLevel, {super.key});

  @override
  Widget build(BuildContext context) {
    final highScore = highScoresController.getHighScore(difficultyLevel);

    return GameWidget(
      game: MatchTheCardsGame(difficultyLevel, highScore),
      overlayBuilderMap: {
        'Test': (BuildContext context, MatchTheCardsGame game) {
          return Obx(
            () {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Attempts: ${game.attempts}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    if (highScore != null)
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Record: ${highScore.value}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
