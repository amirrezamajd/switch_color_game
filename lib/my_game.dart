
import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:my_first_game/player.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame with TapCallbacks{
  late Player myPlayer;
  MyGame():super(
    camera: CameraComponent.withFixedResolution(width: 600, height: 1000),
  );
  @override
  void onMount() {
    debugMode = true;

    world.add(myPlayer = Player());
    super.onMount();
  }
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    myPlayer.jump();
  }

}

