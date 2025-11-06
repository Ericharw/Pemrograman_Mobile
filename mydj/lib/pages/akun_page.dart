import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydj/componens/password_field.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});

  final String title;

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  // Controller untuk setiap field password
  final TextEditingController _currentPasswordController =
  TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // 🔹 Fungsi menyimpan password
  void _savePassword() {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sandi baru dan konfirmasi tidak cocok!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Proses penyimpanan bisa diganti sesuai kebutuhan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sandi berhasil diubah!'),
          backgroundColor: Colors.green,
        ),
      );

      // Kosongkan field
      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
    }
  }

  // 🔹 Fungsi keluar dari aplikasi
  void _exitApp() {
    // Tutup aplikasi secara langsung
    if (Platform.isAndroid) {
      SystemNavigator.pop(); // Untuk Android
    } else if (Platform.isIOS) {
      exit(0); // Untuk iOS (tidak disarankan, tapi berfungsi untuk simulasi)
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ganti Sandi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 20),

                // Sandi saat ini
                const Text('Sandi saat ini'),
                const SizedBox(height: 10),
                PasswordField(
                  controller: _currentPasswordController,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Masukkan sandi saat ini' : null,
                ),

                const SizedBox(height: 20),

                // Sandi baru
                const Text('Sandi baru'),
                const SizedBox(height: 10),
                PasswordField(
                  controller: _newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan sandi baru';
                    }
                    if (value.length < 6) {
                      return 'Sandi minimal 6 karakter';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Konfirmasi sandi baru
                const Text('Konfirmasi Sandi Baru'),
                const SizedBox(height: 10),
                PasswordField(
                  controller: _confirmPasswordController,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Masukkan konfirmasi sandi baru' : null,
                ),

                const SizedBox(height: 30),

                // Tombol Simpan
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _savePassword,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Section Keluar
                const Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 20),

                // Tombol Keluar dari Aplikasi
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _exitApp,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Keluar dari Aplikasi',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
