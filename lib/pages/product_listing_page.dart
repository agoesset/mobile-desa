import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/produk_card.dart';
import '../pages/detail_product_page.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../providers/product_provider.dart';
import '../providers/base_state.dart';
import '../models/product.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().loadProducts();
    });
  }

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
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            if (provider.state.status == Status.loading) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 33,
                  mainAxisSpacing: 43,
                  mainAxisExtent: 350,
                ),
                itemCount: 4,
                itemBuilder: (context, index) => const LoadingWidget(),
              );
            }

            if (provider.state.status == Status.error) {
              return CustomErrorWidget(
                message: provider.state.errorMessage ?? 'Terjadi kesalahan',
                onRetry: () => provider.loadProducts(),
              );
            }

            final products = provider.state.data ?? [];
            if (products.isEmpty) {
              return Center(
                child: Text(
                  'Tidak ada produk',
                  style: AppTheme.alatsiStyle(
                    fontSize: 16,
                    color: AppTheme.textGrey,
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;
                  if (constraints.maxWidth > 600) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth > 900) {
                    crossAxisCount = 4;
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 33,
                      mainAxisSpacing: 43,
                      mainAxisExtent: 350,
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
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}