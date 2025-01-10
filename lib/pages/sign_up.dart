import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? errorMessage;

  Future<void> _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Password dan konfirmasi password tidak cocok!';
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2/api_sicap/registerr.php'),
        body: {
          'nama': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'no_telpon': _phoneController.text.trim(),
          'password': _passwordController.text.trim(),
        },
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200 && result['success'] == true) {
        // Navigasi ke halaman login jika berhasil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        setState(() {
          errorMessage = result['message'] ?? 'Terjadi kesalahan!';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Terjadi kesalahan: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'DAFTAR',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField('Masukkan Nama', _nameController),
            const SizedBox(height: 20),
            _buildTextField('Masukkan Email', _emailController),
            const SizedBox(height: 20),
            _buildTextField('Masukkan No Telepon', _phoneController),
            const SizedBox(height: 20),
            _buildPasswordField('Masukkan Password', _passwordController),
            const SizedBox(height: 20),
            _buildPasswordField(
                'Masukkan Kembali Password', _confirmPasswordController),
            const SizedBox(height: 20),
            if (errorMessage != null)
              Center(
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: const Text('Daftar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField(
      String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Halaman Login'),
      ),
    );
  }
}
