import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../managers/level_manager.dart';
import '../managers/score_manager.dart';

class BattleTankGame extends FlameGame with HasCollisionDetection {
  late final LevelManager levelManager;
  late final ScoreManager scoreManager;
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    scoreManager = ScoreManager();
    add(scoreManager);
    
    levelManager = LevelManager();
    add(levelManager);
    
    levelManager.loadLevel(levelData);
  }

  final levelData = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 2, 0, 0, 0, 0, 2, 1],
    [1, 0, 1, 0, 0, 1, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 1, 0, 0, 1, 0, 1],
    [1, 2, 0, 0, 0, 0, 2, 1],
    [1, 1, 1, 1, 1, 1, 1, 1],
  ];
}