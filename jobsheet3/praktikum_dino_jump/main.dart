import 'dino.dart';
import 'cactus.dart';
import 'bird.dart';
import 'game_object.dart';

void main() {
  var dino = Dino(0, 0);
  var cactus = Cactus(10, 0);
  var bird = Bird(15, 5);

  // Kumpulkan semua objek game ke dalam list
  List<GameObject> gameObjects = [dino, cactus, bird];

  // Update semua objek
  for (var obj in gameObjects) {
    obj.update();
  }

  // Render semua objek
  for (var obj in gameObjects) {
    obj.render();
  }

  // Trigger aksi spesifik
  dino.jump();
  bird.fly();
}
