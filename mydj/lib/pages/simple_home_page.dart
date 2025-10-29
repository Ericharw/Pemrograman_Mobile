import 'package:flutter/material.dart';
import 'lihat_jurnal_page.dart';
import 'buat_jurnal_page.dart';
import 'akun_page.dart';
import 'tentang_aplikasi_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});
  final String title;

  @override
  State<SimpleHomePage> createState() {
    // Tidak masalah bila saat ini error karena memang class _SimpleHomePageState belum kita buat.
    return _SimpleHomePageState();
  }
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  void _openLihatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LihatJurnalPage(title: 'Lihat Jurnal'),
      ),
    );
  }

  void _openBuatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BuatJurnalPage(title: 'Buat Jurnal'),
      ),
    );
  }

  void _openAkunPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AkunPage(title: 'Akun'),
      ),
    );
  }

  void _openTentangAplikasiPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const TentangAplikasiPage(title: 'Tentang Aplikasi'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan gambar di sini
            Image.asset(
              'assets/images/kemendikbud.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30), // Jarak antara gambar dan tombol
            // Baris 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _openLihatJurnalPage(context),
                  child: const Text('Lihat Jurnal'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _openBuatJurnalPage(context),
                  child: const Text('Buat Jurnal'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Baris 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _openAkunPage(context),
                  child: const Text('Akun'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                onPressed: () => _openTentangAplikasiPage(context),
                child: const Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
