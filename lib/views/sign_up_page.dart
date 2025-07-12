import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';
import '../utils/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  bool isEmailInvalid = false; // State variable for email validation
  bool isPasswordInvalid = false; // State variable for password validation

  void handleSignUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validate inputs
    setState(() {
      isEmailInvalid = email.isEmpty;
      isPasswordInvalid = password.isEmpty;
    });

    if (isEmailInvalid || isPasswordInvalid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    try {
      final user = await authController.signUp(email, password);
      if (user != null) {
        if (!mounted) return; // Ensure the widget is still in the tree
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have successfully signed up!')),
        );

        // Navigate to Login Page
        Navigator.pop(context);
      }
    } catch (error) {
      if (!mounted) return; // Ensure the widget is still in the tree
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(error.toString().replaceFirst('Exception: ', ''))),
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
              // Add CustomStatusBar at the top

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
                              'SIGN UP',
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
                                ? AppColors.colors['accent-1']!
                                : Colors.white,
                            isError: isEmailInvalid,
                          ),
                          const SizedBox(height: 20),
                          // Password Field
                          CustomTextField(
                            labelText: 'Password',
                            obscureText: true,
                            controller: passwordController,
                            fillColor: isPasswordInvalid
                                ? AppColors.colors['accent-1']!
                                : Colors.white,
                            isError: isPasswordInvalid,
                          ),
                          const SizedBox(height: 40),
                          // Buttons
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: buttonWidth,
                                  height: 48, // Match CustomTextField height
                                  child: CustomButton(
                                    text: 'SIGN UP',
                                    onPressed:
                                        handleSignUp, // Call sign-up handler
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
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: buttonWidth,
                                  height: 48, // Match CustomTextField height
                                  child: CustomButton(
                                    text: 'LOG IN',
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    },
                                    filled: true,
                                    fillColor: 'grey-500',
                                    textColor: 'grey-900',
                                    borderColor: 'grey-500',
                                    textStyle: TextStyle(
                                      color: AppColors.greys['grey-900'],
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
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
