import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/typography.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // Group logo and text together
            children: [
              Image.asset(
                'assets/images/lissy-chair-logo-dark.png', // Replace with your image
                width: 26.0,
                height: 26.0,
              ),
              const SizedBox(
                  width: 8), // Add some spacing between logo and text
              Text(
                'LISSY CHAIR',
                style: AppTypography.h2.copyWith(
                  color: AppColors.greys['grey-900'],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer
            },
            icon: Icon(
              Icons.menu,
              color: AppColors.greys['grey-900'],
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
