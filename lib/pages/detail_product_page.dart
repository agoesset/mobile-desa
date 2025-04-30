import 'package:flutter/material.dart';
import '../models/produk_card.dart';
import '../theme/colors.dart';
import '../theme/produk_text_style.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: const Text(
          'Detail Produk',
          style: TextStyle(
            fontFamily: 'Alatsi',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(20.0), // Tambahkan padding di dalam Container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Agar Column tidak mengambil seluruh tinggi layar
              children: [
                // Gambar Produk
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.title,
                  style: AppTextStyles.titleText,
                ),
                const SizedBox(height: 10),
                Text(
                  'Sabun daun sirih memiliki banyak manfaat untuk kesehatan, terutama untuk kebersihan dan kesehatan area kewanitaan. Daun sirih memiliki sifat antiseptik, antibakteri, dan antijamur yang dapat membantu mencegah infeksi, mengurangi bau tak sedap, serta meredakan gatal dan ruam.',
                  style: AppTextStyles.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(10), // BorderRadius lebih kecil
                        ),
                        child: Center(
                          child: Text(
                            'Pesan Sekarang',
                            style: AppTextStyles.buttonText.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Rp. ${product.price.toStringAsFixed(0)}',
                      style: AppTextStyles.priceText.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}