import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title; // Tambahkan properti title
  final String description;
  final String date;

  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title, // Tambahkan title di constructor
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppTheme.defaultShadow],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // Tampilkan judul
                  style: AppTheme.alatsiStyle(
                    fontSize: 16, // Ukuran font untuk judul
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Tambahkan style bold jika perlu
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4), // Tambahkan sedikit ruang antara judul dan deskripsi
                Text(
                  description,
                  style: AppTheme.alatsiStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 11,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      date,
                      style: AppTheme.alatsiStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}