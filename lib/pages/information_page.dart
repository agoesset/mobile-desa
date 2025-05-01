import 'package:flutter/material.dart';
import '../widgets/custom_list_item.dart';
import '../theme/styles.dart';
import '../pages/tentang_desa_page.dart';
import '../pages/sejarah_desa_page.dart';
import '../pages/visi_misi_page.dart';
import '../pages/kebijakan_privasi_page.dart';
import '../widgets/bottom_navbar.dart';
import '../models/aparaturs_card.dart'; // Import OfficialCard

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool _showAparaturs = false;

  Widget _buildButton(String text, bool isActive, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0F2A1D) : Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black87,
              fontSize: 16,
              fontFamily: 'Alatsi',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAparatursGrid() {
    // Contoh data aparat desa (ganti dengan data sebenarnya)
    final List<Map<String, String>> aparatursData = [
      {
        'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/abb4149a4e1e8042d04a8cd629476c232c88fc93?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
        'name': 'Bpk. Saca, S.Pd',
        'position': 'Kepala Desa',
      },
      {
        'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/0ae1cfb4ee725b90e325f0656af65dab196f8bb0?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
        'name': 'Bpk. [Nama Lain]',
        'position': 'Sekretaris Desa',
      },
      {
        'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/9ce4a33daba845a5cd1876fa580a445c277f7a24?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
        'name': 'Bpk. Supito',
        'position': 'Kaur Umum',
      },
      {
        'imageUrl': 'https://cdn.builder.io/api/v1/image/assets/TEMP/db84798af0a7670f398452c1cbb337df6ea95ae3?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
        'name': 'Bpk. Wahyu, S.pd',
        'position': 'Kaur Keuangan',
      },
      // Tambahkan data aparaturs lainnya di sini
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 27,
        childAspectRatio: 0.8,
      ),
      itemCount: aparatursData.length,
      itemBuilder: (context, index) {
        final data = aparatursData[index];
        return OfficialCard(
          imageUrl: data['imageUrl']!,
          name: data['name']!,
          position: data['position']!,
        );
      },
    );
  }

  Widget _buildPagesList() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TentangDesaScreen()),
            );
          },
          child: const SizedBox(
            width: double.infinity,
            child: CustomListItem(
              title: 'Tentang Desa',
              horizontalPadding: 16.0,
              verticalPadding: 14.0,
              titleFontSize: 14.0,
              iconSize: 24.0,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SejarahDesaScreen()),
            );
          },
          child: const SizedBox(
            width: double.infinity,
            child: CustomListItem(
              title: 'Sejarah Desa',
              horizontalPadding: 16.0,
              verticalPadding: 14.0,
              titleFontSize: 14.0,
              iconSize: 24.0,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VisiMisiDesaScreen()),
            );
          },
          child: const SizedBox(
            width: double.infinity,
            child: CustomListItem(
              title: 'Visi & Misi Desa',
              horizontalPadding: 16.0,
              verticalPadding: 14.0,
              titleFontSize: 14.0,
              iconSize: 24.0,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KebijakanPrivasiScreen()),
            );
          },
          child: const SizedBox(
            width: double.infinity,
            child: CustomListItem(
              title: 'Kebijakan Privasi',
              horizontalPadding: 16.0,
              verticalPadding: 14.0,
              titleFontSize: 14.0,
              iconSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.headerBackground,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Text(
              'Informasi Desa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Alatsi',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildButton(
                      'Pages',
                      !_showAparaturs,
                      () {
                        setState(() {
                          _showAparaturs = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildButton(
                      'Aparaturs',
                      _showAparaturs,
                      () {
                        setState(() {
                          _showAparaturs = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            if (_showAparaturs)
              _buildAparatursGrid()
            else
              _buildPagesList(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}