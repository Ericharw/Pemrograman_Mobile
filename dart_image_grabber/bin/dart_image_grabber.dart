import 'dart:io';
import 'package:dart_image_grabber/image_grabber.dart';

Future<void> main(List<String> arguments) async {
  // Meminta input URL dari pengguna
  stdout.write('Masukkan URL halaman web: ');
  final url = stdin.readLineSync();

  if (url == null || url.trim().isEmpty) {
    print('URL tidak boleh kosong.');
    exit(1);
  }

  // Meminta input nama folder dari pengguna
  stdout.write('Masukkan nama folder: ');
  final folder = stdin.readLineSync();

  if (folder == null || folder.trim().isEmpty) {
    print('Nama folder tidak boleh kosong.');
    exit(1);
  }

  try {
    // Membuat instance ImageGrabber dan menjalankannya
    final grabber = ImageGrabber(url.trim(), folder.trim());
    await grabber.run();
  } catch (e) {
    print('Terjadi kesalahan tak terduga: $e');
    exit(1);
  }
}