import 'package:flame/components.dart';
import '../components/wall.dart';
import '../components/enemy_tank.dart';

class LevelManager extends Component with HasGameRef {
  final int maxEnemies = 4;
  final List<Vector2> _spawnPoints = [];
  int _currentEnemies = 0;

  void loadLevel(List<List<int>> levelData) {
    for (var y = 0; y < levelData.length; y++) {
      for (var x = 0; x < levelData[y].length; x++) {
        if (levelData[y][x] == 1) {
          final wall = Wall(
            position: Vector2(x * 32, y * 32),
          );
          gameRef.add(wall);
        } else if (levelData[y][x] == 2) {
          _spawnPoints.add(Vector2(x * 32, y * 32));
        }
      }
    }
    _spawnEnemies();
  }

  void _spawnEnemies() {
    for (var i = 0; i < maxEnemies && i < _spawnPoints.length; i++) {
      _spawnEnemy();
    }
  }

  void _spawnEnemy() {
    if (_currentEnemies >= maxEnemies || _spawnPoints.isEmpty) return;
    
    final spawnPoint = _spawnPoints[_currentEnemies % _spawnPoints.length];
    final enemy = EnemyTank(position: spawnPoint);
    gameRef.add(enemy);
    _currentEnemies++;
  }

  void onEnemyDestroyed() {
    _currentEnemies--;
    _spawnEnemy();
  }
}