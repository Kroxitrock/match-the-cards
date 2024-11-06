import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';
import 'package:match_the_cards/src/widgets/level_select_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int attempts;
  final DifficultyLevel difficultyLevel;

  const ResultsScreen({
    required this.attempts,
    required this.difficultyLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
                "Good job! You managed to beat the game on $difficultyLevel difficulty with $attempts attempts!"),
            ElevatedButton(
                onPressed: () => Get.to(const LevelSelectScreen()),
                child: const Text("Start over")),
          ],
        ),
      ),
    );
  }
}
