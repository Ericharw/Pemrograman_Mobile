import 'dino.dart';
import 'cactus.dart';
import 'game_object.dart';
// Main function to simulate game
void main() {
  // Create game objects
  var dino = Dino(0, 0);
  var cactus = Cactus(10, 0);
  // Simulate game loop
  List<GameObject> GameObjects = [dino, cactus];
  for (var obj in GameObjects) {
    obj.update();
  }
  for (var obj in GameObjects) {
    obj.render();
  }
  // Trigger specific behavior
  dino.jump();
}
