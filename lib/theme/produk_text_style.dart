import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle headerText = GoogleFonts.alatsi(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle titleText = GoogleFonts.alatsi(
    fontSize: 29,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryGreen,
  );

  static TextStyle descriptionText = GoogleFonts.alatsi(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryGreen,
  );

  static TextStyle buttonText = GoogleFonts.alatsi(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle priceText = GoogleFonts.alatsi(
    fontSize: 29,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryGreen,
  );
}