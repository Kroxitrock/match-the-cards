import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:match_the_cards/src/components/play_card.dart';
import 'package:match_the_cards/src/components/play_area.dart';
import 'package:match_the_cards/src/config.dart';
import 'package:match_the_cards/src/model/difficulty_level.dart';

class MatchTheCardsGame extends FlameGame {
  final cardColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ]..shuffle();
  final selectedCards = [];
  var attempts = 0;

  final DifficultyLevel difficultyLevel;

  MatchTheCardsGame(this.difficultyLevel)
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());

    initCards();
  }

  void initCards() {
    int columns;
    int rows;

    switch (difficultyLevel) {
      case DifficultyLevel.easy:
        columns = 2;
        rows = 2;
        break;
      case DifficultyLevel.medium:
        columns = 2;
        rows = 4;
        break;
      case DifficultyLevel.hard:
        columns = 3;
        rows = 4;
        break;
    }

    final usedColors = [];
    for (var i = 0; i < (columns * rows) / 2; i++) {
      usedColors.add(cardColors[i]);
      usedColors.add(cardColors[i]);
    }
    usedColors.shuffle();

    final horizontalSpacing = buffer * width;
    final verticalSpacing = buffer * height;

    final playfieldWidth =
        columns * cardWidth + (columns - 1) * horizontalSpacing;
    final playfieldHeight = rows * cardHeight + (rows - 1) * verticalSpacing;

    final initialX = (gameWidth - playfieldWidth) * 0.5;
    final initialY = (gameHeight - playfieldHeight) * 0.7;

    world.addAll([
      for (var row = 0; row < rows; row++)
        for (var column = 0; column < columns; column++)
          PlayCard(
            usedColors[row * columns + column],
            position: Vector2(
              initialX + (column * (cardWidth + horizontalSpacing)),
              initialY + (row * (cardHeight + verticalSpacing)),
            ),
          ),
    ]);
  }

  void selectCard(PlayCard playCard) {
    selectedCards.add(playCard);
    if (selectedCards.length < 2) {
      return;
    }

    attempts++;
    if (selectedCards[0].secretColor == selectedCards[1].secretColor) {
      selectedCards[0].selfDestruct();
      selectedCards[1].selfDestruct();
    }

    selectedCards.removeLast();
    selectedCards.removeLast();
  }

  void over() {}
}
