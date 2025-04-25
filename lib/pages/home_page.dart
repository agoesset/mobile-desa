import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product_card.dart';
import '../models/news_card.dart';
import '../pages/news_page.dart'; // Import halaman NewsPage
import '../pages/information_page.dart'; // Import halaman InformationScreen
import '../pages/product_listing_page.dart';
import '../pages/gallery_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
                  color: AppTheme.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/TEMP/88017bb3df2130f473ab066679a5ed0191291f5b?placeholderIfAbsent=true',
                                width: 36,
                                height: 44,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Desa Situraja',
                                    style: AppTheme.alatsiStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Kabupaten Indramayu',
                                    style: AppTheme.alatsiStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Tambahkan IconButton untuk info di sini
                          IconButton(
                            icon: const Icon(Icons.info_outline, color: Colors.white, size: 24),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InformationScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Selamat Datang',
                        style: AppTheme.alatsiStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Di SiturajaApps👋',
                        style: AppTheme.alatsiStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cari berita disini',
                              style: AppTheme.alatsiStyle(
                                fontSize: 16,
                                color: AppTheme.textGrey,
                              ),
                            ),
                            const Icon(Icons.filter_list_alt, color: Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Hero Image Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [AppTheme.defaultShadow],
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://cdn.builder.io/api/v1/image/assets/TEMP/ce3ab20d5161f3f6b739f3dbf8086ba3b787aeb5?placeholderIfAbsent=true',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Text(
                          'Memberikan pelayanan informasi dan transparasi untuk masyarakat desa situraja.',
                          style: AppTheme.alatsiStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Produk Desa
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shopping_cart_outlined, color: AppTheme.primaryColor),
                        const SizedBox(width: 4),
                        Text(
                          'Produk Desa',
                          style: AppTheme.alatsiStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 230,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return const ProductCard(
                            imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/908b157d0f57de7abeb3fadafd49ffd590a50b27?placeholderIfAbsent=true',
                            title: 'Sabun herbal daun sirih.',
                            price: 'Rp. 20.000',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Berita Desa
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.newspaper_outlined, color: AppTheme.primaryColor),
                            const SizedBox(width: 4),
                            Text(
                              'Berita Desa',
                              style: AppTheme.alatsiStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NewsPage()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Lihat semua',
                              style: AppTheme.alatsiStyle(
                                fontSize: 12,
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return const NewsCard(
                          title: 'Perayaan HUT',
                          imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/cea1eb811183cf0157608ef6fa9dcc641d5bfeca?placeholderIfAbsent=true',
                          description: 'Perayaan HUT RI Ke-78 Masyarakat melaksanakan upacara bersama bupati kab. indramayu dilapangan kantor...',
                          date: '17 Agt 2024',
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),

             bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: AppTheme.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsPage()),
                );
              },
              child: const Icon(Icons.newspaper_outlined, color: Colors.white, size: 28),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InformationScreen()),
                );
              },
              child: const Icon(Icons.info_outline, color: Colors.white, size: 28),
            ),
            const Icon(Icons.home_outlined, color: Colors.white, size: 28),
            GestureDetector( // Bungkus ikon shopping bag dengan GestureDetector
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListingScreen()),
                );
              },
              child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 28),
            ),
            GestureDetector( // Bungkus ikon image dengan GestureDetector
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GalleryDesaScreen()),
                );
              },
              child: const Icon(Icons.image_outlined, color: Colors.white, size: 28),
            ),
          ],
        ),
    )
    );
  }
}