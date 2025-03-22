import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'dart:math';
import 'bullet.dart';

class EnemyTank extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final Random _random = Random();
  double speed = 100.0;
  double _movementDuration = 0;
  double _currentTime = 0;
  Vector2 _direction = Vector2(0, 1);
  double _shootCooldown = 2.0;
  double _timeSinceLastShot = 0;

  EnemyTank({required Vector2 position}) 
      : super(size: Vector2(32, 32), position: position);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('enemy_tank.png');
    anchor = Anchor.center;
    add(RectangleHitbox());
    _changeDirection();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _currentTime += dt;
    _timeSinceLastShot += dt;

    if (_currentTime >= _movementDuration) {
      _changeDirection();
      _currentTime = 0;
    }

    position += _direction * speed * dt;

    if (_timeSinceLastShot >= _shootCooldown) {
      shoot();
      _timeSinceLastShot = 0;
    }
  }

  void _changeDirection() {
    final directions = [
      Vector2(0, -1), // up
      Vector2(0, 1),  // down
      Vector2(-1, 0), // left
      Vector2(1, 0),  // right
    ];
    
    _direction = directions[_random.nextInt(directions.length)];
    angle = _direction.angleToSigned(Vector2(0, -1));
    _movementDuration = 1.0 + _random.nextDouble() * 2.0;
  }

  void shoot() {
    final bullet = Bullet(
      direction: _direction,
      position: position + (_direction * 20),
      angle: angle,
    );
    gameRef.add(bullet);
  }
}