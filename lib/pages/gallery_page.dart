import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; // Pastikan path ini benar

class GalleryDesaScreen extends StatelessWidget {
  const GalleryDesaScreen({Key? key}) : super(key: key);

  final String appBarTitle = 'Galeri Desa'; // Judul AppBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // Menggunakan warna primer dari tema
        title: Text(
          appBarTitle,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Tambahkan sedikit padding horizontal
        child: Column(
          children: [
            const SizedBox(height: 22.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/a102e29c1ad9f70d25c686a415b0436fe33760d1?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 10.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/323d89e0629c67b367c59cb8621848c301df5836?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 10.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/86f0e065ef9f8fb1ca6ea8cc741cc491bb7cde85?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 10.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/207d038e75269fe6e5ea33501ae4572006597c8f?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 10.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/75d07dfdd0df66b0dad12ed68596f83fff3c3dac?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 10.0),
            _buildGalleryImage(context, 'https://cdn.builder.io/api/v1/image/assets/TEMP/a9cb335db190bdf0236b0c7982155af597d0d09c?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3'),
            const SizedBox(height: 89.0), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryImage(BuildContext context, String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width, // Lebar sesuai dengan lebar layar
        height: 200.0, // Atur tinggi sesuai keinginan Anda
      ),
    );
  }
}