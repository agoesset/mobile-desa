import 'package:flutter/material.dart';
import '../theme/styles.dart';

class NewsItem extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String title;
  final String description;

  const NewsItem({
    Key? key,
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Tambahkan margin vertikal
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppStyles.cardBorderRadius),
      ),
      child: Column( // Ganti Stack dengan Column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppStyles.cardBorderRadius)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 100, // Sesuaikan tinggi gambar
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(child: Icon(Icons.image_not_supported)),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/1491c50090b0979ef868582983da84cf93bca9b0?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
                      width: 11,
                      height: 11,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      date,
                      style: AppStyles.newsDate,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppStyles.newsTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppStyles.newsTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}