import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class SejarahDesaScreen extends StatelessWidget {
  const SejarahDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D), // Warna hijau tua untuk header
        title: const Text(
          'Sejarah Desa',
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
        shape: const RoundedRectangleBorder( // Tambahkan properti shape
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Atur radius untuk bagian bawah
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: screenWidth > 600 ? 568 : screenWidth * 0.95, // Lebar responsif
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EFDC), // Warna krem muda
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Ini adalah halaman Sejarah Desa. Anda dapat menambahkan informasi mengenai sejarah desa di sini. '
                    'Contohnya, asal-usul nama desa, tokoh-tokoh penting di masa lalu, peristiwa bersejarah yang pernah terjadi, '
                    'dan perkembangan desa dari waktu ke waktu. '
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s...',
                    style: AppTextStyles.contentText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}