import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:match_the_cards/src/config.dart';
import 'package:match_the_cards/src/match_the_cards_game.dart';

class PlayCard extends RectangleComponent
    with HasGameReference<MatchTheCardsGame>, TapCallbacks {
  final Color secretColor;

  PlayCard(this.secretColor, {required super.position})
      : super(
          size: Vector2(
            cardWidth,
            cardHeight,
          ),
          paint: Paint()
            ..color = Colors.black
            ..style = PaintingStyle.fill,
        );

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    game.selectCard(this);
  }

  void selfDestruct() {
    removeFromParent();

    // In this case we delete on length 2 as we delete cards in pairs
    if (game.world.children.query<PlayCard>().length <= 2) {
      game.over();
    }
  }

  void flip() {
    if (paint.color == Colors.black) {
      paint.color = secretColor;
    } else {
      paint.color = Colors.black;
    }
  }
}
