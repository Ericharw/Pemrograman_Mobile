import 'game_object.dart';
class Dino extends GameObject {
  Dino(double x, double y) : super(x, y);
  void jump() {
    print('Dino is jumping!');
  }
  @override
  void update() {
    print('Updating Dino position...');
  }
  @override
  void render() {
    print('Rendering Dino at position ($x, $y)');
  }
}