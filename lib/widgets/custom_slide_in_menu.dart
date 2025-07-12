import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/typography.dart';

class CustomSlideInMenu extends StatelessWidget {
  const CustomSlideInMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60, // Set the desired height
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.colors['primary-1'], // Background color
              ),
              margin: EdgeInsets.zero, // Remove default margins
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0, // Reduce vertical padding
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/lissy-chair-logo-dark.png',
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'LISSY CHAIR',
                    style: AppTypography.h2.copyWith(
                      color: AppColors.greys['grey-900'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'SEARCH',
              style: AppTypography.h3.copyWith(
                color: AppColors.greys['grey-900'],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/under-construction');
            },
          ),
          ListTile(
            title: Text(
              'MODELS',
              style: AppTypography.h3.copyWith(
                color: AppColors.greys['grey-900'],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/under-construction');
            },
          ),
          ListTile(
            title: Text(
              'CART',
              style: AppTypography.h3.copyWith(
                color: AppColors.greys['grey-900'],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/under-construction');
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              'LOG OUT',
              style: AppTypography.h3.copyWith(
                color: AppColors.greys['grey-900'],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/welcome');
            },
          ),
        ],
      ),
    );
  }
}
