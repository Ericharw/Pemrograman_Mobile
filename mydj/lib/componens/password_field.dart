import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
