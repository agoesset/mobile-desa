import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final double horizontalPadding;
  final double verticalPadding;
  final double titleFontSize;
  final double iconSize;

  const CustomListItem({
    Key? key,
    required this.title,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 14.0,
    this.titleFontSize = 14.0,
    this.iconSize = 24.0, // Sesuaikan ukuran ikon sesuai kebutuhan
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: const Color(0xFF779B7F),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: titleFontSize,
              fontFamily: 'Alatsi', // Pastikan font ini tersedia
            ),
          ),
          Icon(
            Icons.arrow_forward_ios, // Menggunakan ikon panah ke kanan iOS style
            color: Colors.white,
            size: iconSize,
          ),
        ],
      ),
    );
  }
}