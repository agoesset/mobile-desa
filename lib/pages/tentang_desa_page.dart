import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar

class TentangDesaScreen extends StatelessWidget {
  const TentangDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D), // Warna hijau tua untuk header
        title: const Text(
          'Tentang Desa',
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
                    'Lorem Ipsum is simply dummy text of the printing and typesetting '
                    'industry. Lorem Ipsum has been the industry\'s standard dummy text ever '
                    'since the 1500s, when an unknown printer took a galley of type and '
                    'scrambled it to make a type specimen book. It has survived not only '
                    'five centuries, but also the leap into electronic typesetting, '
                    'remaining essentially unchanged. It was popularised in the 1960s with '
                    'the release of Letraset sheets containing Lorem Ipsum passages, and '
                    'more recently with desktop publishing software like Aldus PageMaker '
                    'including versions of Lorem Ipsum.\n\n'
                    'It has survived not only five centuries, but also the leap into electronic '
                    'typesetting, remaining essentially unchanged. It was popularised in the '
                    '1960s with the release of Letraset sheets containing Lorem Ipsum passages, '
                    'and more recently with desktop publishing software like Aldus PageMaker '
                    'including versions of Lorem Ipsum.',
                    style: AppTextStyles.contentText,
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