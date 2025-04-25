import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

import 'package:situraja_village_app/pages/home_page.dart';

class InputDesign extends StatefulWidget {
  const InputDesign({Key? key}) : super(key: key);

  @override
  State<InputDesign> createState() => _InputDesignState();
}

class _InputDesignState extends State<InputDesign> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  void _showSuccessScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          content: SizedBox(
            width: 302,
            height: 385,
            child: _buildSuccessScreenContent(context),
          ),
        );
      },
    );
  }

  Widget _buildSuccessScreenContent(BuildContext context) {
    return Container(
      width: 302,
      height: 385,
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFDC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.string(
            '''<svg width="128" height="128" viewBox="0 0 128 128" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_1_445)">
                  <path d="M71.6875 78.3813C77.909 74.5063 82.6992 68.7105 85.3334 61.8707C87.9676 55.0308 88.3025 47.5192 86.2873 40.4721C84.2722 33.425 80.0167 27.2259 74.1647 22.8127C68.3127 18.3996 61.1825 16.0124 53.853 16.0124C46.5234 16.0124 39.3933 18.3996 33.5412 22.8127C27.6892 27.2259 23.4337 33.425 21.4186 40.4721C19.4035 47.5192 19.7383 55.0308 22.3725 61.8707C25.0067 68.7105 29.7969 74.5063 36.0184 78.3813C25.7741 81.7349 16.5566 88.0006 9.14499 96.8211C8.46739 97.627 8.13768 98.669 8.22839 99.718C8.3191 100.767 8.8228 101.737 9.62868 102.415C10.4346 103.092 11.4766 103.422 12.5256 103.331C13.5746 103.24 14.5445 102.737 15.2221 101.931C25.1787 90.0445 38.9007 83.501 53.8282 83.501C68.7556 83.501 82.4776 90.0445 92.459 101.931C93.1366 102.737 94.1066 103.24 95.1555 103.331C96.2045 103.422 97.2466 103.092 98.0524 102.415C98.8583 101.737 99.362 100.767 99.4527 99.718C99.5434 98.669 99.2137 97.627 98.5361 96.8211C91.1245 88.0006 81.9071 81.7349 71.6875 78.3813ZM28.0313 49.7666C28.0313 44.6645 29.5442 39.6769 32.3788 35.4346C35.2134 31.1924 39.2424 27.8859 43.9561 25.9334C48.6699 23.9809 53.8568 23.47 58.8609 24.4654C63.865 25.4608 68.4615 27.9177 72.0693 31.5255C75.6771 35.1332 78.134 39.7298 79.1293 44.7339C80.1247 49.738 79.6139 54.9249 77.6614 59.6386C75.7089 64.3524 72.4024 68.3813 68.1601 71.2159C63.9179 74.0505 58.9303 75.5635 53.8282 75.5635C46.9888 75.5556 40.4319 72.8352 35.5957 67.9991C30.7596 63.1629 28.0392 56.6059 28.0313 49.7666ZM126.089 66.4651L110.214 82.3401C109.846 82.7091 109.408 83.0019 108.926 83.2016C108.444 83.4013 107.928 83.5041 107.406 83.5041C106.885 83.5041 106.368 83.4013 105.886 83.2016C105.405 83.0019 104.967 82.7091 104.598 82.3401L96.6609 74.4026C95.9162 73.6579 95.4978 72.6479 95.4978 71.5947C95.4978 70.5416 95.9162 69.5315 96.6609 68.7868C97.4056 68.0421 98.4156 67.6238 99.4688 67.6238C100.522 67.6238 101.532 68.0421 102.277 68.7868L107.406 73.9214L120.473 60.8493C121.218 60.1046 122.228 59.6863 123.281 59.6863C124.334 59.6863 125.344 60.1046 126.089 60.8493C126.834 61.594 127.252 62.6041 127.252 63.6572C127.252 64.7104 126.834 65.7204 126.089 66.4651Z" fill="#779B7F"/>
                </g>
                <defs>
                  <clipPath id="clip0_1_445">
                    <rect width="127" height="127" fill="white" transform="translate(0.25 0.157227)"/>
                  </clipPath>
                </defs>
              </svg>''',
            width: 80,
            height: 80,
            color: const Color(0xFF779B7F),
          ),
          const SizedBox(height: 20),
          Text(
            'Sukses',
            style: TextStyle(
              fontFamily: 'Alatsi',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF779B7F),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Sekarang kamu bisa akses ke aplikasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Alatsi',
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
              // Tambahkan navigasi atau aksi lain setelah sukses
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F2A1D),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text(
              "Lanjut ke aplikasi",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
    String placeholder, {
    bool? isMobile,
    bool? isTablet,
  }) {
    final currentIsMobile = isMobile ?? false;
    final currentIsTablet = isTablet ?? false;
    return Container(
      width: double.infinity,
      height: 52, // Tinggi input field menjadi 52
      padding: const EdgeInsets.symmetric(horizontal: 27.814),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.19), // Latar belakang input field tetap
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          style: GoogleFonts.alatsi(
            fontSize: currentIsMobile ? 16 : (currentIsTablet ? 18 : 20),
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.alatsi(
              fontSize: currentIsMobile ? 16 : (currentIsTablet ? 18 : 20),
              color: Colors.white.withOpacity(0.8),
            ),
            border: InputBorder.none,
          ),
          validator: (value) {
            return null; // Menghapus pesan wajib diisi
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth <= 991;
    final isMobile = screenWidth <= 640;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/546202988480cea8b876e85586e27be45757d038?placeholderIfAbsent=true',
              fit: BoxFit.cover,
            ),
          ),
          Container( // Overlay untuk membuat background utama lebih gelap
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          if (_isSubmitting)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 15 : (isTablet ? 20 : 23),
              vertical: isMobile ? 80 : (isTablet ? 100 : 195),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 382),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Desa Situraja',
                                style: GoogleFonts.alatsi(
                                  fontSize: isMobile ? 25 : (isTablet ? 30 : 35),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: isTablet ? 20 : 37),
                              Text(
                                'Ayo bergabung bersama\nwarga situraja dengan daftar\ndi aplikasi Desa Situraja.',
                                style: GoogleFonts.alatsi(
                                  fontSize: isMobile ? 14 : (isTablet ? 16 : 18),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: isTablet ? 20 : 37),
                              _buildInputField('Nama', isMobile: isMobile, isTablet: isTablet),
                              const SizedBox(height: 21),
                              _buildInputField('Password', isMobile: isMobile, isTablet: isTablet),
                              const SizedBox(height: 21),
                              _buildInputField('Ulangi password', isMobile: isMobile, isTablet: isTablet),
                              const SizedBox(height: 21),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: _isSubmitting
                                        ? null
                                        : () {
                                            if (_formKey.currentState!.validate()) {
                                              setState(() {
                                                _isSubmitting = true;
                                              });
                                              print('Tombol Daftar diklik (form valid)!');
                                              // Simulate a delay for processing
                                              Future.delayed(const Duration(seconds: 1), () {
                                                setState(() {
                                                  _isSubmitting = false;
                                                });
                                                _showSuccessScreenDialog(context);
                                              });
                                            }
                                          },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60, // Tinggi tombol Daftar menjadi 68
                                      padding: const EdgeInsets.symmetric(vertical: 18),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF097F57),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Daftar',
                                          style: GoogleFonts.alatsi(
                                            fontSize: isMobile ? 20 : (isTablet ? 22 : 25),
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_isSubmitting)
                                    const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(Colors.white70),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}