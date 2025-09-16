import 'game_object.dart';

class GameManager {
  List<GameObject> objects = [];

  void addObject(GameObject obj) {
    objects.add(obj);
  }

  void gameLoop() {
    // Update semua objek
    for (var obj in objects) {
      obj.update();
    }
    // Render semua objek
    for (var obj in objects) {
      obj.render();
    }
  }
}
