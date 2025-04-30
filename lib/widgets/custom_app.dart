import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.iconColor,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 7),
          Text(
            title,
            style: AppTextStyles.appBarTitle,
          ),
        ],
      ),
    );
  }
}