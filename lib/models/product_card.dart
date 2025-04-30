import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 235, // Tambah tinggi untuk menampung tombol
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
            right: 16, // Tambahkan right agar tombol tidak terlalu mepet
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
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: AppTheme.alatsiStyle(
                        fontSize: 13,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika tombol pesan di sini
                        print('Pesan produk: $title');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        textStyle: const TextStyle(fontSize: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Pesan',
                        style: TextStyle(color: Colors.white),
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