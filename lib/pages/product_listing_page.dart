import 'package:flutter/material.dart';
import '../widgets/produk_card.dart'; // Pastikan path ini benar
import '../models/produk_card.dart'; // Pastikan path ini benar
import '../pages/detail_product_page.dart'; // Import ProductDetailPage (pastikan pathnya benar)
import '../theme/app_theme.dart'; // Import tema aplikasi Anda

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
      title: 'Sabun herbal daun\nsirih.',
      price: 20000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/61ec45c38cdddc0856803046a2a2adba24a95c4c?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Biji kopi arabica sukamaju.',
      price: 45000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/e43258bef29c4d71ec905f90b6d8c8f18345ff7a?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Keripik pisang manis.',
      price: 15000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/023e7100463480b99dcef47bfdc217d7955fe4ec?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Nasi goreng spesial',
      price: 25000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/675356ac7d92ef986b3091118ab48166625e9cd3?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Sabun herbal daun\nsirih.',
      price: 20000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/1cfff3d84db65d6a4eea4cbf9a4b27204c7b4589?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Biji kopi arabica sukamaju.',
      price: 45000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/7aa83c1a7f3d740ad63822eb60b9b722d06a7967?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Keripik pisang manis.',
      price: 15000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/90557ecf7dcc315cf001fcce984400981d697d41?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
    Product(
      title: 'Nasi goreng spesial',
      price: 25000,
      imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/561710dad725e3558d7c36499f6f52fa07a777f9?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // Menggunakan warna primer dari tema
        title: Text(
          'Produk Desa',
          style: AppTheme.alatsiStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 33,
              mainAxisSpacing: 43,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
                child: ProdukCard(product: product), // Menggunakan ProdukCard yang baru
              );
            },
          ),
        ),
      ),
    );
  }
}