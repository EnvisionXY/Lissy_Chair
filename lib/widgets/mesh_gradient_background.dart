import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import '../utils/app_colors.dart';

class AnimatedMeshGradientBackground extends StatelessWidget {
  const AnimatedMeshGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedMeshGradient(
        colors: [
          AppColors.colors['primary-1']!,
          AppColors.colors['primary-2']!,
          AppColors.colors['secondary-1']!,
          AppColors.colors['accent-1']!,
        ],
        options: AnimatedMeshGradientOptions(
          speed: 0.5, // Adjust the speed of the animation
          frequency: 0.3, // Adjust the frequency of the wave
          amplitude: 0.3, // Adjust the amplitude of the wave
          grain: 0.1, // Adds a grainy texture
        ),
      ),
    );
  }
}
