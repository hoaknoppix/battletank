import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'tank.dart';

enum PowerUpType {
  speed,
  shield,
  rapidFire,
}

class PowerUp extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final PowerUpType type;

  PowerUp({
    required this.type,
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(24, 24),
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('power_up_${type.name}.png');
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Tank) {
      _applyPowerUp(other);
      removeFromParent();
    }
  }

  void _applyPowerUp(Tank tank) {
    switch (type) {
      case PowerUpType.speed:
        tank.applySpeedBoost();
        break;
      case PowerUpType.shield:
        tank.applyShield();
        break;
      case PowerUpType.rapidFire:
        tank.applyRapidFire();
        break;
    }
  }
}