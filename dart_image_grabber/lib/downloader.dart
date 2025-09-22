import 'dart:io';
import 'package:http/http.dart' as http; // Diperlukan untuk proses mengunduh
import 'package:path/path.dart' as path; // Diperlukan untuk proses menyimpan file
class Downloader {
  static Future<String?> fetchHtml(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      }
    }
    catch (e) {
      print("Error saat mengunduh halaman: $e");
    }
    return null;
  }

  static Future<void> downloadImage(String imageUrl, String folderPath) async
  {
    try {
      final uri = Uri.parse(imageUrl);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final filename = path.basename(uri.path);
        final filePath = path.join(folderPath, filename);
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        print("✓ $filename berhasil diunduh");
      }
    } catch (e) {
      print ("Gagal mengunduh $imageUrl: $e");
  }
}
}