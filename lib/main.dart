import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:match_the_cards/src/controllers/high_scores_controller.dart';
import 'package:match_the_cards/src/services/high_scores_service.dart';
import 'package:match_the_cards/src/widgets/start_screen.dart';

main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<HighScoresService>(() => HighScoresService(), fenix: true);
  Get.lazyPut<HighScoresController>(() => HighScoresController(), fenix: true);

  runApp(
    const GetMaterialApp(
      home: StartScreen(),
    ),
  );
}
