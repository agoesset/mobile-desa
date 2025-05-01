import 'package:flutter/material.dart';
import '../models/produk_card.dart';
import '../theme/app_theme.dart';

class ProdukCard extends StatelessWidget {
  final Product product;

  const ProdukCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        return Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [AppTheme.defaultShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Tambahkan ini agar Column tidak mengambil ruang tak terbatas
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: cardWidth * 0.6, // Sesuaikan rasio tinggi gambar awal
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: cardWidth * 0.6,
                      width: double.infinity,
                      child: const Center(
                        child: Icon(Icons.broken_image_outlined),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTheme.alatsiStyle(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp ${product.price.toStringAsFixed(0)}',
                          style: AppTheme.alatsiStyle(
                            fontSize: 12,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print('Pesan produk: ${product.title}');
                            // Tambahkan logika tombol pesan di sini
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            textStyle: const TextStyle(fontSize: 9),
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
      },
    );
  }
}