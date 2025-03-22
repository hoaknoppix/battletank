import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/battle_tank_game.dart';

void main() {
  runApp(
    const GameApp(),
  );
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battle Tank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameWidget.controlled(
        gameFactory: BattleTankGame.new,
      ),
    );
  }
}
