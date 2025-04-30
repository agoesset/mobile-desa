import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const HomeProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 219, // Sesuaikan tinggi sesuai kebutuhan
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppTheme.defaultShadow],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 132,
                height: 138,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.alatsiStyle(
                    fontSize: 13,
                    color: AppTheme.primaryColor,
                  ),
                ),
                Text(
                  price,
                  style: AppTheme.alatsiStyle(
                    fontSize: 13,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}