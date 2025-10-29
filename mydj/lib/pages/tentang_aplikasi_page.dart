import 'package:flutter/material.dart';

class TentangAplikasiPage extends StatefulWidget {
  const TentangAplikasiPage({super.key, required this.title});
  final String title;

  @override
  State<TentangAplikasiPage> createState() => _TentangAplikasiPageState();
}

class _TentangAplikasiPageState extends State<TentangAplikasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Judul aplikasi
              Text(
                'MyDJ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Deskripsi singkat
              Text(
                'Aplikasi Jurnal Harian Guru',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),

              // Versi aplikasi
              Text(
                'Version: 0.1 (Beta)',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),

              // Pembuat aplikasi
              Text(
                'Dibuat oleh:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),

              Text(
                'Ericha Rizki Wardani',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Link ditampilkan sebagai teks biasa
              Text(
                'https://ericharw.github.io',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
