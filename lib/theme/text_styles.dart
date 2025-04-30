import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: 'Alatsi',
    fontSize: 25,
    color: AppColors.appBarTextColor,
  );

  static const TextStyle contentText = TextStyle(
    fontFamily: 'Alatsi',
    fontSize: 12,
    color: AppColors.textColor,
  );

  // Responsive text style for app bar title
  static TextStyle getResponsiveAppBarTitle(BuildContext context) {
    return TextStyle(
      fontFamily: 'Alatsi',
      fontSize: MediaQuery.of(context).size.width <= 640 ? 20 : 25,
      color: AppColors.appBarTextColor,
    );
  }
}