import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';
import '../utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  bool isEmailInvalid = false; // State variable for email validation
  bool isPasswordInvalid = false; // State variable for password validation

  void handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validate inputs
    setState(() {
      isEmailInvalid = email.isEmpty;
      isPasswordInvalid = password.isEmpty;
    });

    if (isEmailInvalid || isPasswordInvalid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email and password are required.')),
      );
      return;
    }

    try {
      final user = await authController.login(email, password);
      if (user != null) {
        if (!mounted) return; // Ensure the widget is still mounted
        // Redirect to the Home Page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        if (!mounted) return;
        // Highlight fields as invalid for incorrect credentials
        setState(() {
          isEmailInvalid = true;
          isPasswordInvalid = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    } catch (error) {
      if (!mounted) return;
      // Highlight fields as invalid for general errors
      setState(() {
        isEmailInvalid = true;
        isPasswordInvalid = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.greys['grey-900'],
                            ),
                          ),
                          const SizedBox(height: 100),
                          Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                color: AppColors.greys['grey-900'],
                                fontSize: 48,
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
                          // Log In Button
                          Center(
                            child: SizedBox(
                              width: buttonWidth,
                              height: 48, // Match CustomTextField height
                              child: CustomButton(
                                text: 'LOG IN',
                                onPressed: handleLogin, // Call login handler
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
                          ),
                          const SizedBox(height: 10),
                          // Sign Up Button
                          Center(
                            child: SizedBox(
                              width: buttonWidth,
                              height: 48,
                              child: CustomButton(
                                text: 'SIGN UP',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/sign-up');
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
                          ),
                          const SizedBox(height: 20),
                          // Forgot Password
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/reset-password');
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: AppColors.greys['grey-900'],
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
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
