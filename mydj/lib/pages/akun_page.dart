import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
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
            // Foto profil
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),

            // Nama pengguna
            const Text(
              'Ericha Rizki Wardani',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),
            const Text(
              'Mahasiswa Teknik Informatika',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Informasi akun
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blueAccent),
                      title: Text('Email'),
                      subtitle: Text('ericharizki12@gmail.com.com'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.green),
                      title: Text('Nomor Telepon'),
                      subtitle: Text('+62 857-6599-1971'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.redAccent),
                      title: Text('Alamat'),
                      subtitle: Text('Polinema, Malang'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol keluar atau edit profil
            ElevatedButton.icon(
              onPressed: () {
                // Nanti bisa diarahkan ke halaman login atau edit profil
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fitur ini belum tersedia')),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Keluar'),
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
