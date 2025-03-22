import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class Wall extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Wall({
    required Vector2 position,
    Vector2? size,
  }) : super(
          position: position,
          size: size ?? Vector2(32, 32),
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('wall.png');
    add(RectangleHitbox());
  }
}