import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/news_page.dart';
import '../pages/information_page.dart';
import '../pages/product_listing_page.dart';
import '../pages/gallery_page.dart';
import '../pages/home_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsPage()),
              );
            },
            child: const Icon(Icons.newspaper_outlined, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InformationScreen()),
              );
            },
            child: const Icon(Icons.info_outline, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () {
              // Navigasi ke HomeScreen (jika diperlukan)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Icon(Icons.home_outlined, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListingScreen()),
              );
            },
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GalleryDesaScreen()),
              );
            },
            child: const Icon(Icons.image_outlined, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}