import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'wall.dart';

class Bullet extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final Vector2 direction;
  final double speed = 300;

  Bullet({
    required this.direction,
    required Vector2 position,
    required double angle,
  }) : super(size: Vector2(8, 8)) {
    this.position = position;
    this.angle = angle;
  }

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += direction * speed * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Wall) {
      removeFromParent();
    }
  }
}