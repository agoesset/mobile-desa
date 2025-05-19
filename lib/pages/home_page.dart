import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/home_produk_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/bottom_navbar.dart';
import '../pages/news_page.dart';
import '../pages/information_page.dart';
import '../pages/product_listing_page.dart';
import '../pages/gallery_page.dart';
import '../providers/slider_provider.dart';
import '../providers/post_provider.dart';
import '../providers/product_provider.dart';
import '../providers/base_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../pages/news_detail_page.dart';
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load data when screen initializes
    Future.microtask(() {
      context.read<SliderProvider>().loadSliders();
      context.read<PostProvider>().loadHomePosts();
      context.read<ProductProvider>().loadHomeProducts();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    if (_searchController.text.trim().isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsPage(searchKeyword: _searchController.text.trim()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<SliderProvider>().loadSliders();
            context.read<PostProvider>().loadHomePosts();
            context.read<ProductProvider>().loadHomeProducts();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildHeroSection(),
                const SizedBox(height: 24),
                _buildProductSection(context),
                const SizedBox(height: 24),
                _buildNewsSection(context),
              ],
            ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListingScreen()),
                );
              },
              child: const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 28),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GalleryDesaScreen(),
                  ),
                );
              },
              child: const Icon(Icons.image_outlined, color: Colors.white, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ClipRRect(
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: AppTheme.alatsiStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Cari berita disini',
                                  hintStyle: AppTheme.alatsiStyle(
                                    fontSize: 16,
                                    color: AppTheme.textGrey,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onSubmitted: (_) => _handleSearch(),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.search, color: AppTheme.primaryColor),
                              onPressed: _handleSearch,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildHeroSection() {
    return Consumer<SliderProvider>(
      builder: (context, provider, child) {
        if (provider.state.status == Status.loading) {
          return const LoadingWidget(height: 200);
        }

        if (provider.state.status == Status.error) {
          return CustomErrorWidget(
            message: provider.state.errorMessage ?? 'Failed to load sliders',
            onRetry: () => provider.loadSliders(),
          );
        }

        final sliders = provider.state.data ?? [];
        if (sliders.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PageView.builder(
            itemCount: sliders.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              final slider = sliders[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: slider.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => const LoadingWidget(height: 200),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error_outline, size: 32),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.2),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildProductSection(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductListingScreen()),
                      );
                    },
                    child: Text(
                      'Lihat semua',
                      style: AppTheme.alatsiStyle(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (provider.state.status == Status.loading)
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) => const LoadingWidget(
                      width: 200,
                      height: 230,
                    ),
                  ),
                )
              else if (provider.state.status == Status.error)
                CustomErrorWidget(
                  message: provider.state.errorMessage ?? 'Terjadi kesalahan',
                  onRetry: () => provider.loadHomeProducts(),
                )
              else
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.homeProducts.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final product = provider.homeProducts[index];
                      return HomeProductCard(
                        imageUrl: product.image,
                        title: product.title,
                        price: product.price,
                        product: product,
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  String _stripHtml(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  Widget _buildNewsSection(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, child) {
        return Padding(
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewsPage()),
                      );
                    },
                    child: Text(
                      'Lihat semua',
                      style: AppTheme.alatsiStyle(
                        fontSize: 12,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (provider.state.status == Status.loading)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) => const LoadingWidget(height: 100),
                )
              else if (provider.state.status == Status.error)
                CustomErrorWidget(
                  message: provider.state.errorMessage ?? 'Terjadi kesalahan',
                  onRetry: () => provider.loadHomePosts(),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.homePosts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final post = provider.homePosts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(
                              imageUrl: post.image,
                              title: post.title,
                              description: post.content,
                              date: post.createdAt != null 
                                ? DateFormat('dd MMM yyyy').format(post.createdAt!)
                                : '',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 340,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (post.image.isNotEmpty)
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                                  child: Image.network(
                                    post.image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(child: Icon(Icons.image_not_supported)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (post.createdAt != null)
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 11,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            DateFormat('dd MMM yyyy').format(post.createdAt!),
                                            style: AppTheme.alatsiStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 4),
                                    Text(
                                      post.title,
                                      style: AppTheme.alatsiStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Expanded(
                                      child: Text(
                                        _stripHtml(post.content),
                                        style: AppTheme.alatsiStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}