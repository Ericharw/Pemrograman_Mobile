import 'game_object.dart';

class Bird extends GameObject {
  Bird(double x, double y) : super(x, y);

  void fly() {
    print('Bird is flying...');
  }

  @override
  void update() {
    print('Bird is moving...');
  }

  @override
  void render() {
    print('Rendering Bird at position ($x, $y)');
  }
}
