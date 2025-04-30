import 'package:flutter/material.dart';
import '../models/aparaturs_card.dart';

class AparatursScreen extends StatelessWidget {
  const AparatursScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2A1D),
        title: const Text(
          'Aparatur Desa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Alatsi',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView( // Bungkus seluruh body dengan SingleChildScrollView
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30), // Tambahkan sedikit ruang setelah AppBar
              // First row of cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OfficialCard(
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/abb4149a4e1e8042d04a8cd629476c232c88fc93?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
                        name: 'Bpk. Saca, S.Pd',
                        position: 'Kepala Desa',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OfficialCard(
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/0ae1cfb4ee725b90e325f0656af65dab196f8bb0?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
                        name: 'Bpk. Saca, S.Pd',
                        position: 'Kepala Desa',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
              // Second row of cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: OfficialCard(
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/9ce4a33daba845a5cd1876fa580a445c277f7a24?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
                        name: 'Bpk. Supito',
                        position: 'Humas keamana Desa',
                      ),
                    ),
                    const SizedBox(width: 21),
                    Expanded(
                      child: OfficialCard(
                        imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/db84798af0a7670f398452c1cbb337df6ea95ae3?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
                        name: 'Bpk. Wahyu, S.pd',
                        position: 'Humas keamana Desa',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}