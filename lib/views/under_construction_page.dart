import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

import '../utils/app_colors.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colors['primary-1'], // Background color
      body: Stack(
        children: [
          Column(
            children: [
              // Add the custom status bar at the top
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Under Construction Image
                      Image.asset(
                        'assets/images/under_construction_01.webp', // Replace with your image
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),
                      // "Under Construction" Text
                      Text(
                        'Under Construction',
                        style: TextStyle(
                          color: AppColors.greys['grey-900'],
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Description Text
                      Text(
                        'This page is currently under development.\nPlease check back later.',
                        style: TextStyle(
                          color: AppColors.greys['grey-900'],
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // "Home" Button
                      SizedBox(
                        width: 150, // Button width
                        height: 48, // Match your button height
                        child: CustomButton(
                          text: 'HOME',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/home'); // Navigate back to HomePage
                          },
                          filled: true,
                          fillColor: 'grey-900',
                          textColor: 'grey-100',
                          borderColor: 'grey-900',
                          textStyle: TextStyle(
                            color: AppColors.greys['grey-100'],
                            fontSize: 18,
                          ),
                        ),
                      ),
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
