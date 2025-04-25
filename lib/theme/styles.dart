import 'package:flutter/material.dart';

class AppStyles {
  static const Color backgroundColor = Colors.white;
  static const Color headerBackground = Color(0xFF0F2A1D);
  static const Color textWhite = Colors.white;

  static const double screenPadding = 48.0;
  static const double cardSpacing = 19.0;
  static const double borderRadius = 50.0;
  static const double cardBorderRadius = 10.0;

  static TextStyle get headerTitle => const TextStyle(
    fontFamily: 'Alatsi',
    color: textWhite,
    fontSize: 25.0,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get newsTitle => const TextStyle(
    fontFamily: 'Alatsi',
    fontSize: 13.0,
    color: Colors.black,
  );

  static TextStyle get newsDate => const TextStyle(
    fontFamily: 'Alatsi',
    fontSize: 6.0,
    color: Colors.black,
  );
}