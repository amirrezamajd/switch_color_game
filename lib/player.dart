
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent{
  Player({this.playerSize = 15});
  final _velocity = Vector2.zero();
  final _gravity = 980.0;
  final _jumpSpeed = 350.0;
  final double playerSize;
  @override
  void onMount() {
    position = Vector2.zero();
    size = Vector2.all(playerSize*2);
    anchor = Anchor.center;
    super.onMount();
  }
  @override
  void update(double dt) {
    super.update(dt);
    // position+=_velocity*dt;
    // _velocity.y += _gravity*dt;
  }
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle((size/2).toOffset(), playerSize, Paint()..color=Colors.lightBlueAccent);
  }
  void jump(){
    _velocity.y = -_jumpSpeed;
  }
}