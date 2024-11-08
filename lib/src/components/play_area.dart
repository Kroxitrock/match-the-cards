import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:match_the_cards/src/match_the_cards_game.dart';

class PlayArea extends RectangleComponent
    with HasGameReference<MatchTheCardsGame> {
  PlayArea()
      : super(
          paint: Paint()..color = const Color(0xfff2e8cf),
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
    return null;
  }
}
