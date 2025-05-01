import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan path ke HomeScreen benar

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke HomeScreen setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), // Ganti dengan halaman home Anda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://cdn.builder.io/api/v1/image/assets/TEMP/4d2bc82b7bc21c01fdcc89338138b9c1d67decb3?placeholderIfAbsent=true&apiKey=7de71166c99f40f8a9d78a85d7e09ce3',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    // Welcome Text Section
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'Alatsi',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Explore Situraja',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Alatsi',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'village',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Alatsi',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}