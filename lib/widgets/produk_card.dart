import 'package:flutter/material.dart';
import '../models/produk_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              product.imageUrl,
              width: double.infinity,
              height: 132,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            product.title,
            style: const TextStyle(
              fontFamily: 'Alatsi',
              fontSize: 13,
              color: Color(0xFF0F2A1D),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Rp. ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontFamily: 'Alatsi',
                fontSize: 13,
                color: Color(0xFF0F2A1D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}