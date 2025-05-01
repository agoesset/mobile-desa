import 'package:flutter/material.dart';
import '../widgets/produk_card.dart';
import '../models/produk_card.dart';
import '../pages/detail_product_page.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navbar.dart';

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
        backgroundColor: AppTheme.primaryColor,
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
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 2;
              if (constraints.maxWidth > 600) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 900) {
                crossAxisCount = 4;
              }
              double aspectRatio = 0.65;
              if (crossAxisCount == 3) {
                aspectRatio = 0.75;
              } else if (crossAxisCount == 4) {
                aspectRatio = 0.85;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 33,
                  mainAxisSpacing: 43,
                  childAspectRatio: aspectRatio,
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
                    child: ProdukCard(product: product),
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}