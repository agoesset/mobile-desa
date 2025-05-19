import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart'; // Pastikan path ini benar
import '../widgets/bottom_navbar.dart'; // Import BottomNavBar
import '../providers/photo_provider.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../providers/base_state.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryDesaScreen extends StatefulWidget {
  const GalleryDesaScreen({Key? key}) : super(key: key);

  @override
  State<GalleryDesaScreen> createState() => _GalleryDesaScreenState();
}

class _GalleryDesaScreenState extends State<GalleryDesaScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PhotoProvider>().loadPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // Menggunakan warna primer dari tema
        title: Text(
          'Galeri Desa',
          style: AppTheme.alatsiStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Membuat ujung bawah melengkung
          ),
        ),
      ),
      body: Consumer<PhotoProvider>(
        builder: (context, provider, child) {
          if (provider.state.status == Status.loading) {
            return const Center(child: LoadingWidget());
          }

          if (provider.state.status == Status.error) {
            return CustomErrorWidget(
              message: provider.state.errorMessage ?? 'Failed to load photos',
              onRetry: () => provider.loadPhotos(),
            );
          }

          final photos = provider.photos;
          if (photos.isEmpty) {
            return Center(
              child: Text(
                'Tidak ada foto',
                style: AppTheme.alatsiStyle(
                  fontSize: 16,
                  color: AppTheme.textGrey,
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.loadPhotos(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ...photos.map((photo) => Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: photo.fullImageUrl,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 250.0,
                              placeholder: (context, url) => const LoadingWidget(height: 250),
                              errorWidget: (context, url, error) => Container(
                                height: 250,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(Icons.error_outline, size: 32),
                                ),
                              ),
                            ),
                            // Gradasi hitam di bawah
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: 80,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black87,
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Caption di atas gradasi
                            Positioned(
                              left: 24,
                              right: 24,
                              bottom: 24,
                              child: Text(
                                photo.caption,
                                style: AppTheme.alatsiStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  )).toList(),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(), // Tambahkan BottomNavBar di sini
    );
  }
}