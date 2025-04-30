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
              fit: BoxFit.contain,
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
          ),
          Text(
            position,
            style: const TextStyle(
              color: Color(0xFF779B7F),
              fontSize: 10,
              fontFamily: 'Alatsi',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}