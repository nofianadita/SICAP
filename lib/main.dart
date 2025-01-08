import 'package:flutter/material.dart';
import 'pages/tambah_catatan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rekap Kegiatan Survei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    RekapitulasiPage(),
    PencarianDataPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekap Kegiatan Survei'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Log out logic here
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Rekapitulasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pencarian',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Halaman Dashboard dengan daftar fitur utama
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          // Menampilkan Statistik Ringkasan
          Card(
            elevation: 4.0,
            child: ListTile(
              title: Text('Jumlah Kegiatan Survei'),
              subtitle: Text('Total: 10 kegiatan'),
            ),
          ),
          _buildMenuButton(context, 'Tambah Kegiatan', Icons.add, () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TambahCatatan()), // Arahkan ke halaman TambahCatatan
            );
            }),
          _buildMenuButton(context, 'Rekapitulasi', Icons.list, () {
            // Navigate to Recap Screen
          }),
          _buildMenuButton(context, 'Pencarian Data', Icons.search, () {
            // Navigate to Search Screen
          }),
          _buildMenuButton(context, 'Profil', Icons.person, () {
            // Navigate to Profile Screen
          }),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, Function onPressed) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title),
        onTap: () {
          onPressed();
        },
      ),
    );
  }
}

// Halaman Rekapitulasi
class RekapitulasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Rekapitulasi Kegiatan Survei'),
    );
  }
}

// Halaman Pencarian Data
class PencarianDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pencarian Data Kegiatan Survei'),
    );
  }
}

// Halaman Profil Pengguna
class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profil Pengguna'),
    );
  }
}


