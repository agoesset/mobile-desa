import 'package:flutter/material.dart';
import '../widgets/custom_list_item.dart';
import '../theme/styles.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground ,
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
                  _buildButton('Pages'),
                  const SizedBox(width: 16.0),
                  _buildButton('Aparaturs'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(
              width: double.infinity,
              child: CustomListItem(
                title: 'Tentang Desa',
                horizontalPadding: 16.0,
                verticalPadding: 14.0,
                titleFontSize: 14.0,
                iconSize: 24.0, // Anda bisa sesuaikan ukuran ikon di sini
              ),
            ),
            const SizedBox(height: 8.0),
            const SizedBox(
              width: double.infinity,
              child: CustomListItem(
                title: 'Sejarah Desa',
                horizontalPadding: 16.0,
                verticalPadding: 14.0,
                titleFontSize: 14.0,
                iconSize: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const SizedBox(
              width: double.infinity,
              child: CustomListItem(
                title: 'Visi & Misi Desa',
                horizontalPadding: 16.0,
                verticalPadding: 14.0,
                titleFontSize: 14.0,
                iconSize: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            const SizedBox(
              width: double.infinity,
              child: CustomListItem(
                title: 'Kebijakan Privasi',
                horizontalPadding: 16.0,
                verticalPadding: 14.0,
                titleFontSize: 14.0,
                iconSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
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
      ),
    );
  }
}