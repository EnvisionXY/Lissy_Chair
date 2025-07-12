import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/mesh_gradient_background.dart';
import '../utils/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mesh Gradient Background
          const AnimatedMeshGradientBackground(),
          // Page Content
          LayoutBuilder(
            builder: (context, constraints) {
              // Measure the width of the "WELCOME" text dynamically
              final textPainter = TextPainter(
                text: TextSpan(
                  text: 'WELCOME',
                  style: TextStyle(
                    color: AppColors.greys['grey-900'],
                    fontSize: 48,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();

              final welcomeTextWidth = textPainter.width;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo Chair
                    Image.asset(
                      'assets/images/lissy-chair-logo-dark.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                    // Logo Text
                    Image.asset(
                      'assets/images/lissy-chair-text-dark.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 100),
                    // Welcome Text
                    Text(
                      'WELCOME',
                      style: TextStyle(
                        color: AppColors.greys['grey-900'],
                        fontSize: 48,
                      ),
                    ),
                    const SizedBox(height: 100),
                    // LOG IN Button with Named Route
                    SizedBox(
                      width: welcomeTextWidth,
                      child: CustomButton(
                        text: 'LOG IN',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/login'); // Use named route
                        },
                        filled: false,
                        textColor: 'grey-900',
                        borderColor: 'grey-900',
                        textStyle: TextStyle(
                          color: AppColors.greys['grey-900'],
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
