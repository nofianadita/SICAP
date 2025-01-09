import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

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

  String? errorMessage = '';

  Future<void> _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Password dan konfirmasi password tidak cocok!';
      });
      return;
    }

    try {
      final conn = await MySqlConnection.connect(ConnectionSettings(
        host: '192.168.5.3', // Ganti dengan IP MySQL server Anda
        port: 3306,
        user: 'root',
        db: 'sicap',
        password: '', // Kosongkan jika tidak ada password
      ));

      var result = await conn.query(
        'INSERT INTO users (nama, email, no_telpon, password) VALUES (?, ?, ?, ?)',
        [
          _nameController.text.trim(),
          _emailController.text.trim(),
          _phoneController.text.trim(),
          _passwordController.text.trim(),
        ],
      );

      await conn.close();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
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
            Center(
              child: Text(
                'DAFTAR',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            _buildTextField('Masukkan Nama', _nameController),
            SizedBox(height: 20),
            _buildTextField('Masukkan Email', _emailController),
            SizedBox(height: 20),
            _buildTextField('Masukkan No Telepon', _phoneController),
            SizedBox(height: 20),
            _buildPasswordField('Masukkan Password', _passwordController),
            SizedBox(height: 20),
            _buildPasswordField(
                'Masukkan Kembali Password', _confirmPasswordController),
            SizedBox(height: 20),
            if (errorMessage != null && errorMessage!.isNotEmpty)
              Center(
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _register,
                child: Text('Daftar'),
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
        border: OutlineInputBorder(),
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
        border: OutlineInputBorder(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Halaman Login'),
      ),
    );
  }
}
