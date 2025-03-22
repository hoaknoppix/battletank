import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreManager extends Component with HasGameRef {
  int score = 0;
  TextComponent? scoreText;

  @override
  Future<void> onLoad() async {
    scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(10, 10),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
    gameRef.add(scoreText!);
  }

  void addScore(int points) {
    score += points;
    scoreText?.text = 'Score: $score';
  }
}