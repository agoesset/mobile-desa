import 'package:flutter/material.dart';

class OfficialCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String position;

  const OfficialCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFDC),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover, // Changed to BoxFit.cover to maintain aspect ratio
              height: 120, // Added a fixed height for better layout
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF0F2A1D),
              fontSize: 13,
              fontFamily: 'Alatsi',
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Added maxLines to handle longer names
            overflow: TextOverflow.ellipsis, // Added overflow for very long names
          ),
          Text(
            position,
            style: const TextStyle(
              color: Color(0xFF779B7F),
              fontSize: 10,
              fontFamily: 'Alatsi',
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Added maxLines for longer positions
            overflow: TextOverflow.ellipsis, // Added overflow for very long positions
          ),
        ],
      ),
    );
  }
}