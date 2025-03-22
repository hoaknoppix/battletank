import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/input.dart';
import 'dart:math' as math;

class Tank extends SpriteComponent with HasGameRef, KeyboardHandler {
  Tank() : super(size: Vector2(32, 32));
  
  double baseSpeed = 150.0;
  double speed = 150.0;
  bool hasShield = false;
  bool hasRapidFire = false;
  Timer? powerUpTimer;

  void applySpeedBoost() {
    speed = baseSpeed * 1.5;
    _startPowerUpTimer();
  }

  void applyShield() {
    hasShield = true;
    _startPowerUpTimer();
  }

  void applyRapidFire() {
    hasRapidFire = true;
    _startPowerUpTimer();
  }

  void _startPowerUpTimer() {
    powerUpTimer?.stop();
    powerUpTimer = Timer(
      10.0,
      onTick: _resetPowerUps,
      repeat: false,
    );
  }

  void _resetPowerUps() {
    speed = baseSpeed;
    hasShield = false;
    hasRapidFire = false;
  }

  @override
    Future<void> onLoad() async {
      sprite = await gameRef.loadSprite('images/tank.png');
    }
}