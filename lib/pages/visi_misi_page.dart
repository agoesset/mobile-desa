import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar

class VisiMisiDesaScreen extends StatelessWidget {
  const VisiMisiDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D), // Warna hijau tua untuk header
        title: const Text(
          'Visi & Misi Desa',
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
                  child: Column( // Gunakan Column untuk menampung Visi dan Misi secara terpisah
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visi Desa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Terwujudnya desa [Nama Desa] yang maju, mandiri, sejahtera, dan berbudaya.',
                        style: AppTextStyles.contentText,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Misi Desa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '- Meningkatkan kualitas sumber daya manusia melalui pendidikan dan pelatihan.\n'
                        '- Mengembangkan potensi ekonomi desa berbasis kearifan lokal.\n'
                        '- Meningkatkan infrastruktur desa yang memadai dan berkelanjutan.\n'
                        '- Memperkuat tata kelola pemerintahan desa yang transparan dan akuntabel.\n'
                        '- Melestarikan nilai-nilai budaya dan kearifan lokal.',
                        style: AppTextStyles.contentText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // Tambahkan BottomNavBar di sini
    );
  }
}