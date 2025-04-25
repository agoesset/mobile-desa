import 'package:flutter/material.dart';
import '../widgets/gallery_item.dart';

class GalleryDesaScreen extends StatelessWidget {
  const GalleryDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991 && screenWidth > 640;
    final isMobile = screenWidth <= 640;

    double getMaxWidth() {
      return screenWidth; // Gunakan lebar layar penuh
    }

    double getPaddingBottom() {
      if (isMobile) return 150;
      if (isTablet) return 200;
      return 252;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox.expand(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: getMaxWidth(),
              ),
              // Hapus margin horizontal
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      isMobile ? 20 : (isTablet ? 30 : 40.25),
                      isMobile ? 50 : (isTablet ? 60 : 75.878),
                      isMobile ? 20 : (isTablet ? 30 : 40.25),
                      isMobile ? 10 : (isTablet ? 15 : 17.122),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F2A1D),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFFE8EFDC),
                            size: 24,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          'Galery Desa',
                          style: TextStyle(
                            color: Color(0xFFE8EFDC),
                            fontFamily: 'Alatsi',
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: getPaddingBottom()),
                        child: Column(
                          children: [
                            GalleryItem(
                              width: screenWidth - 32, // Sesuaikan lebar GalleryItem
                              height: isMobile ? 115 : (isTablet ? 130 : 145),
                            ),
                            GalleryItem(
                              width: screenWidth - 32, // Sesuaikan lebar GalleryItem
                              height: isMobile ? 115 : (isTablet ? 130 : 145),
                            ),
                            GalleryItem(
                              width: screenWidth - 32, // Sesuaikan lebar GalleryItem
                              height: isMobile ? 115 : (isTablet ? 130 : 145),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}