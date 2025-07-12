import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';
import '../utils/app_colors.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailInvalid = false;

  void handleResetPassword() {
    final email = emailController.text.trim();

    setState(() {
      isEmailInvalid = email.isEmpty; // Check if the email field is empty
    });

    if (isEmailInvalid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    // Mock reset password logic
    if (email == 'eve.holt@reqres.in') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset link sent to your email')),
      );
      Navigator.pop(context); // Navigate back to login page
    } else {
      // Handle invalid email
      setState(() {
        isEmailInvalid = true; // Set invalid state for incorrect email
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email not registered')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colors['primary-1'],
      body: Stack(
        children: [
          Column(
            children: [
              // Add CustomStatusBar as the first widget

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final buttonWidth =
                        constraints.maxWidth - 32; // Subtract padding

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          // Back Arrow
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context); // Navigate back to the previous page
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.greys['grey-900'],
                            ),
                          ),
                          const SizedBox(height: 100),
                          Center(
                            child: Text(
                              'RESET PASSWORD',
                              style: TextStyle(
                                color: AppColors.greys['grey-900'],
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Email Field
                          CustomTextField(
                            labelText: 'Email',
                            obscureText: false,
                            controller: emailController,
                            fillColor: isEmailInvalid
                                ? AppColors.colors[
                                    'accent-1']! // Light red for invalid input
                                : Colors.white, // Default white for valid input
                            isError: isEmailInvalid, // Show error border
                          ),
                          const SizedBox(height: 20),
                          // Reset Button
                          Center(
                            child: SizedBox(
                              width: buttonWidth,
                              height: 48, // The same height as CustomTextField
                              child: CustomButton(
                                text: 'REQUEST RESET',
                                onPressed:
                                    handleResetPassword, // Call reset password handler
                                filled: true,
                                fillColor: 'grey-900',
                                textColor: 'grey-100',
                                borderColor: 'grey-900',
                                textStyle: TextStyle(
                                  color: AppColors.greys['grey-100'],
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Positioned Logos
          Positioned(
            bottom: 20, // Adjust as necessary for spacing
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/lissy-chair-logo-dark.png',
                  width: 17,
                  height: 17,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/images/lissy-chair-text-dark.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
