import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'loading_widget.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../pages/detail_product_page.dart';

class HomeProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Product product;

  const HomeProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(int.parse(price));

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Container(
        width: 163,
        height: 219,
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 132,
                  height: 138,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingWidget(
                    width: 132,
                    height: 138,
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 132,
                    height: 138,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                      size: 32,
                    ),
                  ),
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
                    title,
                    style: AppTheme.alatsiStyle(
                      fontSize: 13,
                      color: AppTheme.primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedPrice,
                    style: AppTheme.alatsiStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}