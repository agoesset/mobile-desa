import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF0F2A1D);
  static const secondaryColor = Color(0xFFE8EFDC);
  static const textGrey = Color(0xFF929292);

  static TextStyle alatsiStyle({
    double fontSize = 14,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    try {
      return GoogleFonts.alatsi(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
    } catch (e) {
      // Fallback to system font if Google Fonts fails
      return TextStyle(
        fontFamily: 'Alatsi',  // Will use local Alatsi font if available
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
    }
  }

  static BoxShadow defaultShadow = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    offset: const Offset(0, 4),
    blurRadius: 4,
  );

  // Theme data for the app
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        secondary: secondaryColor,
      ),
      useMaterial3: true,
    );
  }
}