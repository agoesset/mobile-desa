import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../models/news_card.dart';
import '../pages/news_detail_page.dart'; // Import NewsDetailPage
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  final List<Map<String, String>> dummyNewsData = const [
    {
      'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/dabea6320a348255392974bcbe19455fee235ebf?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
      'title': 'Perayaan HUT RI Ke-78',
      'description': 'Masyarakat melaksanakan upacara bersama bupati kab. indramayu dilapangan kantor...',
      'date': '17 Agt 2024',
    },
    {
      'imageUrl': '',
      'title': 'Judul Berita Kedua yang Lebih Panjang',
      'description': 'Deskripsi berita kedua yang mungkin lebih panjang dan memerlukan beberapa baris untuk ditampilkan...',
      'date': '17 Agt 2024',
    },
    {
      'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/d078e4043aca5f38f2d6598bb781abd8fde01b8d?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
      'title': 'Judul Berita Ketiga',
      'description': 'Deskripsi singkat untuk berita ketiga.',
      'date': '17 Agt 2024',
    },
    // Tambahkan data berita lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              'Berita Desa',
              style: AppStyles.headerTitle.copyWith(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 16, bottom: AppStyles.screenPadding, left: 16, right: 16),
        itemCount: dummyNewsData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final newsItem = dummyNewsData[index];
          return GestureDetector( // Bungkus NewsCard dengan GestureDetector
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    imageUrl: newsItem['imageUrl'] ?? '',
                    title: newsItem['title'] ?? '',
                    description: newsItem['description'] ?? '',
                    date: newsItem['date'] ?? '',
                  ),
                ),
              );
            },
            child: NewsCard(
              imageUrl: newsItem['imageUrl'] ?? '',
              title: newsItem['title'] ?? '',
              description: newsItem['description'] ?? '',
              date: newsItem['date'] ?? '',
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(), // Tambahkan BottomNavBar di sini
    );
  }
}