import 'package:flutter/material.dart';
import 'simple_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;
  String? _errorMessage;
  bool _isLoading = false;

  // username dan password
  static const demoUsername = 'Ericha';
  static const demoPassword = 'Ericha123';

  Future<void> _attemptLogin() async {
    setState(() {
      _errorMessage = null;
    });

    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      _isLoading = false;
    });

    if (username == demoUsername && password == demoPassword) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleHomePage(title: 'Jurnal Harian Guru'),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau password salah.';
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // gradien sebagai latar belakang
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF90CAF9), // biru muda
              Color(0xFF42A5F5), // biru medium
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo dan Judul
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/kemendikbud.png',
                        width: 110,
                        height: 110,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Jurnal Harian Guru',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Silakan masuk untuk melanjutkan',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Kartu form login
                  Card(
                    color: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(),
                              ),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return 'Username wajib diisi';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscure,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscure = !_obscure;
                                    });
                                  },
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Password wajib diisi';
                                }
                                if (v.length < 4) {
                                  return 'Password minimal 4 karakter';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),
                            if (_errorMessage != null)
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 8.0, top: 4),
                                child: Text(
                                  _errorMessage!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3,
                                ),
                                onPressed: _isLoading ? null : _attemptLogin,
                                child: _isLoading
                                    ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                                    : const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                _usernameController.text = demoUsername;
                                _passwordController.text = demoPassword;
                              },
                              child: const Text('Gunakan Password'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
