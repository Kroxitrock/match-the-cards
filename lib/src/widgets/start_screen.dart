import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_the_cards/src/widgets/level_select_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Get.to(() => const LevelSelectScreen()),
            child: const Text("Start Game")),
      ),
    );
  }
}
