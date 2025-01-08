import 'package:flutter/material.dart';

class TambahCatatan extends StatefulWidget {
  const TambahCatatan({Key? key}) : super(key: key);

  @override
  State<TambahCatatan> createState() => _TambahCatatanState();
}

class _TambahCatatanState extends State<TambahCatatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Judul
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Judul',
                ),
              ),
              const SizedBox(height: 16),
              // Deskripsi
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              // Tempat
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Tempat',
                ),
              ),
              const SizedBox(height: 16),
              // Anggota/Tim
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Anggota/Tim',
                ),
              ),
              const SizedBox(height: 16),
              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  // Implementasi menyimpan catatan
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
