import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

import '../widgets/custom_slide_in_menu.dart';
import '../widgets/custom_app_bar.dart';
import '../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomSlideInMenu(), // Slide-in menu added
      backgroundColor: AppColors.colors['primary-1'],
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/chairs/homepage_chair.jpg', // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              // Add CustomStatusBar at the top

              const CustomAppBar(), // Replace row with the reusable CustomAppBar
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      // Title
                      Text(
                        'CRAFTED FOR\nCOMFORT &\n STYLE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.greys['grey-900'],
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          height: 1,
                          fontSize: 48,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Subtitle
                      SizedBox(
                        width: 246.1,
                        child: Text(
                          'Experience superior comfort and timeless design with Lissy Chair. \nPerfect for every space. \nMake it yours.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greys['grey-900'],
                            height: 1.5,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Button
                      const SizedBox(width: 16),
                      CustomButton(
                        text: 'LEARN MORE',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/under-construction');
                        },
                        filled: true,
                        fillColor: 'primary-1',
                        textColor: 'grey-900',
                        borderColor: 'primary-1',
                        textStyle: TextStyle(
                          color: AppColors.greys['grey-900'],
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
