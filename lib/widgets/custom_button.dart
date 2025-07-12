import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled; // Add filled state
  final String textColor;
  final String borderColor;
  final String? fillColor; // Optional fill color
  final TextStyle? textStyle; // Add textStyle parameter

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.filled,
    required this.textColor,
    required this.borderColor,
    this.fillColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Color resolvedTextColor = AppColors.colors[textColor] ??
        AppColors.greys[textColor] ??
        Colors.black;
    final Color resolvedBorderColor = AppColors.colors[borderColor] ??
        AppColors.greys[borderColor] ??
        Colors.black;
    final Color? resolvedFillColor = filled && fillColor != null
        ? (AppColors.colors[fillColor!] ??
            AppColors.greys[fillColor!] ??
            Colors.transparent)
        : null;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: resolvedBorderColor, width: 2.0),
        backgroundColor: resolvedFillColor, // Use fill color if filled is true
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: resolvedTextColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
