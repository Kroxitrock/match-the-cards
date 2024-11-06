import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';
import 'package:match_the_cards/src/widgets/game_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final levelButtons = [
      ElevatedButton(
        onPressed: () => Get.to(
          () => const GameScreen(DifficultyLevel.easy),
        ),
        child: const Text("Easy"),
      ),
      ElevatedButton(
        onPressed: () => Get.to(
          () => const GameScreen(DifficultyLevel.medium),
        ),
        child: const Text("Medium"),
      ),
      ElevatedButton(
        onPressed: () => Get.to(
          () => const GameScreen(DifficultyLevel.hard),
        ),
        child: const Text("Hard"),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text("Choose difficulty level:"),
          ),
          if (screenWidth > 600)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: levelButtons,
              ),
            ),
          if (screenWidth < 601)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: levelButtons,
              ),
            ),
        ],
      ),
    );
  }
}
