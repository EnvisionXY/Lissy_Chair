import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/typography.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText; // Determines if text is obscured initially
  final TextEditingController? controller;
  final Color fillColor;
  final bool isError;

  const CustomTextField({
    required this.labelText,
    this.obscureText = false, // Default: not obscured
    this.controller,
    this.fillColor = Colors.white,
    this.isError = false,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // Initialize with the provided value
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText; // Toggle visibility state
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppTypography.p1Regular.copyWith(
          color: AppColors.greys['grey-900'],
        ),
        filled: true,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: widget.isError
              ? BorderSide(width: 2, color: AppColors.colors['accent-2']!)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2,
            color: widget.isError
                ? AppColors.colors['accent-2']!
                : AppColors.colors['primary-1']!,
          ),
        ),
        // Show the visibility toggle only if the field is a password field
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: _toggleObscureText,
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.greys['grey-900'],
                ),
              )
            : null, // No suffix icon for non-password fields
      ),
    );
  }
}
