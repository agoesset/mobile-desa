import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final double width;
  final double height;

  const GalleryItem({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF779B7F),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}