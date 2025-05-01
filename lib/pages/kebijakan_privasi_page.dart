import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar

class KebijakanPrivasiScreen extends StatelessWidget {
  const KebijakanPrivasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        title: const Text(
          'Kebijakan Privasi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Alatsi',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE8EFDC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Ini adalah halaman Kebijakan Privasi. Di sini Anda dapat mencantumkan kebijakan privasi terkait dengan aplikasi dan data pengguna. '
              'Contohnya, bagaimana data dikumpulkan, digunakan, disimpan, dan dilindungi. '
              'Pastikan untuk menyesuaikan teks ini dengan kebijakan privasi aplikasi Anda yang sebenarnya.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Tambahkan BottomNavBar di sini
    );
  }
}