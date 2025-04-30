import 'package:flutter/material.dart';
import '../models/produk_card.dart';
import '../theme/app_theme.dart'; // Import tema aplikasi Anda

class ProdukCard extends StatelessWidget { // Ganti nama kelas menjadi ProdukCard
  final Product product;

  const ProdukCard({
    Key? key,
    required this.product,
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
                product.imageUrl,
                width: 132,
                height: 138,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
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
                      'Rp ${product.price.toStringAsFixed(0)}',
                      style: AppTheme.alatsiStyle(
                        fontSize: 13,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika tombol pesan di sini
                        print('Pesan produk: ${product.title}');
                        // Anda bisa menambahkan fungsi untuk membuka chat, dll.
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