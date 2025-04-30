import 'package:flutter/material.dart';
import '../widgets/custom_list_item.dart';
import '../theme/styles.dart';
import '../pages/tentang_desa_page.dart';
import '../pages/sejarah_desa_page.dart';
import '../pages/visi_misi_page.dart';
import '../pages/kebijakan_privasi_page.dart';
import '../pages/aparaturs_page.dart'; // Import halaman AparatursScreen

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              'Informasi Desa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Alatsi',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: _buildButton('Pages')), // Bungkus tombol 'Pages' dengan Expanded
                  const SizedBox(width: 16.0),
                  Expanded( // Bungkus GestureDetector dan tombol 'Aparaturs' dengan Expanded
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AparatursScreen()),
                        );
                      },
                      child: _buildButton('Aparaturs'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TentangDesaScreen()),
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: CustomListItem(
                  title: 'Tentang Desa',
                  horizontalPadding: 16.0,
                  verticalPadding: 14.0,
                  titleFontSize: 14.0,
                  iconSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SejarahDesaScreen()),
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: CustomListItem(
                  title: 'Sejarah Desa',
                  horizontalPadding: 16.0,
                  verticalPadding: 14.0,
                  titleFontSize: 14.0,
                  iconSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VisiMisiDesaScreen()),
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: CustomListItem(
                  title: 'Visi & Misi Desa',
                  horizontalPadding: 16.0,
                  verticalPadding: 14.0,
                  titleFontSize: 14.0,
                  iconSize: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KebijakanPrivasiScreen()),
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: CustomListItem(
                  title: 'Kebijakan Privasi',
                  horizontalPadding: 16.0,
                  verticalPadding: 14.0,
                  titleFontSize: 14.0,
                  iconSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0F2A1D),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Alatsi',
          ),
        ),
      ),
    );
  }
}