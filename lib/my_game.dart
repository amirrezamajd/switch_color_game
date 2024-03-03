import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:my_first_game/player.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player myPlayer;
  MyGame()
      : super(
          camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
        );
  @override
  void onMount() {
    debugMode = true;
    world.add(myPlayer = Player());

    world.add(RectangleComponent(
        position: Vector2(-300, -200), size: Vector2(50, 50)));
    world.add(RectangleComponent(
        position: Vector2(-200, 100), size: Vector2(50, 50)));
    world.add(RectangleComponent(
        position: Vector2(-100, 150), size: Vector2(50, 50)));
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    final cameraY = camera.viewfinder.position.y;
    final playerY = myPlayer.position.y;
    if (playerY < cameraY) {
      camera.viewfinder.position = Vector2(0, playerY);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    myPlayer.jump();
  }
}
