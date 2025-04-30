import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date; // Contoh format: '17 Agt 2024'

  const NewsDetailPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        title: const Text(
          'Berita Desa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container untuk Judul dan Meta Info dengan Latar Belakang Krem
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EFDC), // Warna krem muda
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Berita
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20, // Ukuran lebih kecil dari sebelumnya
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Informasi Administrator dan Tanggal
                  Row(
                    children: [
                      const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text(
                        'Administrator',
                        style: TextStyle(color: Colors.grey, fontSize: 10), // Ukuran lebih kecil
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(color: Colors.grey, fontSize: 10), // Ukuran lebih kecil
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Gambar Berita dengan Latar Belakang Krem
            if (imageUrl.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EFDC), // Warna krem muda
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            // Konten Berita
            Text(
              description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}